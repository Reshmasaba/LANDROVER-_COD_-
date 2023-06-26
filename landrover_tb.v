module pair_detect_tb;
  reg clk;
  reg inbits;
  reg reset;
  wire detect;

  pair_detect dut (
    .clk(clk),
    .inbits(inbits),
    .reset(reset),
    .detect(detect)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    inbits = 0;
    reset = 1;
    #10 reset = 0;  // Deassert reset after 10 time units

    // Test case 1: No pattern detected
    #15 inbits = 0;
    #20 inbits = 1;
    #20 inbits = 0;
    #20 inbits = 1;
    #20 inbits = 1;
    #20 inbits = 0;

    // Test case 2: Pattern detected
    #20 inbits = 1;
    #20 inbits = 1;
    #20 inbits = 0;
    #20 inbits = 1;
    #20 inbits = 1;
    #20 inbits = 1;
    #20 inbits = 0;

    // Add more test cases if needed

    #10 $finish;  // End simulation after 10 time units
  end
endmodule
