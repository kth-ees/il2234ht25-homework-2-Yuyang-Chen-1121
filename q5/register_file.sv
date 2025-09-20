module registerfile (input logic clk,
                     input logic rst_n,
                     input logic write_en,
                     input logic [3:0] write_addr,
                     input logic [7:0] data_in,
                     input logic [3:0] read_addr1,
                     input logic [3:0] read_addr2,
                     output logic [7:0] data_out1,
                     output logic [7:0] data_out2
                     );
    // complete here
logic [7:0] mem [0:15];
always_ff @( posedge clk or negedge rst_n ) begin
    if(!rst_n)begin
        data_out1<=8'd0;
        data_out2<=8'd0;
        for (int i = 0; i<16; i++)begin
            mem[i]<=8'd0;
        end
    end   
    else if(write_en)begin
        mem[write_addr]<=data_in;
        data_out1<=mem[read_addr1];
        data_out2<=mem[read_addr2];
    end
    else begin
        data_out1<=mem[read_addr1];
        data_out2<=mem[read_addr2];        
    end
end
endmodule