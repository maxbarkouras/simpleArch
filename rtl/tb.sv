module tb;

logic       clk = 1'b0;
logic       prog_mem_we;
logic [3:0] prog_mem_addr;
logic [6:0] prog_mem_din;

cpu simpleArch(.*);

always #5 clk = ~clk;

initial begin
    prog_mem_we = 0;
    prog_mem_addr = 0;
    prog_mem_din = 0;

    #70;
    $finish;
end

always @(posedge clk) begin
    #1;
    $display("PC=%0d instr=%07b r0=%0d r1=%0d r2=%0d r3=%0d",
        simpleArch.npc_out,
        simpleArch.prog_mem_dout,
        simpleArch.reg_file.mem[0],
        simpleArch.reg_file.mem[1],
        simpleArch.reg_file.mem[2],
        simpleArch.reg_file.mem[3]
    );
end

endmodule
