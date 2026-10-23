read_liberty $::env(LIBFILE)
read_verilog evidence/run1/netlist/traffic_ctrl.synthesis_preroute.v
link_design traffic_ctrl
read_sdc sta/post.sdc
read_spef evidence/run1/spef/traffic_ctrl.spef
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay min_max -fields {nets cap slew input_pins fanout}
