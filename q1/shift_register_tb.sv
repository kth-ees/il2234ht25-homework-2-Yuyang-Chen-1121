`include "shift_register.sv"
module shift_register_tb;

//complete here
//signals
parameter N = 4;
logic clk,rst_n,serial_parallel,load_enable;
logic serial_in,serial_out;
logic [N-1:0] parallel_in,parallel_out;

//instantiation
shift_register #(.N(N)) DUT (
    .clk(clk),
    .rst_n(rst_n),
    .serial_parallel(serial_parallel),
    .load_enable(load_enable),
    .serial_in(serial_in),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out),
    .serial_out(serial_out)
);

initial begin
    clk=0;
    forever begin
        #5ns;
        clk = ~clk;
    end
end

initial begin
    rst_n = 0;
    load_enable=0;
    serial_parallel=0;
    serial_in=0;
    parallel_in=0;
    #20ns;
    rst_n = 1;
    #20ns;
    load_enable = 1;
    //serial
    for (int i=0;i<20;i++)begin
        serial_in = $urandom_range (1'b0, 1'b1);
        //assert (condition) 
        //else   error_process
        #10ns;
    end
    #2000ns;
    load_enable=0;
    serial_parallel=1;
    //parallel
    load_enable=1;
    #20ns;
    for (int j =4'd15; j>=0; j--)begin
        parallel_in = j;
        #10ns;
    end
    #2000ns $stop;
end
endmodule