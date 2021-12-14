module rx (clock, in, LEDS, unidade, dezena, entrada);
    input clock, in;
    output [7:0] LEDS;
    output [6:0] unidade, dezena;
    output entrada;

    wire [3:0] dado_uart, instrucao_uart, dec7Seg; 
    wire [7:0] led;
    wire [6:0] out1, out2;
    wire clear;

    uart UART(in, dado_uart, instrucao_uart, clock, entrada);
    tratar TRATAR(instrucao_uart, dado_uart, clock, led, dec7Seg, clear);
    seg7 SEG(dec7Seg, out1, out2, clear);

    assign LEDS = led;
    assign unidade = out1;
    assign dezena = out2;
    
endmodule