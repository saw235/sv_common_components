// reset synchronizer
module rst_sync(
    input logic rst_n,
    input logic clk,
    output logic rst_synced
);

    logic q;

    dff_async_rst(
        .clk(clk),
        .d(1'b1),
        .q(q),
        .rst_n(rst_n)
    );

    dff_async_rst(
        .clk(clk),
        .d(q),
        .q(rst_synced),
        .rst_n(rst_n)
    );

endmodule

// clock synchronizer