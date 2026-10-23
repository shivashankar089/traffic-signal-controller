# Documentation and Evidence Review

This folder contains the project's visual documentation and screenshots. It helps a reviewer follow the design and implementation evidence; it is not a replacement for the RTL, testbench, scripts, or tool-generated reports.

## Start here

- [`screenshots/README.md`](screenshots/README.md) is the overview of the screenshot collection and its numbered sections.
- [`screenshots/01_diagrams/`](screenshots/01_diagrams/) introduces the two-road junction and controller state machine.
- The later screenshot sections follow RTL simulation, synthesis, STA, physical implementation, and signoff evidence.

For the design description and reproducible commands, start with the [project README](../README.md). The authoritative implementation and analysis artifacts live in their corresponding folders, including [`rtl/`](../rtl/), [`tb/`](../tb/), [`sta/`](../sta/), and [`physical_design/`](../physical_design/).

Screenshots capture particular views and runs. Confirm numerical results against the associated reports, and do not treat a screenshot or a reported design-flow check as product certification.
