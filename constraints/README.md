# Timing Constraints Review

This folder defines the timing assumptions used to analyze `traffic_ctrl`. These SDC files describe a 50 ns clock and external input/output timing; they are analysis constraints, not logic or a complete description of how the controller is deployed.

## Files

| File | Purpose |
|---|---|
| [`traffic_ctrl.sdc`](traffic_ctrl.sdc) | Pre-layout constraints for an ideal clock. |
| [`traffic_ctrl_post.sdc`](traffic_ctrl_post.sdc) | Post-layout constraints, including a propagated clock for the implemented clock tree. |

Both files apply 0.25 ns clock uncertainty, 10 ns input and output delays, input transitions, and a 0.05 load on outputs. The post-layout file uses the same timing assumptions and adds `set_propagated_clock`.

## How to read these constraints

- The 50 ns period is the timing-analysis target (20 MHz); the controller's state timing is measured in `tick` pulses, not clock cycles.
- Input and output delays model external timing budgets. They do not define the behavior of the input synchronizers or the traffic-signal sequence.
- The constraints should be read alongside the [RTL](../rtl/traffic_ctrl.v) and the [STA reports](../sta/README.md).
- Results obtained with different clocks, libraries, delays, or loads are not directly comparable.

These constraints and the reported analyses are project evidence, not certification for use in a real traffic-control system.
