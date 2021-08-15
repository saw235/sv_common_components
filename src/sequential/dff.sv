module dff_sync_rst_en #(parameter DWIDTH = 1) (
    input bit clk,
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit en,
    input bit rst_n
);

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            q <= 0;
        end else begin
            if (en) begin
                q <= d;  
            end
        end
    end 
endmodule

module dff_sync_rst #(parameter DWIDTH = 1) (
    input bit clk,
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit rst_n
);

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            q <= 0;
        end else begin
            q <= d;
        end
    end 
endmodule

module dff_async_rst_en #(parameter DWIDTH = 1) (
    input bit clk,
    input bit[DWIDTH-1:0] d,
    output bit[DWIDTH-1:0] q,
    input bit en,
    input bit rst_n
);

    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
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
    input bit rst_n
);
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            q <= 0;
        end else begin 
                q <= d;
        end
    end 
endmodule
