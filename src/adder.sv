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
    full_adder_intf.dut intf
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

module carry_select_adder_8bit (full_adder_intf.dut intf);
    localparam BITWIDTH = 4 ;
    full_adder_intf #(BITWIDTH) fa_lo_if;
    full_adder_intf #(BITWIDTH) fa_hi_cin0_if;
    full_adder_intf #(BITWIDTH) fa_hi_cin1_if;

    ripple_adder_generic #(BITWIDTH) fa_lo(fa_lo_if);
    ripple_adder_generic #(BITWIDTH) fa_hi_cin_0(fa_hi_cin0_if);
    ripple_adder_generic #(BITWIDTH) fa_hi_cin_1(fa_hi_cin1_if);

    assign fa_lo_if.a = intf.a[BITWIDTH-1:0];
    assign fa_lo_if.b = intf.b[BITWIDTH-1:0];
    assign fa_lo_if.cin = intf.cin;

    assign intf.s[BITWIDTH-1:0] = fa_lo_if.s; 

    assign fa_hi_cin0_if.a = intf.a[BITWIDTH*2-1:BITWIDTH];
    assign fa_hi_cin0_if.b = intf.b[BITWIDTH*2-1:BITWIDTH];
    assign fa_hi_cin0_if.cin = 1'b0;

    assign fa_hi_cin1_if.a = intf.a[BITWIDTH*2-1:BITWIDTH];
    assign fa_hi_cin1_if.b = intf.b[BITWIDTH*2-1:BITWIDTH];
    assign fa_hi_cin1_if.cin = 1'b1;

    always_comb begin
        unique case (fa_lo_if.cout)
            1'b0 : intf.cout = fa_hi_cin0_if.cout;
            1'b1 : intf.cout = fa_hi_cin1_if.cout;
        endcase

        unique case (fa_lo_if.cout)
            1'b0 : intf.s[BITWIDTH*2-1:BITWIDTH] = fa_hi_cin0_if.s;
            1'b1 : intf.s[BITWIDTH*2-1:BITWIDTH] = fa_hi_cin1_if.s;
        endcase
    end
 
endmodule

module ripple_adder_generic #(parameter int BITWIDTH = 4) (full_adder_intf.dut intf);
    genvar fa_i;
    generate
        // if it just a single bit
        // reuse fa
        if (BITWIDTH == 1) begin
            full_adder fa(intf);
        end else begin

            // else instantiate the interface n times
            // and 1 bit adder n times
            for (fa_i = 0; fa_i < BITWIDTH; fa_i=fa_i+1) begin : fa 
                full_adder_intf #(1) fa_n_intf;
                full_adder fa_n(.intf(fa_n_intf));
            end

            // connects them
            for (fa_i = 0; fa_i < BITWIDTH; fa_i=fa_i+1) begin
                
                // connects to io pins
                assign fa[fa_i].fa_n_intf.a = intf.a[fa_i];
                assign fa[fa_i].fa_n_intf.b = intf.b[fa_i];
                assign intf.s[fa_i] = fa[fa_i].fa_n_intf.s;

                // connects the cin to cout
                if (fa_i != BITWIDTH-1) begin
                    assign fa[fa_i+1].fa_n_intf.cin = fa[fa_i].fa_n_intf.cout;
                end
            end

            // connects the edge cin and cout
            assign fa[0].fa_n_intf.cin = intf.cin;
            assign intf.cout = fa[BITWIDTH-1].fa_n_intf.cout;

        end 
    endgenerate
endmodule

module ripple_adder_2bit(
    full_adder_intf.dut intf
);    

    full_adder_intf #(1) fa1_intf;
    full_adder_intf #(1) fa2_intf;

    assign fa1_intf.a = intf.a[0];
    assign fa2_intf.a = intf.a[1];

    assign fa1_intf.b = intf.b[0];
    assign fa2_intf.b = intf.b[1];

    assign intf.s[0] = fa1_intf.s;
    assign intf.s[1] = fa2_intf.s;

    assign fa1_intf.cin = intf.cin;
    assign fa2_intf.cin = fa1_intf.cout;

    assign intf.cout = fa2_intf.cout;

    full_adder fa1(.intf(fa1_intf));
    full_adder fa2(.intf(fa2_intf));

endmodule

interface full_adder_intf #(parameter int BITWIDTH = 1);
    logic[BITWIDTH-1:0] a;
    logic[BITWIDTH-1:0] b;
    logic[BITWIDTH-1:0] s;
    logic cin;
    logic cout;

    modport dut (input a, b, cin,
                        output s, cout);
endinterface //full_adder_intf