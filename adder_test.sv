class adder_test extends uvm_test;

  `uvm_component_utils(adder_test)
  
  adder_seq seq;
  adder_env env;
  
  function new(string name= "test", uvm_component parent=null); 
    super.new(name,parent);
  endfunction:new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq=adder_seq::type_id::create("seq"); //define 
    env=adder_env::type_id::create("env",this);
  endfunction : build_phase
  
  task run_phase(uvm_phase phase); //put the seq in envi
      phase.raise_objection(this);
      seq.start(env.agent.seqr);
      phase.drop_objection(this);
  endtask:run_phase
endclass:adder_test
    	