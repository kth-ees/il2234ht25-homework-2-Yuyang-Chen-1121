module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
  // complete here
parameter DOWN =1'b0;
parameter UP = 1'b1;
logic [N-1:0] cnt;
always_ff @(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
    cnt<=0;
    carry_out<=0;
  end
  else if(load)begin
    cnt<=input_load;
    carry_out<=0;
  end
  else begin
    case (up_down)
      DOWN:begin
        cnt<=cnt-1;
        if(cnt==0)carry_out<=1;
        else carry_out<=0;
      end 
      UP:begin
        cnt<=cnt+1;
        if(cnt==4'b1111)carry_out<=1;
        else carry_out<=0;
      end
      default:begin
        cnt<=cnt;
        carry_out<=0;
      end 
    endcase
  end
end
assign count_out = cnt;
endmodule