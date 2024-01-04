`include "uvm_macros.svh"
import uvm_pkg::*;
import adder_pkg::*;
`include "adder_test.sv"

module top;
 
  bit clk;
  bit reset;
   
  always #5 clk = ~clk;
   
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  adder_inf intf(clk,reset);
  
  adder dut (
   	.clk(intf.clk),
    .reset(intf.reset),
    .A(intf.A),
    .B(intf.B),
    .sum(intf.sum));
  
  initial begin
    uvm_config_db#(virtual adder_inf)::set(uvm_root::get(),"*","vif",intf);
    $dumpfile("dump.vcd"); $dumpvars;
  end
   
  initial begin
    run_test("adder_test");
  end
endmodule