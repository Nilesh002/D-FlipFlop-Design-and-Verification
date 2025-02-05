class generator;
  transaction tr;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) gen2scb;
  
  event sconext;
  event done;
  int count;
  
  function new(mailbox #(transaction) gen2drv, mailbox #(transaction) gen2scb);
    this.gen2drv=gen2drv;
    this.gen2scb=gen2scb;
    tr=new();
  endfunction
  
  task run();
    repeat(count)
      begin
        assert(tr.randomize) else $error("Randomization Failed");
        gen2drv.put(tr.copy);
        gen2scb.put(tr.copy);
        tr.display("GENERATOR");
        @(sconext);
      end
    ->done;

  endtask
  
endclass

