package Tb;
    module mkTb (Empty);

        rule test;
            let cs1 = ha(1,1);
            $display("c = %b , s = %b", cs1[1] , cs1[0]);
            cs1 = ha(0,0);
            $display("c = %b , s = %b", cs1[1] , cs1[0]);
            let cs2 = ripple_adder_2bit(2'b11, 2'b00, 1);
            $display("c = %b , s = %b", cs2[2] , cs2[1:0]);
            $finish(1);
        endrule

    endmodule: mkTb

    function Bit#(2) ha(Bit#(1) a, Bit#(1) b);
        Bit#(1) s = a ^ b;
        Bit#(1) c = a & b;
        return {c,s};
    endfunction    

    function Bit#(2) fa(Bit#(1) a, Bit#(1) b, Bit#(1) c_in);
        Bit#(2) ab = ha(a, b);
        Bit#(2) abc = ha(ab[0], c_in);
        Bit#(1) c_out = ab[1] | abc[1];
        return {c_out, abc[0]};
    endfunction

    function Bit#(3) ripple_adder_2bit(Bit#(2) a, Bit#(2) b, Bit#(1) c_in);
        
        Bit#(2) s = 0;
        Bit#(1) cout = 0;

        let fa0_out = fa(a[0], b[0], c_in);
        let fa1_out = fa(a[1], b[1], fa0_out[1]);
        s[0] = fa0_out[0];
        s[1] = fa1_out[0];

        return {fa1_out[1], s};
    endfunction

endpackage: Tb



// function Bit#(2) full_adder(Bit#(1) a, Bit#(1) b, Bit#(1) cin);
//     ha
// endfunction

// function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
//     return (sel == 0)? a: b;
// endfunction

