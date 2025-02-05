class scoreboard;
  transaction tr;
  transaction tref;
  mailbox #(transaction) mon2scb;
  mailbox #(transaction) gen2scb;
  event sconext;

  function new(mailbox #(transaction) mon2scb, mailbox #(transaction) gen2scb);
    this.gen2scb=gen2scb;
    this.mon2scb=mon2scb;
  endfunction
  
  
  task run();
    forever 
      begin
        mon2scb.get(tr);
        gen2scb.get(tref);
        
        tr.display("SCO");
        tr.display("REF");
        
        if(tr.dout==tref.din)
          $display("[SCO] : DATA MATCHED");
        else 
          $display("[SCO] : DATA MISMATCHED");
        $display("------------------------------");
        ->sconext;
        
      end
  endtask
endclass

