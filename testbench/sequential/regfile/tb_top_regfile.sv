module tb_top(
    input logic clk
);
    logic rst_n;
    regfile_if regfile_intf;

    regfile_async_rst regfile(
        .clk(clk),
        .rst_n(rst_n),
        .intf(regfile_intf)
    ); 
    
    int count = 0;


    initial begin        
        regfile_intf.read_addr <= 0;
        regfile_intf.write_data <= 0;
        regfile_intf.write_addr <= 0;
        regfile_intf.write_en <= 0;
        rst_n <= 0;
    end

    always @(posedge clk) begin
        count = count + 1;
        case (count) 
            1 : begin
                rst_n <= 1 ;
                regfile_intf.write_en <= 1;
                regfile_intf.write_addr <= 0;
                regfile_intf.write_data <= 32'hffff;
            end
            2 : begin
                regfile_intf.read_addr <= 0;
                regfile_intf.write_en <= 1;
                regfile_intf.write_addr <= 2;
                regfile_intf.write_data <= 32'hfffc;                
            end
            3 : begin
                regfile_intf.read_addr <= 2;
                regfile_intf.write_en <= 1;
                regfile_intf.write_addr <= 31;
                regfile_intf.write_data <= 32'hfff0;     
            end
            4 : begin
                regfile_intf.read_addr <= 31;  
            end
            5 : begin
                rst_n <= 0;
            end
        endcase 

        if (count > 10) begin
            $finish();
        end

    end

    always @(posedge clk) begin
        print_result();
    end

    task print_result(); 
        $display("---------------");
        $display(" read_addr <= %h ", regfile_intf.read_addr);
        $display(" write_data <= %h ", regfile_intf.write_data);
        $display(" write_addr <= %h ", regfile_intf.write_addr);
        $display(" write_en <= %h ", regfile_intf.write_en);
        $display(" rst_n <= %h ", rst_n);
        $display(" read_data => %h ", regfile_intf.read_data);      
    endtask
endmodule




