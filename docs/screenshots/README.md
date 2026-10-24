# Project Screenshots and Evidence

This folder collects visual evidence for the traffic-signal-controller project, arranged in the order of the design flow. The screenshots illustrate the junction and FSM, RTL verification, synthesis, static timing analysis, OpenLane implementation, final signoff, and a separate ngspice inverter example.

## Sections

| Folder | Evidence |
|---|---|
| [`01_diagrams/`](01_diagrams/) | Two-road junction and controller state-machine diagrams |
| [`02_rtl_and_simulation/`](02_rtl_and_simulation/) | RTL view, self-checking simulation results, and GTKWave scenarios |
| [`03_synthesis_and_gls/`](03_synthesis_and_gls/) | Yosys synthesis, netlist views, and gate-level simulation |
| [`04_pre_layout_sta/`](04_pre_layout_sta/) | Pre-layout and post-layout timing across 16 PVT corners |
| [`05_openlane_stage_by_stage/`](05_openlane_stage_by_stage/) | OpenLane configuration and implementation stages through routing |
| [`06_signoff_and_gds/`](06_signoff_and_gds/) | Completed flow, final layout, DRC/LVS/antenna checks, and summary |
| [`07_ngspice/`](07_ngspice/) | Transient response of a standalone CMOS inverter |

Each section has its own README with captions for its images. Start with [the diagrams](01_diagrams/README.md) for a functional overview, then follow the numbered sections to browse the implementation evidence.

## Reading the evidence

- Screenshots document particular runs and should be read alongside the source reports and scripts in the repository. They are evidence images, not substitutes for rerunning the tools.
- Timing results are reported for a 50 ns clock over 16 Sky130 HD process/voltage/temperature corners. The post-layout results include extracted parasitics.
- OpenLane stage-by-stage captures came from an interactive run; the final signoff/GDS evidence is from the separate `run1` flow described in the project README.
- The ngspice inverter is a separate circuit demonstration using generic level-1 MOSFET models. It is not the traffic controller and does not use Sky130 device models.
- The project is a demonstration design, not a certified traffic-control system.

For design details and reproducible commands, see the [repository README](../../README.md). The RTL is in [`rtl/`](../../rtl/), the testbench is in [`tb/`](../../tb/), and implementation/timing artifacts are in [`physical_design/`](../../physical_design/) and [`sta/`](../../sta/).
