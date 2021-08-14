module barrel_shift_right #(parameter DATAWIDTH = 32) (
    input logic [$clog2(DATAWIDTH)-1:0] n,
    input logic [DATAWIDTH-1:0] d,
    output logic [DATAWIDTH-1:0] out
);
    always_comb begin : barrel_shift
        out = d >> n; 
    end
endmodule

module barrel_shift_left #(parameter DATAWIDTH = 32) (
    input logic [$clog2(DATAWIDTH)-1:0] n,
    input logic [DATAWIDTH-1:0] d,
    output logic [DATAWIDTH-1:0] out
);
    always_comb begin : barrel_shift
        out = d << n; 
    end
endmodule