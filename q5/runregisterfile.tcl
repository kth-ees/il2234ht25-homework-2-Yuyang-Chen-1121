# runregisterfile.tcl
vlib work
vmap work work
vlog register_file.sv register_file_tb.sv
vsim -gui -voptargs=+acc work.registerfile_tb
add wave -r /*
run -all
