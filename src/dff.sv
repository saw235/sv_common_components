// Replace this with your design
module dff_async_rst (
    input bit clk,
    dff_interface intf
);

always_ff @(clk) begin
    if (intf.rst) begin
        intf.q <= 0;
    end else begin
        if (intf.en) begin
            intf.q <= intf.d;  
        end
    end
end 
endmodule

interface dff_interface (
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit en,
    input bit rst);
endinterface