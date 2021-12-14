module teste (clock, dado, instrucao, botao, saida, entrada, dado_uart, instrucao_uart);
    input clock, botao;
    input [3:0] dado, instrucao;
    wire tx_uart;
    output [3:0] dado_uart, instrucao_uart;
    output saida, entrada;

    tx TX(clock, botao, dado, instrucao, tx_uart);
    uart UART(tx_uart, dado_uart, instrucao_uart, clock, entrada);

    assign saida = tx_uart;

endmodule
