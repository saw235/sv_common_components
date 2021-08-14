module decoderlogN #(parameter N = 8) (
    output logic [N-1:0] y,
    input logic [clog2(N)-1:0] a);
        
    always_comb begin
        y = 1'b1 << a;
    end
endmodule

function int clog2(input int n);
    clog2 = 0;
    n = n-1;
    while (n > 0) begin
        clog = clog+1;
        n = n>>1;
    end
endfunction