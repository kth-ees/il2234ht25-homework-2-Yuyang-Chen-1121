`include "up_down_counter.sv"
module up_down_counter_tb;

// complete here
parameter N = 4;
logic clk,rst_n,up_down,load,carry_out;
logic [N-1:0] input_load,count_out;
up_down_counter #(.N(N)) DUT(
    .clk(clk),
    .rst_n(rst_n),
    .up_down(up_down),
    .load(load),
    .input_load(input_load),
    .count_out(count_out),
    .carry_out(carry_out)
);

initial begin
    clk=0;
    forever begin
        #5ns;
        clk=~clk;
    end
end

initial begin
    rst_n=0;
    up_down=0;
    load=0;
    input_load=0;
    #20ns;
    rst_n=1;
    #200ns;
    rst_n=0;
    up_down=1;
    #20ns;
    rst_n=1;
    #200ns;
    load=1;
    for(int i =0; i <10; i++)begin
        input_load = $urandom_range(4'b0000,4'b1111);
        up_down=$urandom_range(1'b0,1'b1);
        #200ns;
    end
    #200 $stop;
end
endmodule