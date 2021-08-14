module half_adder(
    input logic a,
    input logic b,
    output logic s,
    output logic c);

    always_comb begin : half_adder_comb
        s = a ^ b;
        c = a & b;
    end
endmodule

module full_adder(
    full_adder_intf intf
);

    logic s_ha1;
    logic s_ha2;
    logic c_ha1;
    logic c_ha2;

    half_adder ha1(.a(intf.a), .b(intf.b), .s(s_ha1), .c(c_ha1));
    half_adder ha2(.a(intf.cin), .b(s_ha1), .s(intf.s), .c(c_ha2));

    always_comb begin : full_adder_comb
        intf.cout = c_ha1 | c_ha2;
    end
endmodule

interface full_adder_intf(
    input logic a,
    input logic b,
    input logic cin,
    output logic s,
    output logic cout
);
endinterface //full_adder_intf