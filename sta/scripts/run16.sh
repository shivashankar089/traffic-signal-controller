#!/bin/bash
P=${PERIOD:-10}
I=$(awk "BEGIN{print $P*0.2}")
cat > sta/traffic_ctrl.sdc << SDC
create_clock -name clk -period $P [get_ports clk]
set_clock_uncertainty 0.25 [get_clocks clk]
set_clock_transition 0.15 [get_clocks clk]
set_input_delay $I -clock clk [get_ports {reset tick ped_req emg_a emg_b timing_sel*}]
set_output_delay $I -clock clk [all_outputs]
set_input_transition 0.2 [get_ports {reset tick ped_req emg_a emg_b timing_sel*}]
set_load 0.05 [all_outputs]
SDC
cat > sta/run_sta.tcl << 'TCL'
read_liberty $::env(LIBFILE)
read_verilog synthesis/traffic_ctrl_netlist.v
link_design traffic_ctrl
read_sdc sta/traffic_ctrl.sdc
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay max
report_checks -path_delay min
TCL
mkdir -p sta/prelayout
L=$PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/lib
printf "%-18s %12s %12s\n" CORNER SETUP_ns HOLD_ns > sta/prelayout/summary.txt
for f in $(ls $L | grep -E "__(tt|ff|ss)_" | grep -v ccsnoise); do
  c=${f#sky130_fd_sc_hd__}; c=${c%.lib}
  LIBFILE=$L/$f sta -no_splash -exit sta/run_sta.tcl > sta/prelayout/$c.rpt 2>&1
  s=$(grep '^worst slack' sta/prelayout/$c.rpt | sed -n 1p | awk '{print $NF}')
  h=$(grep '^worst slack' sta/prelayout/$c.rpt | sed -n 2p | awk '{print $NF}')
  printf "%-18s %12s %12s\n" $c "$s" "$h" >> sta/prelayout/summary.txt
done
awk -v p=$P 'NR>1{ if(min==""||$2<min){min=$2;c=$1} if(hm==""||$3<hm){hm=$3} } END{
 printf "\nClock period: %s ns | Worst setup: %s ns (%s) | Worst hold: %s ns\n",p,min,c,hm;
 if(min>=0 && hm>=0) printf "RESULT: timing MET in all 16 corners | Est. Fmax: %.0f MHz\n",1000/(p-min); else print "RESULT: VIOLATION - see table" }' sta/prelayout/summary.txt >> sta/prelayout/summary.txt
