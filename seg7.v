module seg7(in, out1, out2, clear);
    input clear;
    input [3:0] in;
    output reg [6:0] out1, out2;

    always@(*)begin
        case(in)
            0: out1 = 7'b0000001;
            1: out1 = 7'b1001111;
            2: out1 = 7'b0010010;
            3: out1 = 7'b0000110;
            4: out1 = 7'b1001100;
            5: out1 = 7'b0100100;
            6: out1 = 7'b1100000;
            7: out1 = 7'b0001111;
            8: out1 = 7'b0000000;
            9: out1 = 7'b0001100;
            10: out1 = 7'b0000001;
            11: out1 = 7'b1001111;
            12: out1 = 7'b0010010;
            13: out1 = 7'b0000110;
            14: out1 = 7'b1001100;
            15: out1 = 7'b0100100;
        endcase
        if (clear) 
            out1 = 7'b1111111;
    end

    always@(*)begin
        case(in)
            0: out2 = 7'b0000001;
            1: out2 = 7'b0000001;
            2: out2 = 7'b0000001;
            3: out2 = 7'b0000001;
            4: out2 = 7'b0000001;
            5: out2 = 7'b0000001;
            6: out2 = 7'b0000001;
            7: out2 = 7'b0000001;
            8: out2 = 7'b0000001;
            9: out2 = 7'b0000001;
            10: out2 = 7'b1001111;
            11: out2 = 7'b1001111;
            12: out2 = 7'b1001111;
            13: out2 = 7'b1001111;
            14: out2 = 7'b1001111;
            15: out2 = 7'b1001111;
        endcase
        if (clear) 
            out2 = 7'b1111111;
    end

endmodule