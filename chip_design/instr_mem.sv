module instr_mem(
    input  logic       clk,
    input  logic       we,
    input  logic [3:0] addr,
    input  logic [6:0] d_in,
    output logic [6:0] d_out
);

logic [6:0] mem [0:15];

initial begin

    mem[0] = 7'b1000001;
    mem[1] = 7'b1000001;
    mem[2] = 7'b1000010;
    mem[3] = 7'b1000110;
    mem[4] = 7'b0100100;

end

always_ff @(posedge clk) begin 
    if(we) mem[addr] <= d_in;
end

assign d_out = mem[addr];

endmodule