module transmitterModule (
    input clk,
    input [7:0] data,
    input transmit,
    input reset,
    output reg TxD
);

    reg [3:0] bitCounter;
    reg [13:0] baurateCounter; //10.415 (100 Mhz)
    reg [9:0] shiftRight;
    reg state, next_state, shift, load, clear;

    always @(posedge clk) begin
        load <= 0;
        shift <= 0;
        clear <= 0;
        TxD <= 1;
        case (state)
            0: begin
                if (transmit) begin
                    next_state <= 1;
                    load <= 1;
                    shift <= 0;
                    clear <= 0;
                end
                else begin
                    next_state <= 0;
                    TxD <= 1;
                end
            end

            1: begin
                if (bitCounter == 10) begin 
                    next_state <= 0;
                    clear <= 0;
                end
                else begin
                    next_state <= 1;
                    TxD <= shiftRight[0];
                    shift <= 1;
                end
            end

            default: next_state <= 0;
        endcase
    end

    always @(posedge clk) begin 
        if (reset) begin
            state <= 0;
            bitCounter <= 0;
            baurateCounter <= 0;
        end
        else begin
            baurateCounter <= baurateCounter + 1;
            if (baurateCounter == 10415) begin
                state <= next_state;
                baurateCounter <= 0;
                if (load) 
                    shiftRight <= {1'b1, data, 1'b0};
                if (clear) 
                    bitCounter <= 0;
                if (shift)
                    shiftRight <= shiftRight>>1;
                bitCounter <= bitCounter + 1;
            end
        end
    end
            
endmodule