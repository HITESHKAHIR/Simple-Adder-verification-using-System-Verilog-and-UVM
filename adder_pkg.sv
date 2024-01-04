`define width 8

`include "adder_intf.sv"
package adder_pkg;
	

	import uvm_pkg::*;
	`include "uvm_macros.svh"
	`include "adder_seq_item.sv"
	`include "adder_seq.sv"
	`include "adder_seqr.sv"
	`include "adder_driver.sv"
	`include "adder_mon.sv"
	`include "adder_agent.sv"
	`include "adder_sb.sv"
	`include "adder_env.sv"
	`include "adder_test.sv"
	

endpackage
