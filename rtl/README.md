# RTL Review

This folder contains the synthesizable Verilog implementation of the two-road traffic signal controller.

## Main source

- [`traffic_ctrl.v`](traffic_ctrl.v) defines the `traffic_ctrl` module, its configurable timing parameters, input/output interface, state machine, signal outputs, and safe-state recovery.
- The FSM includes normal A/B road phases, all-red intervals, a pedestrian-walk phase, and a safe state. Emergency requests and pedestrian requests are synchronized before use.
- Green durations are selected by `timing_sel`; the timers advance on `tick`. `tick` is an enable pulse, not the system clock.

The module-level parameter defaults and port descriptions are summarized in the [project README](../README.md). The companion [testbench](../tb/README.md) checks expected behavior and signal-safety invariants.

## Review and validation

Read the RTL together with the testbench rather than inferring behavior from diagrams alone. From the repository root, run the project simulation:

```sh
iverilog -g2005 -o sim rtl/traffic_ctrl.v tb/tb_traffic_ctrl.v
vvp sim
```

The testbench is self-checking and prints `ALL TESTS PASSED` when it completes without errors. This is a demonstration design, not a certified traffic-control system.
