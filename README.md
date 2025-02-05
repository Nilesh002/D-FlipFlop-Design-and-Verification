# D Flip-Flop (DFF) Verification in SystemVerilog

## **Overview**
This repository contains a SystemVerilog-based testbench for verifying a **D Flip-Flop (DFF)**. The verification environment follows a structured approach using a class-based methodology similar to **UVM (Universal Verification Methodology)**. It consists of various components like a **generator, driver, monitor, scoreboard, and environment** to validate the functionality of the DFF.

---


---

## **D Flip-Flop Design**
The **D Flip-Flop (DFF)** is a basic sequential circuit that captures the value of the **data input (`din`)** at the **rising edge of the clock (`clk`)**. If the reset (`rst`) is asserted, the output (`dout`) is reset to `0`.

### **DFF Code (`dff.sv`)**
```systemverilog
module dff(dff_if vif);
  always @ (posedge vif.clk)
    begin
      if (vif.rst == 1)
        vif.dout <= 0;
      else 
        vif.dout <= vif.din;
    end
endmodule

