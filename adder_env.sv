class adder_env extends uvm_env;
  
  adder_agent agent;
  adder_sb sb;
  
  `uvm_component_utils(adder_env)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent=adder_agent::type_id::create("agent",this);
    sb=adder_sb::type_id::create("sb",this);
  endfunction: build_phase
  
  function void connect_phase(uvm_phase phase);
    agent.mon.mon_an_port.connect(sb.sb_an_export);
  endfunction: connect_phase
    
 endclass:adder_env
    
    