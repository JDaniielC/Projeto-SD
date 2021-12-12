module button(clock, in, out);

input clock, in;
output reg out;

parameter [1:0] off = 0, on = 1, action = 2;

reg [1:0] nextState, state;

always@(posedge clock) begin 
    state <= nextState;
end

always@(*) begin
    case (state)
        off: begin
            out <= 0;
            if (in == 0) nextState <= off;
            else nextState <= on;
        end

        on: begin
            out <= 0;
            if (in == 0) nextState <= action;
            else nextState <= on;
        end

        action: begin
            out <= 1;
            nextState <= off;
        end

        default: begin
            out <= 0;
            if (in == 0) nextState <= off;
            else nextState <= on;
        end
    endcase
end

endmodule
