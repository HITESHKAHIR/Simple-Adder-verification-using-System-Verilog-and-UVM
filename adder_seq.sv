class adder_seq extends uvm_sequence #(adder_seq_item);

  `uvm_object_utils(adder_seq)
  
  function new(string name = "adder_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(10) begin
      req=adder_seq_item::type_id::create("req");
      start_item(req);
      assert (req.randomize());
      finish_item(req);
    end
  endtask
endclass