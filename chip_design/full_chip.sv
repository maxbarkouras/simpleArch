module chip(
    input logic       clk,
    input logic       prog_mem_we,
    input logic [3:0] prog_mem_addr,
    input logic [6:0] prog_mem_din
);

logic [3:0] npc_in;
logic [3:0] npc_out;

logic en_pc;
assign en_pc = ~prog_mem_we;

logic [6:0] prog_mem_dout;
logic [3:0] instr_addr;

logic reg_file_we = 1'b1;
logic [3:0] a_reg_out;
logic [3:0] b_reg_out;

logic [3:0] alu_out;
logic [3:0] alu_src; 

assign instr_addr = prog_mem_we ? prog_mem_addr : npc_out;

add4 pc_adder (
    .PC(npc_out),
    .NPC(npc_in)
);

NPC npc(
    .clk(clk),
    .en(en_pc),
    .d_in(npc_in),
    .q_out(npc_out)
);

instr_mem instr_mem(
    .clk(clk),
    .we(prog_mem_we),
    .addr(instr_addr),
    .d_in(prog_mem_din),
    .d_out(prog_mem_dout)
);

reg_file reg_file(
    .clk(clk),
    .we(reg_file_we),
    .rw(prog_mem_dout[3:2]),
    .a_in(prog_mem_dout[1:0]),
    .b_in(prog_mem_dout[3:2]),
    .d_in(alu_out),
    .a_out(a_reg_out),
    .b_out(b_reg_out)
);

alu alu(
    .alu_sel(prog_mem_dout[5:4]), 
    .src(alu_src),
    .dest(b_reg_out),
    .alu_out(alu_out)
);

always_comb begin

    if(prog_mem_dout[6] == 1) begin
        alu_src = {2'b0, prog_mem_dout[1:0]};
    end else begin
        alu_src = a_reg_out;
    end

end

endmodule