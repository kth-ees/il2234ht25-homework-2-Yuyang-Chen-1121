module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  // …
  // Add your description here
logic [5:0] LFSR_reg;

always_ff @(posedge clk or negedge rst_n)begin
  if(!rst_n)begin
    LFSR_reg<=0;
  end
  else begin
    case (sel)
      1'b0:LFSR_reg<=parallel_in;
      1'b1:LFSR_reg<={LFSR_reg[0],(LFSR_reg[5]^LFSR_reg[0]),LFSR_reg[4],(LFSR_reg[3]^LFSR_reg[0]),LFSR_reg[2:1]}; 
      default:LFSR_reg<=0; 
    endcase
  end
end

assign parallel_out = LFSR_reg;
  // …
endmodule
