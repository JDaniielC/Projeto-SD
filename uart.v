module uart (in, dado, instrucao, clock);
    input in, clock;
    output reg [3:0] dado, instrucao;
    reg [1:0] state, nextState;
    reg [3:0] tempo;
    parameter idle = 0, atribucao = 1;

    always @(posedge clock) begin
        state <= nextState;
    end

    always @(posedge clock) begin  
        case (state)
            0: begin
                if (~in) 
                    nextState <= atribucao;   
                else 
                    nextState <= idle;
            end

            1: begin
                case (tempo)
                    0: dado[0] <= in;
                    1: dado[1] <= in;
                    2: dado[2] <= in;
                    3: dado[3] <= in;
                    4: instrucao[0] <= in;
                    5: instrucao[1] <= in;
                    6: instrucao[2] <= in;
                    7: instrucao[3] <= in;
                    default: begin
                        nextState <= idle;
                        tempo = 0;
                    end
                endcase
                tempo = tempo + 1;
            end
        endcase
    end

endmodule