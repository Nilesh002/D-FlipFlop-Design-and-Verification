module test();

dff_if vif();
dff DUT(vif);

environment env;

initial
  begin
    vif.clk=0;
  end

always #10 vif.clk=~vif.clk;

initial
  begin
    env=new(vif);
    env.gen.count=5;
    env.run();
  end

initial
  begin
    $dumpfile("Dump.vcd");
    $dumpvars();
  end
    
    
endmodule
