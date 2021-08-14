module latch #(parameter DATAWIDTH = 1)(
    input logic en, 
    input logic [DATAWIDTH-1:0] d, 
    output logic [DATAWIDTH-1:0] q
);

   always_ff @ (en or d)
      if (en)
         q <= d;

endmodule