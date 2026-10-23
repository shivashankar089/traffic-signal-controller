# SPICE Example Review

This folder contains a standalone ngspice demonstration of a CMOS inverter. It is an educational circuit example and is separate from the traffic-signal-controller RTL and its Sky130 implementation.

## Files

| File | Purpose |
|---|---|
| [`inv.cir`](inv.cir) | Inverter netlist, generic level-1 NMOS/PMOS models, pulse input, and transient-analysis setup. |
| [`inv.log`](inv.log) | Captured ngspice run output. |
| [`22_ngspice_inverter.png`](22_ngspice_inverter.png) | Visual evidence for the inverter example. |

The netlist uses generic level-1 MOSFET parameters and a 1.8 V supply; it does **not** use the Sky130 PDK and does not model the controller's logic or physical implementation. Treat the image and log as evidence for this example only.

For controller behavior and implementation results, see the [RTL review](../rtl/README.md), [STA review](../sta/README.md), and [physical-design review](../physical_design/README.md).
