module projeto (clock, dado, instrucao, botao);
    input clock, botao;
    input [3:0] dado, instrucao;

    wire button_tx;
    button BT(clock, botao, button_tx);
    
endmodule