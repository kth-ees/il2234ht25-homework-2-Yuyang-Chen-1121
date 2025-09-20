`include "register_file.sv"
module registerfile_tb;

// complete here
logic clk;
logic rst_n;
logic write_en;
logic [3:0] write_addr;
logic [7:0] data_in;
logic [3:0] read_addr1;
logic [3:0] read_addr2;
logic [7:0] data_out1;
logic [7:0] data_out2;
registerfile DUT(
    .clk(clk),
    .rst_n(rst_n),
    .write_en(write_en),
    .write_addr(write_addr),
    .data_in(data_in),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .data_out1(data_out1),
    .data_out2(data_out2)
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
    write_en=0;
    write_addr=0;
    data_in=0;
    read_addr1=0;
    read_addr2=0;
    #20ns;
    rst_n=1;
    #20ns;
    write_en=1;
    for (int i=0;i<16;i++)begin
        write_addr=i;
        data_in=$urandom_range(8'b00000000,8'b11111111);
        #10ns;
    end
    #20ns;
    write_en=0;
    for (int j=0;j<16;j++)begin
        read_addr1=j;
        #10ns;
    end
    #20ns;
    for (int k=0;k<16;k++)begin
        read_addr2=k;
        #10ns;
    end
    #200ns $stop;
end
endmodule