`include "LFSR_6bit.sv"
module LFSR_6bit_tb;

// complete here
logic clk,rst_n,sel;
logic [5:0] parallel_in,parallel_out;
LFSR_6bit DUT(
  .clk(clk), 
  .rst_n(rst_n),
  .sel(sel),
  .parallel_in(parallel_in),
  .parallel_out(parallel_out)
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
    sel=0;
    #20ns;
    rst_n=1;
    for(int i=127;i>=0; i--)begin
        parallel_in= i;
        #500ns;
        sel=1;
        #500ns;
        sel=0;
    end
    #2000 $stop;
end
endmodule