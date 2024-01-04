`define drv_intf vif.drv_cb

class adder_driver extends uvm_driver#(adder_seq_item);

  `uvm_component_utils(adder_driver)
  
  virtual adder_inf vif;
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual adder_inf)::get(this, "","vif",vif))
      `uvm_fatal("No_vif", {"Virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask: run_phase
  
  virtual task drive();
    @(posedge vif.drv_mp.clk);
    `drv_intf.A <= req.A;
    `drv_intf.B <= req.B;
    @(posedge vif.drv_mp.clk);
    req.sum <= `drv_intf.sum;
    @(posedge vif.drv_mp.clk);
  endtask: drive
endclass: adder_driver 

    
  