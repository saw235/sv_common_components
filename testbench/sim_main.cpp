// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

// Include common routines
#include <verilated.h> 
// Include model header, generated from Verilating "top.v"
#include "Vtb_top_adder.h"

void print_res(Vtb_top_adder* tbtop);

int main(int argc, char** argv, char** env) {
    // See a similar example walkthrough in the verilator manpage.

    // This is intended to be a minimal example.  Before copying this to start a
    // real project, it is better to start with a more complete example,
    // e.g. examples/c_tracing.

    // Prevent unused variable warnings
    if (false && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtb_top_adder* tb_top = new Vtb_top_adder;

    int cycles = 0;
    int testdone = 0;

    
    tb_top -> a = 0;
    tb_top -> b = 0;
    tb_top -> cin = 0;

    tb_top-> eval();
    print_res(tb_top);


    tb_top -> a = 1;
    tb_top -> b = 1;
    tb_top -> cin = 1;

    tb_top-> eval();
    print_res(tb_top);

    tb_top -> a = 1;
    tb_top -> b = 0;
    tb_top -> cin = 1;

    tb_top-> eval();
    print_res(tb_top);

    tb_top -> a = 0;
    tb_top -> b = 0;
    tb_top -> cin = 1;

    tb_top-> eval();
    print_res(tb_top);

    // Final model cleanup
    tb_top->final();

    // Destroy model
    delete tb_top;

    // Return good completion status
    return 0;
}

void print_res(Vtb_top_adder* tb_top){
    printf("tb_top a: %d b: %d cin: %d sum: %d cout:%d \n",
            tb_top -> a,
            tb_top -> b,
            tb_top -> cin,
            tb_top -> sum,
            tb_top -> cout );
}
