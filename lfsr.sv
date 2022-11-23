module sreg4(
    input logic       clk,
    input logic       rst,
    input logic       data_in,
    input logic       data_out,
    input logic       en
);

      logic [3:0]     sreg;

      always_ff @ (posedge clk)
          if ((rst) || (simcyc <2))
              sreg <= 4'b0;
          else if(en == 1) begin
              sreg <= {sreg[2:0], data_in};
          end
      assign data_out = sreg[3:0];
endmodule

