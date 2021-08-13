module tb_top(
    input logic clk,
    input logic rst,
    input logic d,
    input logic en
);
    
    bit q;
    bit d;
    
    dff_interface intf(.d(d), .q(q), .rst(rst), .en(en));

    dff_async_rst dff(
        .clk(clk),
        .intf(intf)
    ); 
    
    int count = 0;

    initial begin
        print_result();
    end

    always @(posedge clk) begin
        count = count + 1;
        print_result();
    end

    task print_result(); 
        $display("---------------");
        $display("cycle = %d", count);
        $display("d = %b", d);
        $display("q = %b", q);
        $display("en = %b", en);
        $display("rst = %b", rst);     
        $display("---------------");   
    endtask

endmodule




