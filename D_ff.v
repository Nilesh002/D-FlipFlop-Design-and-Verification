module dff(dff_if vif);
  
  always @ (posedge vif.clk)
    begin
      if(vif.rst==1)
      vif.dout<=0;
      else vif.dout<=vif.din;
    end
  
endmodule
