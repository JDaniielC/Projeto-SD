module tx (clock, botao, dado, instrucao, out);

    input clock, botao;
    input [3:0] dado, instrucao;
    output out;

    wire button_tx, tx_uart;

    button BT(clock, botao, button_tx);
    transmitir TRANS(clock, button_tx, dado, instrucao, out);

endmodule