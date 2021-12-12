module projeto (clock, dado, instrucao, botao, LEDS, unidade, dezena);
    input clock, botao;
    input [3:0] dado, instrucao;
    output [7:0] LEDS;
    output [6:0] unidade, dezena;

    wire button_tx, tx_uart;

    button BT(clock, botao, button_tx);
    tx TX(clock, button_tx, dado, instrucao, tx_uart);
    rx RX(clock, tx_uart, LEDS, unidade, dezena);
	 
endmodule