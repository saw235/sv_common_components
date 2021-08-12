module tb_top();
    
    bit clk;
    env tb_env;

    dff_async_rst dff(
        .clk(clk)
    ); 

    initial begin
        tb_env = new;        
        // Set the interface into the resource database.
        uvm_resource_db #(virtual dff_interface)::set("env",
        "dff_interface", dff.intf);

        clk = 0;
    end

    forever begin
        #(50) clk = ~clk;
    end

    initial begin
        $dumpvars(0, tb_top);
    end

endmodule




