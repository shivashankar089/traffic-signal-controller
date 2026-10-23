# Static Timing Analysis Review

This folder contains pre-layout and post-layout static timing analysis (STA) results for the controller at 16 Sky130 HD process/voltage/temperature corners. The recorded analysis uses a 50 ns clock and the constraints in [`constraints/`](../constraints/).

## Contents

| Path | Purpose |
|---|---|
| [`prelayout/`](prelayout/) | Per-corner reports and summary for the standalone synthesized netlist with an ideal clock. |
| [`postlayout/`](postlayout/) | Per-corner reports and summary using the implemented design, propagated clock, and SPEF parasitics. |
| [`reports/`](reports/) | PDF summaries for pre-layout and post-layout analysis. |
| [`scripts/`](scripts/) | OpenSTA scripts and report-generation helpers. |

The checked-in summaries report timing met in all 16 corners. The worst setup slack is 11.81 ns pre-layout and 7.35 ns post-layout; the worst reported hold slack is 0.04 ns in each summary. Refer to the per-corner and detailed reports for the actual paths and conditions behind these values.

## Important context

- Pre-layout analysis used an earlier standalone Yosys netlist; it is not the same synthesis run as the OpenLane physical-design result.
- Post-layout analysis includes extracted parasitics and the propagated clock.
- The provided `run16.sh` script defaults to a 10 ns period, while the checked-in result summaries use 50 ns. Set `PERIOD=50` when reproducing results intended to match those summaries, and use the documented OpenSTA/Sky130 environment.
- STA shows timing under modeled constraints; it does not verify functional behavior or establish deployment safety.

For functional validation, see the [testbench review](../tb/README.md). For the SDC assumptions and physical-design artifacts, see [`constraints/`](../constraints/) and [`physical_design/`](../physical_design/).
