class driver;
  transaction tr;
  mailbox #(transaction) gen2drv;
  virtual dff_if vif;
  
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task reset();
    vif.rst<=1;
    repeat(5) @(posedge vif.clk);
    vif.rst<=0;
    @(posedge vif.clk);
    $display("[DRV] : RESET DONE"); 
  endtask
  
  
  task run();
    forever
      begin
        gen2drv.get(tr);
        vif.din<=tr.din;
        @(posedge vif.clk);
        vif.din<=0;
        tr.display("DRV");
        @(posedge vif.clk);
      end
  endtask
  
endclass
