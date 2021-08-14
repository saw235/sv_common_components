module tb_top(
    input logic clk
);

    logic q;
    logic rst;
    logic d;
    logic en;  

    dff_sync_rst dff(
        .clk(clk),
        .d(d),
        .q(q),
        .en(en),
        .rst(rst)
    ); 
    
    int count = 0;


    initial begin        
        d <= 0;
        en <= 1;
        rst <= 1;
    end

    always @(posedge clk) begin
        count = count + 1;
        case (count) 
            1 : begin
                d <= 1;
            end
            3 : begin
                rst <= 0;
            end
            5 : begin
                en <= 0;
            end
            7 : begin
                d <= 0;
                en <= 1;
            end
            8 : begin
                d <= 1;
            end
            9 : begin
                rst <= 1;
            end
        endcase 

        if (count > 10) begin
            $finish();
        end

    end

    always @(posedge clk) begin
        print_result_dff();
    end

    task print_result_dff(); 
        $display("---------------");
        $display("cycle = %d", count);
        $display("d <= %b", d);
        $display("en <= %b", en);
        $display("rst <= %b", rst);     
        $display("q => %b", q);
    endtask

endmodule




