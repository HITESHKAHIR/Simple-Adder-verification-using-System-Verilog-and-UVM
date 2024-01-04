class adder_seq_item extends uvm_sequence_item;
  
  rand bit[`width-1:0] A;
  rand bit[`width-1:0] B;
  bit[`width:0] sum;
  
  function new(string name= "seq_item");
  	super.new(name);
  endfunction   

 `uvm_object_utils_begin(adder_seq_item)
  `uvm_field_int(A,UVM_ALL_ON)
  `uvm_field_int(B,UVM_ALL_ON)
  `uvm_field_int(sum,UVM_ALL_ON)
  `uvm_object_utils_end  
  
endclass
               
               