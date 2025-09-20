# runfrequency_divider.tcl
vlib work
vmap work work
vlog frequency_divider.sv frequency_divider_tb.sv
vsim -gui -voptargs=+acc work.frequency_divider_tb
add wave -r /*
run -all
