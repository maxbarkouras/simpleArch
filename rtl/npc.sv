module npc(
    input  logic       clk,
    input  logic       en,
    input  logic [3:0] d_in,
    output logic [3:0] q_out
);

initial q_out = 4'b0;

always @(posedge clk) begin 
    if(en) q_out <= d_in;
end

endmodule
