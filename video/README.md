# Project Walkthrough Video

## Traffic Signal Controller with Emergency-Vehicle Override and Pedestrian Crossing

This document describes the project walkthrough video for the **Traffic Signal Controller** design. The walkthrough explains the project from its Verilog RTL implementation through simulation, synthesis, static timing analysis (STA), physical implementation, and final verification.

The video will be hosted externally on Google Drive. The link and final video details will be added once the recording is uploaded.

## Watch the Walkthrough

**Project video:** [Watch the Traffic Signal Controller walkthrough](https://drive.google.com/file/d/1SsYZak6QnmCnjVU_wMS0FXtoJVVbHxV8/view?usp=sharing)

> **Before publishing:** Replace `GOOGLE_DRIVE_VIDEO_LINK_PLACEHOLDER` with the final Google Drive share link. Confirm that the intended audience has permission to view the video.

## Video Details

| Detail | Information |
|---|---|
| Project title | Traffic Signal Controller with Emergency-Vehicle Override and Pedestrian Crossing |
| Duration | `[ADD FINAL VIDEO DURATION]` |
| File format | `[ADD VIDEO FORMAT, e.g. MP4]` |
| Hosting platform | Google Drive |
| Sharing permission | Anyone with the link — Viewer, if appropriate |
| Project implementation | Verilog RTL and RTL-to-GDSII physical-design workflow |

## 1. Project Overview

The project implements a digital traffic signal controller using synthesizable Verilog RTL. Its purpose is to demonstrate how a controller can manage a normal traffic-light sequence while accounting for emergency-vehicle requests, pedestrian crossing requests, and safe all-red transitions.

The design is presented as an educational digital-design and physical-design project. It demonstrates the progression from RTL specification and simulation to synthesis, timing analysis, place-and-route, and physical verification.

The walkthrough introduces the design goals, explains the controller's finite-state machine (FSM), reviews simulation evidence, and then follows the implementation through the physical-design flow.

## 2. Project Objectives

The main objectives of the project are to:

- Develop a synthesizable Verilog implementation of a traffic signal controller.
- Model the control sequence using a finite-state machine.
- Support normal traffic operation, emergency-vehicle override requests, and pedestrian crossing requests.
- Use all-red intervals to separate traffic phases safely.
- Verify the controller's behavior with a self-checking testbench.
- Inspect simulation waveforms to understand state transitions and output behavior.
- Synthesize the RTL using the target standard-cell library.
- Evaluate timing using static timing analysis across process, voltage, and temperature (PVT) corners.
- Run the RTL-to-GDSII physical-design flow using the SkyWater SKY130 High-Density standard-cell platform.
- Review post-route timing and physical-verification results.

## 3. Functional Architecture

The controller is organized around an FSM that determines the active traffic phase and the corresponding signal outputs. The implementation includes states for both road directions, yellow transitions, all-red intervals, pedestrian crossing, and a safe all-red condition.

The eight states described in the project walkthrough are:

1. Road A green.
2. Road A yellow.
3. All-red transition from Road A to Road B.
4. Road B green.
5. Road B yellow.
6. All-red transition from Road B to Road A.
7. Pedestrian walk.
8. Safe all-red state.

The state machine controls the sequence of phases and uses timing counters to determine when a phase should advance. The implementation also includes request-handling logic for emergency and pedestrian inputs.

## 4. Main Features

| Feature | Purpose |
|---|---|
| Normal traffic sequencing | Alternates traffic phases between Road A and Road B. |
| Emergency-vehicle override | Responds to emergency requests for either road. |
| Pedestrian crossing request | Allows a pedestrian request to be handled by the controller. |
| All-red transition intervals | Separates conflicting traffic phases with an all-red interval. |
| Configurable green presets | Supports green-duration presets of 8, 12, 16, and 20 ticks. |
| Yellow interval | Uses a 3-tick yellow interval. |
| All-red interval | Uses a 2-tick all-red interval. |
| Pedestrian walk interval | Uses a 6-tick pedestrian walk interval. |
| Minimum green interval | Enforces a 3-tick minimum green interval. |
| Input synchronization | Includes synchronizer logic for asynchronous request inputs. |
| Request edge detection and retention | Helps detect request events and retain pedestrian requests until they can be serviced. |
| Safe-state recovery | Includes recovery behavior that returns the controller to an all-red condition if an illegal FSM state is detected. |

These behaviors are intended to demonstrate control logic and verification techniques. They do not, by themselves, establish that the design meets the requirements for a real-world traffic installation.

## 5. RTL Design

The main RTL source is located at:

- `rtl/traffic_ctrl.v`

The RTL describes the controller's state machine, timing behavior, request processing, and traffic signal outputs. It is written to support logic synthesis rather than being only a behavioral simulation model.

The walkthrough explains how the FSM coordinates the traffic phases, how request inputs affect state transitions, and why all-red intervals are included between conflicting movements.

## 6. Simulation and Functional Verification

The testbench is located at:

- `tb/tb_traffic_ctrl.v`

The project uses a self-checking testbench to exercise normal and exceptional operating conditions. The testbench checks controller behavior and safety-related invariants rather than relying only on visual inspection of waveforms.

The test scenarios described for the project include:

- Normal traffic-cycle operation.
- Green-duration preset selection.
- Emergency requests for Road A and Road B.
- Pedestrian-request retention and servicing.
- An emergency request occurring during the pedestrian phase.
- A request button being held active.
- Behavior when the timing tick is low.
- Recovery from an illegal FSM state.
- Randomized operation over 20,000 cycles.

The recorded verification result in the project notes is `ALL TESTS PASSED`. Refer to the committed testbench and logs for the exact scope and evidence of the run.

### Example simulation commands

Run these commands from the repository root in an environment where Icarus Verilog is installed:

```bash
iverilog -g2005 -o sim rtl/traffic_ctrl.v tb/tb_traffic_ctrl.v
vvp sim
```

If the simulation produces the expected VCD waveform file, it can be inspected with GTKWave. Use the actual VCD filename and path generated by the testbench:

```bash
gtkwave traffic_ctrl.vcd
```

The waveform view helps correlate input requests, state transitions, timing events, and signal outputs. The self-checking testbench remains the primary automated functional check.

## 7. Synthesis

After functional verification, the RTL is synthesized using Yosys and the target SkyWater SKY130 HD standard-cell library.

Synthesis converts the RTL description into a gate-level netlist composed of library cells. This provides an implementation suitable for subsequent timing analysis and physical design.

The project notes record a synthesized design of approximately 201 cells and a reported synthesized cell area of approximately 1,913 µm² for the documented OpenLane run. Exact values can vary with tool versions, constraints, and implementation settings; consult the associated reports for the source run and measurement definitions.

## 8. Static Timing Analysis

Static timing analysis evaluates whether timing paths meet the specified clock and input/output timing constraints. The project includes pre-layout and post-route timing analysis, with reports covering 16 Sky130 HD PVT corners.

The project initially evaluated a 10 ns clock target, which did not meet setup timing at all analyzed corners. The final documented constraint uses a 50 ns clock period, corresponding to a 20 MHz clock target, with 0.25 ns clock uncertainty and 10 ns input/output delays.

The reported post-layout timing results include:

- Worst setup slack: approximately **+7.35 ns** at `ss_n40C_1v28`.
- Worst hold slack: approximately **+0.04 ns** at `ff_n40C_1v95`.
- Reported setup and hold checks passed across the 16 analyzed corners.

The positive hold slack is relatively small, so it should be interpreted using the detailed timing reports and the exact signoff constraints. Timing results apply to the documented runs and constraints; they should not be treated as a universal guarantee for other configurations.

## 9. RTL-to-GDSII Physical-Design Flow

The project uses OpenLane and OpenROAD with the SkyWater SKY130 HD platform to demonstrate the main stages of digital physical implementation.

The physical-design flow includes:

1. **Configuration and preparation** — select the design, platform, timing constraints, and implementation settings.
2. **Floorplanning** — establish the core and die dimensions and prepare the design area.
3. **Placement** — position standard cells within the floorplan.
4. **Clock-tree synthesis (CTS)** — build the clock distribution network.
5. **Routing** — connect the design using the available routing layers.
6. **Parasitic extraction** — generate parasitic information for post-route timing analysis.
7. **Post-route STA** — evaluate timing with routed parasitics and the implemented clock network.
8. **Physical verification** — review design-rule, layout-versus-schematic, and antenna checks.
9. **GDS generation** — produce the final layout database for the documented implementation run.

These stages illustrate why physical design is more than translating RTL into gates: placement, clock distribution, routing, parasitic effects, and physical checks all contribute to implementation quality.

## 10. Post-Route Timing and Physical Verification

Post-route analysis uses information from the implemented layout, including extracted interconnect parasitics. This provides a more physically representative timing assessment than a pre-layout estimate.

The project notes report the following results for the documented physical-design run:

| Check or metric | Reported result |
|---|---|
| TritonRoute violations | 0 |
| Magic DRC violations | 0 |
| LVS errors | 0 |
| Antenna violations | 0 |
| OpenLane WNS / TNS | 0 ns / 0 ns |
| Reported CTS skew | Approximately 0.42 ns |
| Reported die area | Approximately 0.0072 mm² |

These values describe the recorded run and should be verified against the corresponding reports before being used as formal signoff claims. Different runs, tool settings, constraints, or library versions may produce different results.

The walkthrough also distinguishes timing analysis from physical verification: timing reports evaluate path delays against constraints, while DRC, LVS, and antenna checks evaluate different aspects of layout correctness.

## 11. Repository Guide

The repository is organized by implementation stage and supporting evidence.

| Directory or file | Contents |
|---|---|
| `rtl/` | Verilog RTL source for the controller. |
| `tb/` | Testbench and simulation-related files. |
| `constraints/` | Design timing and implementation constraints. |
| `synthesis/` | Synthesis outputs or related reports, where committed. |
| `sta/` | Static timing analysis reports. |
| `physical_design/` | Physical-design outputs, reports, or supporting files. |
| `spice/` | SPICE-related files used by the project. |
| `docs/` | Project documentation, diagrams, and screenshots. |
| `media/` | This video information page and optional related media assets. |
| `README.md` | Main project overview and entry point for the repository. |

The actual contents of each directory are determined by the files committed to the repository. Generated tool outputs may be omitted when they are reproducible or too large to store in version control.

## 12. How to Access the Video

1. Select the Google Drive link in the **Watch the Walkthrough** section.
2. If prompted, sign in to an account that has permission to view the file.
3. If the video does not open, check the file's sharing settings or contact the repository owner.
4. For public portfolio use, ensure that the selected sharing setting is appropriate and does not expose unrelated personal files.

The video is hosted on Google Drive. The video file itself is not stored in this GitHub repository.

## 13. Scope and Limitations

This project is an educational RTL and physical-design demonstration. It is not a certified traffic-control product and must not be deployed to control public-road traffic without the required engineering, safety analysis, hardware validation, regulatory approval, and system-level verification.

The behavior of a real traffic installation depends on external sensors, signal drivers, fault monitoring, communications, and other system-level requirements that are outside the scope of this RTL demonstration.

Reported simulation, timing, and physical-verification results apply to the documented source files, constraints, tools, libraries, and runs. They should be interpreted alongside the corresponding committed reports rather than as guarantees for every possible operating condition.

## 14. Project Summary

The walkthrough follows the design from a synthesizable Verilog FSM to functional simulation, synthesis, pre-layout STA, physical implementation, post-route STA, and physical verification. It demonstrates the relationship between RTL behavior and implementation-level checks, while documenting the constraints and results used for the reported runs.

