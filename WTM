`timescale 1ns / 1ps

module wtm(
    input [7:0] A,
    input [7:0] B,
    output [15:0] product
);

    // Function for 3-input addition
    function [1:0] add3;
        input a, b, c;
        begin
            add3 = a + b + c;
        end
    endfunction

    // Function for 2-input addition
    function [1:0] add2;
        input a, b;
        begin
            add2 = a + b;
        end
    endfunction

    // Partial Products
    wire [7:0] pp [0:7];
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            assign pp[i] = {8{A[i]}} & B;
        end
    endgenerate

    // COLUMN 0
    assign product[0] = pp[0][0];

    // COLUMN 1
    wire c1;
    assign {c1, product[1]} = add2(pp[1][0], pp[0][1]);

    // COLUMN 2
    wire [1:0] s2;
    wire c2a, c2;
    assign {c2a, s2[0]} = add3(pp[2][0], pp[1][1], pp[0][2]);
    assign {c2, product[2]} = add2(s2[0], c1);

    // COLUMN 3
    wire [1:0] s3a, s3b;
    wire c3a, c3b, c3;
    assign {c3a, s3a[0]} = add3(pp[3][0], pp[2][1], pp[1][2]);
    assign {c3b, s3b[0]} = add3(pp[0][3], c2a, c2);
    assign {c3, product[3]} = add2(s3a[0], s3b[0]);

    // COLUMN 4
    wire [1:0] s4a, s4b, s4c;
    wire c4a, c4b, c4c, c4;
    assign {c4a, s4a[0]} = add3(pp[4][0], pp[3][1], pp[2][2]);
    assign {c4b, s4b[0]} = add3(pp[1][3], pp[0][4], c3a);
    assign {c4c, s4c[0]} = add3(c3b, c3, s4a[0]);
    assign {c4, product[4]} = add2(s4b[0], s4c[0]);

    // COLUMN 5
    wire [1:0] s5a, s5b, s5c, s5d;
    wire c5a, c5b, c5c, c5d, c5;
    assign {c5a, s5a[0]} = add3(pp[5][0], pp[4][1], pp[3][2]);
    assign {c5b, s5b[0]} = add3(pp[2][3], pp[1][4], pp[0][5]);
    assign {c5c, s5c[0]} = add3(c4a, c4b, c4c);
    assign {c5d, s5d[0]} = add3(c4, s5a[0], s5b[0]);
    assign {c5, product[5]} = add2(s5c[0], s5d[0]);

    // COLUMN 6
    wire [1:0] s6a, s6b, s6c, s6d, s6e;
    wire c6a, c6b, c6c, c6d, c6e, c6;
    assign {c6a, s6a[0]} = add3(pp[6][0], pp[5][1], pp[4][2]);
    assign {c6b, s6b[0]} = add3(pp[3][3], pp[2][4], pp[1][5]);
    assign {c6c, s6c[0]} = add3(pp[0][6], c5a, c5b);
    assign {c6d, s6d[0]} = add3(c5c, c5d, c5);
    assign {c6e, s6e[0]} = add3(s6a[0], s6b[0], s6c[0]);
    assign {c6, product[6]} = add2(s6d[0], s6e[0]);

    // COLUMN 7
    wire [1:0] s7a, s7b, s7c, s7d, s7e, s7f;
    wire c7a, c7b, c7c, c7d, c7e, c7f, c7;
    assign {c7a, s7a[0]} = add3(pp[7][0], pp[6][1], pp[5][2]);
    assign {c7b, s7b[0]} = add3(pp[4][3], pp[3][4], pp[2][5]);
    assign {c7c, s7c[0]} = add3(pp[1][6], pp[0][7], c6a);
    assign {c7d, s7d[0]} = add3(c6b, c6c, c6d);
    assign {c7e, s7e[0]} = add3(c6e, c6, s7a[0]);
    assign {c7f, s7f[0]} = add3(s7b[0], s7c[0], s7d[0]);
    assign {c7, product[7]} = add2(s7e[0], s7f[0]);

    // COLUMN 8
    wire [1:0] s8a, s8b, s8c, s8d, s8e, s8f;
    wire c8a, c8b, c8c, c8d, c8e, c8f, c8;
    assign {c8a, s8a[0]} = add3(pp[7][1], pp[6][2], pp[5][3]);
    assign {c8b, s8b[0]} = add3(pp[4][4], pp[3][5], pp[2][6]);
    assign {c8c, s8c[0]} = add3(pp[1][7], c7a, c7b);
    assign {c8d, s8d[0]} = add3(c7c, c7d, c7e);
    assign {c8e, s8e[0]} = add3(c7f, c7, s8a[0]);
    assign {c8f, s8f[0]} = add3(s8b[0], s8c[0], s8d[0]);
    assign {c8, product[8]} = add2(s8e[0], s8f[0]);

    // COLUMN 9
    wire [1:0] s9a, s9b, s9c, s9d, s9e, s9f;
    wire c9a, c9b, c9c, c9d, c9e, c9f;
    assign {c9a, s9a[0]} = add3(pp[7][2], pp[6][3], pp[5][4]);
    assign {c9b, s9b[0]} = add3(pp[4][5], pp[3][6], pp[2][7]);
    assign {c9c, s9c[0]} = add3(c8a, c8b, c8c);
    assign {c9d, s9d[0]} = add3(c8d, c8e, c8f);
    assign {c9e, s9e[0]} = add3(c8, s9a[0], s9b[0]);
    assign {c9f, s9f[0]} = add3(s9c[0], s9d[0], s9e[0]);
    assign product[9] = s9f[0];
    wire c9 = c9f;

    // COLUMN 10
    wire [1:0] s10a, s10b, s10c, s10d, s10e;
    wire c10a, c10b, c10c, c10d, c10e;
    assign {c10a, s10a[0]} = add3(pp[7][3], pp[6][4], pp[5][5]);
    assign {c10b, s10b[0]} = add3(pp[4][6], pp[3][7], c9a);
    assign {c10c, s10c[0]} = add3(c9b, c9c, c9d);
    assign {c10d, s10d[0]} = add3(c9e, c9, s10a[0]);
    assign {c10e, s10e[0]} = add3(s10b[0], s10c[0], s10d[0]);
    assign product[10] = s10e[0];
    wire c10 = c10e;

    // COLUMN 11
    wire [1:0] s11a, s11b, s11c, s11d;
    wire c11a, c11b, c11c, c11d;
    assign {c11a, s11a[0]} = add3(pp[7][4], pp[6][5], pp[5][6]);
    assign {c11b, s11b[0]} = add3(pp[4][7], c10a, c10b);
    assign {c11c, s11c[0]} = add3(c10c, c10d, c10e);
    assign {c11d, s11d[0]} = add3(s11a[0], s11b[0], s11c[0]);
    assign product[11] = s11d[0];
    wire c11 = c11d;

    // COLUMN 12
    wire [1:0] s12a, s12b, s12c;
    wire c12a, c12b, c12c;
    assign {c12a, s12a[0]} = add3(pp[7][5], pp[6][6], pp[5][7]);
    assign {c12b, s12b[0]} = add3(c11a, c11b, c11c);
    assign {c12c, s12c[0]} = add3(c11d, s12a[0], s12b[0]);
    assign product[12] = s12c[0];
    wire c12 = c12c;

    // COLUMN 13
    wire [1:0] s13a, s13b;
    wire c13a, c13b;
    assign {c13a, s13a[0]} = add3(pp[7][6], pp[6][7], c12a);
    assign {c13b, s13b[0]} = add3(c12b, c12c, s13a[0]);
    assign product[13] = s13b[0];
    wire c13 = c13b;

    // COLUMN 14
    wire [1:0] s14;
    wire c14;
    assign {c14, s14[0]} = add3(pp[7][7], c13a, c13b);
    assign product[14] = s14[0];
    assign product[15] = c14;

endmodule
