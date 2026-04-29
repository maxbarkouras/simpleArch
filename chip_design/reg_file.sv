module reg_file(
    input  logic       clk,
    input  logic       we,

    input  logic [1:0] rw,
    input  logic [1:0] a_in,
    input  logic [1:0] b_in,

    input  logic [3:0] d_in,
    output logic [3:0] a_out,
    output logic [3:0] b_out
);

logic [3:0] mem [0:3];

initial begin
    mem[0] = 4'd0;
    mem[1] = 4'd0;
    mem[2] = 4'd0;
    mem[3] = 4'd0;
end

always_ff @(posedge clk) begin 
    if(we) mem[rw] <= d_in;
end

assign a_out = mem[a_in];
assign b_out = mem[b_in];

endmodule