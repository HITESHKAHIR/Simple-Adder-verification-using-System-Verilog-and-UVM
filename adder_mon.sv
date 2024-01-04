`define mon_intf vif.mon_cb

class adder_mon extends uvm_monitor;
  
virtual adder_inf vif;

    `uvm_component_param_utils(adder_mon)
  
  uvm_analysis_port#(adder_seq_item)mon_an_port; 
  adder_seq_item trans;
  
  function new(string name, uvm_component parent); 
    super.new(name,parent);
    trans=new();
    mon_an_port=new("mon_an_port", this);
  endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual adder_inf)::get(this,"","vif",vif))
    `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase  
  
  virtual task run_phase(uvm_phase phase);
    forever begin
  
      @(posedge vif.clk);
      trans.A = `mon_intf.A;
      trans.B = `mon_intf.B;
      @(posedge vif.clk);
      trans.sum = `mon_intf.sum;
      $display("Values collected in monitor");
      trans.print();
      @(posedge vif.clk);
      mon_an_port.write(trans);
    end
  endtask: run_phase
  
endclass: adder_mon