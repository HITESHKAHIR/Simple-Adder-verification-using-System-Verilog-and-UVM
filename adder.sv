`define width 8

module adder(
  input logic clk, 
  input logic reset,
  input logic[`width-1:0] A,
  input logic[`width-1:0] B,
  output logic[`width:0] sum);
               
  always @(posedge clk) begin
    if(reset)
      begin
        sum=5'b0;
      end
    else
      begin
        sum=A+B;
      end
  	end
endmodule
               
                     
                 
               
            
                           
