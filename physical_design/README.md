# Physical Design Review

This folder contains the OpenLane configuration and implementation artifacts for the `traffic_ctrl` design. It shows how the RTL was prepared for a SkyWater Sky130 HD physical-design flow and preserves selected outputs for review.

## Contents

| Path | What it contains |
|---|---|
| [`config.json`](config.json) | OpenLane design name, RTL path convention, 50 ns clock period, and floorplan settings. |
| [`reports/summary/final_summary_report.csv`](reports/summary/final_summary_report.csv) | Summary of the recorded `run1` flow. |
| [`reports/drc/`](reports/drc/) | Magic DRC report and related result files. |
| [`reports/lvs/`](reports/lvs/) | LVS logs. |
| [`reports/antenna/`](reports/antenna/) | Antenna-check report. |
| [`reports/layout_pictures/`](reports/layout_pictures/) | Images of selected floorplan, placement, clock-tree, routed, and GDS stages. |
| [`results/`](results/) | Selected DEF, GDS, LEF, netlist, and SPEF outputs. |

## Reviewer guide

1. Read `config.json` to understand the flow settings. Its RTL path uses OpenLane's `$::env(DESIGN_DIR)` convention; the project README explains how the RTL and configuration are staged in an OpenLane design directory.
2. Use the summary CSV to orient yourself, then inspect the individual DRC, LVS, and antenna reports rather than relying only on summary counts.
3. Compare physical-design timing with the [STA review](../sta/README.md); post-layout timing uses routed parasitics.

The checked-in artifacts represent the recorded flow, not a guarantee that the flow can be rerun without the matching OpenLane and Sky130 environment. The project README identifies the reported run and its limitations. Passing design-flow checks does not certify the controller for real-world deployment.
