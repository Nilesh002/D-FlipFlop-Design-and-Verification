class transaction;
  virtual dff_if vif;
  
  rand bit din;
  bit dout;
  
  function transaction copy();
    copy=new();
    copy.din=this.din;
    copy.dout=this.dout;
    
  endfunction
  
  function void display(input string tag );
    $display("[%s] : Din=%b : Dout=%b",tag,din,dout);
  endfunction
  
endclass
