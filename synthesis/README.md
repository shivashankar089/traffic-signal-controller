# Synthesis Review

This folder contains Yosys-related scripts, technology-model files, synthesis logs, and gate-level netlists for the controller. These artifacts describe logic mapping, not the physical layout or functional verification by themselves.

## Contents

| File | Purpose |
|---|---|
| [`synth.ys`](synth.ys) | Yosys synthesis and mapping script. |
| [`show_net.ys`](show_net.ys) | Yosys netlist-view script. |
| [`filter_lib.py`](filter_lib.py) | Helper for filtering a Liberty file. |
| [`sky130_models.v`](sky130_models.v), [`sky130_used.v`](sky130_used.v) | Verilog technology-model files used by the project flow. |
| [`traffic_ctrl_netlist.v`](traffic_ctrl_netlist.v), [`pre.v`](pre.v) | Netlist artifacts. |
| [`yosys.log`](yosys.log) | Captured synthesis output. |

The Yosys script references a Sky130 Liberty file and expects an RTL input at `src/traffic_ctrl.v`; consult the script and the [project README](../README.md) before attempting to rerun it. A matching tool/PDK setup and input files may be required.

The standalone pre-layout synthesis artifact is from an earlier run than the OpenLane synthesis output. Do not assume the standalone and OpenLane netlists or reported cell counts are interchangeable. For implementation results, inspect [`physical_design/`](../physical_design/); for timing analysis, inspect [`sta/`](../sta/).
