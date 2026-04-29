module alu(
    input  logic [1:0] alu_sel, 
    input  logic [3:0] src,
    input  logic [3:0] dest,

    output logic [3:0] alu_out
);

always_comb begin

    case(alu_sel)
        2'b00 : alu_out = dest + src;
        2'b01	: alu_out = dest - src;
        2'b10	: alu_out = dest * src;
        2'b11 : alu_out = dest / src;
    endcase
end

endmodule