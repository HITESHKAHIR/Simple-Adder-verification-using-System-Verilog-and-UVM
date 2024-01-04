class adder_sb extends uvm_scoreboard;

  `uvm_component_utils(adder_sb)
  
  uvm_analysis_imp#(adder_seq_item,adder_sb)sb_an_export;
  adder_seq_item data;
  adder_seq_item pkt_qu[$]; 
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_an_export=new("ab_an_export",this); 
  endfunction:build_phase
  
  virtual function void write(adder_seq_item trans);
    `uvm_info(get_type_name(),$sformatf("\n Value of adder sequence item in scoreboard \n"),UVM_LOW)
    trans.print();
    pkt_qu.push_back(trans); 
  endfunction:write
  
  virtual task run_phase(uvm_phase phase);
    adder_seq_item seq;
    forever begin
      wait(pkt_qu.size()>0);
      seq=pkt_qu.pop_front();
      
      if(seq.A+seq.B == seq.sum) begin
        `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of Sum = %0d", seq.sum),UVM_LOW)
       
      end
      else begin
        `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
        end
      end
   
  endtask : run_phase
endclass : adder_sb