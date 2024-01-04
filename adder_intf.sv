  interface adder_inf(input logic clk,reset);
  
  logic[`width-1:0] A;
  logic[`width-1:0] B;
  logic[`width:0] sum;
  
  clocking drv_cb @(posedge clk);
    default input #1 output #1;
    output A; 
    output B;
    input sum;
  endclocking
  
  clocking mon_cb @(posedge clk);
    default input #1 output #1;
    input A;
    input B;
    input sum; 
  endclocking
      
  modport drv_mp (clocking drv_cb, input clk, reset);
  modport mon_mp (clocking mon_cb, input clk,reset);

endinterface 
    