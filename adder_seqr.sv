class adder_seqr extends uvm_sequencer#(adder_seq_item);

  `uvm_component_utils(adder_seqr)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
endclass