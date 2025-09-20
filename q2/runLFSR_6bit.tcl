# runLFSR_6bit.tcl
vlib work
vmap work work
vlog LFSR_6bit.sv LFSR_6bit_tb.sv
vsim -gui -voptargs=+acc work.LFSR_6bit_tb
add wave -r /*
run -all
