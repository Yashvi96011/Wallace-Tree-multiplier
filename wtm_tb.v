`timescale 1ns / 1ps

module wtm_tb();


    reg [7:0] A, B;
    wire [15:0] product;
    
    wtm uut (
        .A(A),
        .B(B),
        .product(product)
    );
    
    // Dump waveforms
    initial begin
        $dumpfile("wtm_waveform.vcd");
        $dumpvars(0, wtm_tb);
    end
    
    // Test sequence
    initial begin
        $display("Time\tA\tB\tProduct\tExpected\tStatus");
      
        // Test case 1: 5 * 6 = 30
        #10 A = 5; B = 6;
        #20 $display("%0t\t%d\t%d\t%d\t%d\t%s", 
                     $time, A, B, product, A*B, 
                     (product == A*B) ? "PASS" : "FAIL");
        
        // Test case 2: 12 * 12 = 144
        #10 A = 12; B = 12;
        #20 $display("%0t\t%d\t%d\t%d\t%d\t%s", 
                     $time, A, B, product, A*B, 
                     (product == A*B) ? "PASS" : "FAIL");
        
        // Test case 3: 255 * 255 = 65025
        #10 A = 255; B = 255;
        #20 $display("%0t\t%d\t%d\t%d\t%d\t%s", 
                     $time, A, B, product, A*B, 
                     (product == A*B) ? "PASS" : "FAIL");
        
        // Test case 4: 128 * 127 = 16256
        #10 A = 128; B = 127;
        #20 $display("%0t\t%d\t%d\t%d\t%d\t%s", 
                     $time, A, B, product, A*B, 
                     (product == A*B) ? "PASS" : "FAIL");
        
        // Test case 5: 170 * 85 = 14450
        #10 A = 170; B = 85;
        #20 $display("%0t\t%d\t%d\t%d\t%d\t%s", 
                     $time, A, B, product, A*B, 
                     (product == A*B) ? "PASS" : "FAIL");
        
        #50;
       $finish;
    end

endmodule
