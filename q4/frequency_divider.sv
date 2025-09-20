module frequency_divider (input logic clk,
                          input logic rst_n,
                          output logic divider_out);
//complete here
  localparam logic [15:0] PI_18  = 16'hFFEE;
  localparam logic [15:0] PI_866 = 16'hFC9E;

  logic [15:0] Q;
  logic        PI_sel;
  logic        Co;
  logic        ld;

  assign Co = (Q == 16'hFFFF);
  assign ld = Co;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      Q <= PI_18;
      PI_sel <= 1'b0;
      divider_out <= 1'b0;
    end else if (ld) begin
      Q <= (PI_sel ? PI_18 : PI_866);
      PI_sel <= ~PI_sel;
      divider_out <= ~divider_out;
    end else begin
      Q <= Q + 16'd1;
    end
  end

endmodule
