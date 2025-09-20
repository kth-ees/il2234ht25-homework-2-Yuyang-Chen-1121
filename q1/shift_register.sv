module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

//complete here
logic [N-1:0] shift_reg;
always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        serial_out <= 0;
        shift_reg<=0;
    end
    else if(load_enable)begin
        case(serial_parallel)
        1'b0:begin
            shift_reg<={serial_in,shift_reg[N-1:1]};
            serial_out<=shift_reg[0];
        end
        1'b1:begin
            shift_reg<=parallel_in;
            serial_out<=shift_reg[0];
        end
        default:begin
            shift_reg<=0;
            serial_out<=shift_reg[0];
        end
        endcase
    end
end
assign parallel_out=shift_reg;
endmodule
