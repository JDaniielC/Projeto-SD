module uart (in, dado, instrucao, clock, uat);
    input in, clock;
    output reg [3:0] dado, instrucao;
    output reg uat;
    reg [1:0] state;
    reg [3:0] tempo;
    parameter idle = 0, atribucao = 1;

    always @(posedge clock) begin  
        case (state)
            idle: begin
                uat <= in;
                if (~in) 
                    state <= atribucao;   
                else 
                    state <= idle;
            end

            atribucao: begin
                uat <= in;
                case (tempo)
                    0: dado[0] <= in;
                    1: dado[1] <= in;
                    2: dado[2] <= in;
                    3: dado[3] <= in;
                    4: instrucao[0] <= in;
                    5: instrucao[1] <= in;
                    6: instrucao[2] <= in;
                    7: instrucao[3] <= in;
                endcase
                tempo = tempo + 1;
                if (tempo == 8) begin 
                    state <= idle;  
                    tempo = 0;
                end
            end
        endcase
    end
endmodule