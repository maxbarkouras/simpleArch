module add4(
    input  logic [3:0] PC,
    output logic [3:0] NPC
);

assign NPC = PC + 4'b1;

endmodule