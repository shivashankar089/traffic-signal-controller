# Testbench Review

This folder contains the self-checking Verilog testbench for [`rtl/traffic_ctrl.v`](../rtl/traffic_ctrl.v) and a captured simulation waveform.

## Contents

- [`tb_traffic_ctrl.v`](tb_traffic_ctrl.v) instantiates the controller, drives clock and input scenarios, checks signal invariants and expected phases, and reports failures or `ALL TESTS PASSED`.
- [`waveforms/traffic_ctrl.vcd`](waveforms/traffic_ctrl.vcd) is a recorded Value Change Dump that can be opened in GTKWave.

The test scenarios cover reset and restart, normal sequencing, timing presets, emergency requests, pedestrian requests and timing, timer behavior when `tick` is low, illegal-state recovery, and randomized stimulus. The testbench also checks that road greens do not conflict and that pedestrian walk is only active while both roads are red.

## Run the simulation

From the repository root:

```sh
iverilog -g2005 -o sim rtl/traffic_ctrl.v tb/tb_traffic_ctrl.v
vvp sim
```

The simulation writes `traffic_ctrl.vcd` in the current working directory. Open it with `gtkwave traffic_ctrl.vcd` to inspect the run. The checked-in waveform is an existing capture and may not be from the latest source revision; rerun the testbench when validating current changes.

Simulation tests support functional review but do not replace STA, physical verification, or safety certification.
