`include "frequency_divider.sv"
module frequency_divider_tb;

//complete here
logic clk,rst_n,divider_out;
frequency_divider DUT(
    .clk(clk),
    .rst_n(rst_n),
    .divider_out(divider_out)
);

initial begin
    clk=0;
    forever begin
        #5ns;
        clk = ~clk;
    end
end

initial begin
    rst_n=0;
    #20ns;
    rst_n=1;
    #50000ns $stop;
end
endmodule