class monitor;
  transaction tr;
  virtual dff_if vif;
  mailbox #(transaction) mon2scb;
  
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    tr=new();
    forever
      begin
        repeat(2) @(posedge vif.clk); 
        tr.dout=vif.dout;
        mon2scb.put(tr);
        tr.display("MON");
      end
  endtask
  
endclass
