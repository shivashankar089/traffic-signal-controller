# Diagrams

These diagrams introduce the controller's two-road junction and its finite-state machine (FSM). They are conceptual views of the behavior implemented in [`traffic_ctrl.v`](../../../rtl/traffic_ctrl.v).

## Images

### Two-road junction

![Two-road junction controlled by the traffic controller](01_junction_diagram.png)

[`01_junction_diagram.png`](01_junction_diagram.png) shows Road A and Road B, their traffic signals, the pedestrian request input, and an example emergency-vehicle request (`emg_a`).

### Controller state machine

![Traffic controller FSM](02_fsm_state_diagram.png)

[`02_fsm_state_diagram.png`](02_fsm_state_diagram.png) shows the normal A/B signal sequence, all-red intervals, pedestrian phase, emergency pre-emption, and recovery to the all-red safe state. Road A takes priority if both emergency requests are active.
