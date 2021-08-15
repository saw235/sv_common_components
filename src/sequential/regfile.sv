interface regfile_if #(parameter N = 32, parameter DWIDTH = 32); 
    logic [DWIDTH-1:0] write_data;
    logic [DWIDTH-1:0] read_data;
    logic [$clog2(DWIDTH)-1:0] read_addr;
    logic [$clog2(DWIDTH)-1:0] write_addr;
    logic write_en;

    modport read_write_single_port (
        input read_addr, 
              write_data,
              write_addr,
              write_en,
        output read_data 
    );
endinterface

module regfile_sync_rst #(
    parameter N = 32,
    parameter DWIDTH = 32
    )(
    input logic clk,
    input logic rst_n,
    regfile_if.read_write_single_port intf
    );
    
    logic [DWIDTH-1:0] mem [0:N-1];

    always_comb begin
        intf.read_data = mem[intf.read_addr];
    end

    integer i;
    always_ff @(posedge clk) begin
        if (!rst_n) begin
            for (i=0; i < N; i=i+1) mem[intf.write_addr] <= 0;
        end else begin
            if (intf.write_en) begin
                mem[intf.write_addr] <= intf.write_data;
            end
        end
    end
endmodule

module regfile_async_rst #(
    parameter N = 32,
    parameter DWIDTH = 32
    )(
    input logic clk,
    input logic rst_n,
    regfile_if.read_write_single_port intf
    );
    
    logic [DWIDTH-1:0] mem [0:N-1];

    always_comb begin
        intf.read_data = mem[intf.read_addr];
    end

    integer i;
    always_ff @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin
            for (i=0; i < N; i=i+1) mem[intf.write_addr] <= 0;
        end else begin
            if (intf.write_en) begin
                mem[intf.write_addr] <= intf.write_data;
            end
        end
    end
endmodule
