module tx (clock, botao, dado, instrucao, out);
    
    input clock, botao;
    input [3:0] instrucao, dado;
    output reg out = 1;
    parameter verificar = 0, deboucing = 1, enviar = 2;
    reg [3:0] counter = 4'd0;
    reg [1:0] state, nextState;
    reg [3:0] tempo, A, B;

    always @(posedge clock) begin
        state <= nextState;
    end

    always @(posedge clock) begin
        case (state)
            verificar: begin
                if (botao) begin 
                    tempo = 0;
                    nextState <= deboucing;
                    counter <= 0;
                    out = 1;
                end
            end

            deboucing: begin
                if (tempo < 2) begin
                    tempo = tempo + 1;
                end
                else begin
                    A = dado;
                    B = instrucao;
                    nextState <= enviar;
                end
            end

            enviar: begin
                if (counter < 10) begin
                    nextState <= enviar;
                    case (counter)
                        0: out <= 0;
                        1: out <= A[0];
                        2: out <= A[1];
                        3: out <= A[2];
                        4: out <= A[3];
                        5: out <= B[0];
                        6: out <= B[1];
                        7: out <= B[2];
                        8: out <= B[3];
                        9: out <= 1;
                    endcase
                    counter = counter + 1;
                end
                else nextState <= verificar;
            end 
        endcase
    end

endmodule