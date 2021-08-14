module mux_2to1 #(parameter DATAWIDTH = 8)(
    input logic[DATAWIDTH-1:0] a,
    input logic[DATAWIDTH-1:0] b,
    input logic sel,
    output logic o
);
    always_comb begin
        unique case (sel)
            0 : o = a;
            1 : o = b;
        endcase
    end 
endmodule

module mux_4to1 #(parameter DATAWIDTH = 8)(
    input logic[DATAWIDTH-1:0] a,
    input logic[DATAWIDTH-1:0] b,
    input logic[DATAWIDTH-1:0] c,
    input logic[DATAWIDTH-1:0] d,

    input logic[1:0] sel,
    output logic o
);
    logic[DATAWIDTH-1:0] mux_out_0;
    logic[DATAWIDTH-1:0] mux_out_1;

    mux_2to1 #(DATAWIDTH) mux0(.a(a), .b(b), .o(mux_out_0), .sel(sel[0]));
    mux_2to1 #(DATAWIDTH) mux1(.a(c), .b(d), .o(mux_out_1), .sel(sel[0]));
    mux_2to1 #(DATAWIDTH) muxout(.a(mux_out_0), .b(mux_out_1), .o(o), .sel(sel[1]));

endmodule

module mux_8to1 #(parameter DATAWIDTH = 8)(
    input logic[DATAWIDTH-1:0] a,
    input logic[DATAWIDTH-1:0] b,
    input logic[DATAWIDTH-1:0] c,
    input logic[DATAWIDTH-1:0] d,
    input logic[DATAWIDTH-1:0] e,
    input logic[DATAWIDTH-1:0] f,
    input logic[DATAWIDTH-1:0] g,
    input logic[DATAWIDTH-1:0] h,
    input logic[2:0] sel,
    output logic o
);
    logic[DATAWIDTH-1:0] mux_out_0;
    logic[DATAWIDTH-1:0] mux_out_1;

    mux_4to2 #(DATAWIDTH) mux0(.a(a), .b(b), .c(c), .d(d), .o(mux_out_0), .sel(sel[1:0]));
    mux_4to2 #(DATAWIDTH) mux1(.a(e), .b(f), .c(g), .d(h), .o(mux_out_1), .sel(sel[1:0]));
    mux_2to1 #(DATAWIDTH) muxout(.a(mux_out_0), .b(mux_out_1), .o(o), .sel(sel[2]));

endmodule