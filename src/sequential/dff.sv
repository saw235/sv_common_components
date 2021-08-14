module dff_sync_rst #(parameter DWIDTH = 1) (
    input bit clk,
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit en,
    input bit rst
);

    always_ff @(posedge clk) begin
        if (rst) begin
            q <= 0;
        end else begin
            if (en) begin
                q <= d;  
            end
        end
    end 
endmodule

module dff_async_rst #(parameter DWIDTH = 1) (
    input bit clk,
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit en,
    input bit rst
);

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            q <= 0;
        end else begin 
            if (en) begin
                q <= d;
            end
        end
    end 
endmodule
