class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  event next;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) gen2scb;
  mailbox #(transaction) mon2scb;
  
  virtual dff_if vif;
  
  function new(virtual dff_if vif);
                 gen2drv=new();
                 gen2scb=new();
                 mon2scb=new();
                 
                 gen=new(gen2drv,gen2scb);
                 drv=new(gen2drv);
                 mon=new(mon2scb);
                 sco=new(mon2scb,gen2scb);

                 drv.vif=vif;
                 mon.vif=vif;
                 
                 gen.sconext=next;
                 sco.sconext=next;
          endfunction
                      
                      task pretest();
                        drv.reset();
                      endtask
                      
                      task test();
                        fork
                          gen.run();
                          drv.run();
                          mon.run();
                          sco.run();
                        join_any
                      endtask
                      
                      task postest();
                        wait(gen.done.triggered);
                        $finish;
                      endtask
                      
                      task run();
                        pretest();
                        test();
                        postest();
                      endtask
                      
                      endclass
