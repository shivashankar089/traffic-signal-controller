read_liberty $::env(LIBFILE)
read_verilog synthesis/traffic_ctrl_netlist.v
link_design traffic_ctrl
read_sdc sta/traffic_ctrl.sdc
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay max
report_checks -path_delay min
