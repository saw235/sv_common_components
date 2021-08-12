// Replace this with your design

module dff_async_rst(
    input bit clk,
    dff_interface intf
);

always_ff @(clk) begin
    if (rst) begin
        q <= 0;
    end else begin
        if (en) begin
            q <= d;  
        end
    end
end 
endmodule

interface dff_interface;
    input bit d;
    output bit q;
    input bit en;
    input bit rst;
endinterface