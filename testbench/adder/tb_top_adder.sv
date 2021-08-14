module tb_top_adder(
    input logic clk,
    input logic rst,
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout,


    input logic[1:0] a_2bit,
    input logic[1:0] b_2bit,
    output logic[1:0] sum_2bit,

    input logic cin_2bit,
    output logic cout_2bit
);
    
    full_adder_intf fa_intf;
    full_adder_intf #(2) ripple_2bit_intf;

    full_adder fa_inst(.intf(fa_intf));
    assign fa_intf.a = a;
    assign fa_intf.b = b;
    assign fa_intf.cin = cin;
    assign sum = fa_intf.s;
    assign cout = fa_intf.cout;

    ripple_adder_generic #(2) adder_inst(.intf(ripple_2bit_intf));
    assign ripple_2bit_intf.a = a_2bit;
    assign ripple_2bit_intf.b = b_2bit;
    assign ripple_2bit_intf.cin = cin_2bit;
    assign cout_2bit = ripple_2bit_intf.cout;
    assign sum_2bit = ripple_2bit_intf.s;

endmodule




