class adder_agent extends uvm_agent; 
  
  adder_seqr seqr;
  adder_driver driver;
  adder_mon mon;
   
  `uvm_component_utils(adder_agent) 
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
    endfunction:new
    
  function void build_phase(uvm_phase phase);
    super.build_phase(phase); 
        
    driver = adder_driver::type_id::create("driver",this);
    seqr = adder_seqr::type_id::create("seqr",this);  
    mon = adder_mon::type_id::create("mon",this);
  endfunction: build_phase
    
  function void connect_phase(uvm_phase phase);
   driver.seq_item_port.connect(seqr.seq_item_export);
  endfunction: connect_phase
endclass: adder_agent
    
      