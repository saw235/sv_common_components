module tb_top_shifter(
    input logic[4:0] n,
    input logic[31:0] d,
    output logic[31:0] out
);

    barrel_shift_right #(32) bs(.n(n), .d(d), .out(out));
    
endmodule




