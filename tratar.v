module tratar (instrucao, dado, clock, led, dec7Seg, clear);

    input clock;
    input [3:0] instrucao, dado;

    output reg clear = 0;
    output reg [3:0] dec7Seg;
    output reg [7:0] led;

    reg [2:0] state, nextState;
    reg [3:0] guardado;
    
    parameter uart = 0, limpar = 1, carregar = 2, mostrar = 3;

    always @(posedge clock) begin
        state <= nextState;
    end

    always @(posedge clock) begin
        case (state)
            uart: begin
                case (instrucao)
                    1: nextState = limpar;
                    2: nextState = carregar; 
                    4: nextState = mostrar;
                endcase
            end 
            
            limpar: begin
                clear <= 1;
                nextState = uart;
            end

            carregar: begin
                guardado <= dado;
                nextState = uart;
            end

            mostrar: begin
                dec7Seg <= guardado;
                nextState = uart;
            end
        endcase
        led = {dado, instrucao};
    end
    
endmodule