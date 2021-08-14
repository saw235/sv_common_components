module tb_top_adder(
    input logic clk,
    input logic rst,
    input logic a,
    input logic b,
    input logic cin,
    output logic sum,
    output logic cout
);
    
    full_adder_intf intf(.a(a), .b(b), .cin(cin), .s(sum), .cout(cout)); 

    full_adder fa_inst(.intf(intf));
    
endmodule




