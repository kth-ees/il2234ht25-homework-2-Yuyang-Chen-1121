# runup_down_counter.tcl
vlib work
vmap work work
vlog up_down_counter.sv up_down_counter_tb.sv
vsim -gui -voptargs=+acc work.up_down_counter_tb
add wave -r /*
run -all
