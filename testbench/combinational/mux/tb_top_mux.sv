module tb_top_mux(
    input logic[1:0] a,
    input logic[1:0] b,
    input logic sel,
    output logic[1:0] o,

    input logic[1:0] a_4to1mux,
    input logic[1:0] b_4to1mux,
    input logic[1:0] c_4to1mux,
    input logic[1:0] d_4to1mux,
    input logic[1:0] sel_4to1mux,
    output logic[1:0] o_4to1mux,

    input logic[1:0] a_8to1mux,
    input logic[1:0] b_8to1mux,
    input logic[1:0] c_8to1mux,
    input logic[1:0] d_8to1mux,
    input logic[1:0] e_8to1mux,
    input logic[1:0] f_8to1mux,
    input logic[1:0] g_8to1mux,
    input logic[1:0] h_8to1mux,
    input logic[2:0] sel_8to1mux,
    output logic[1:0] o_8to1mux
);
    mux_2to1 #(2) mux_2_1_inst(.a(a), .b(b), .o(o), .sel(sel));
    mux_4to1 #(2) mux_4_1_inst(.a(a_4to1mux), .b(b_4to1mux), .c(c_4to1mux), .d(d_4to1mux), .o(o_4to1mux), .sel(sel_4to1mux));
    mux_8to1 #(2) mux_8_1_inst(.a(a_8to1mux), .b(b_8to1mux), .c(c_8to1mux), .d(d_8to1mux), .e(e_8to1mux), .f(f_8to1mux), .g(g_8to1mux), .h(h_8to1mux), .o(o_8to1mux), .sel(sel_8to1mux));
endmodule




