module pair_detect (clk, inbits, detect, reset);
  input clk;
  input inbits;
  input reset;
  output reg detect;
  
  reg [1:0] state;
  
  initial begin
    state = 3'b000;
  end 
  
  always @(posedge clk, posedge reset ) begin 
    if (reset)
      state <= 3'b000;
    else begin
      case (state)
        3'b000: begin
          if (inbits) state <= 3'b001;
          else state <= 3'b000;
        end
        3'b001: begin
          if (inbits) state <= 3'b010;
          else state <= 3'b011;
        end
        3'b010: begin
          if (inbits) state <= 3'b011;
          else state <= 3'b010;	
        end
        3'b011: begin
          if (inbits) state <= 3'b100;
          else state <= 3'b101;
        end
        3'b100: begin
          if (inbits) state <= 3'b101;
          else state <= 3'b110;
        end
        3'b101: begin
          if (inbits) state <= 3'b111;
          else state <= 3'b110;
        end
        3'b110: begin
          if (inbits) state <= 3'b111;
          else state <= 3'b110;
        end	
        3'b111: begin
          if (inbits) state <= 3'b011;
          else state <= 3'b100;
        end 
      endcase
    end
  end
 
  always @(posedge clk, posedge reset) begin
    if (reset)
      detect <= 0;
    else if (state == 3'b111)
      detect <= 1;
    else
      detect <= 0;
  end
endmodule
