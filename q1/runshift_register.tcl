# runshift_register.tcl
vlib work
vmap work work
vlog shift_register.sv shift_register_tb.sv
vsim -gui -voptargs=+acc work.shift_register_tb
add wave -r sim:/*
run -all
