// DESCRIPTION: Verilator: Basic directed testbench for mux.sv
//
// Author : Alan Saw
//======================================================================

#include "macro.h"
#include <iostream>
#include <stdlib.h>
// Include common routines
#include <verilated.h> 
// Include model header, generated from Verilating "top.v"
#include "Vtb_top.h"

int main(int argc, char** argv, char** env) {

    // Prevent unused variable warnings
    if (false && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtb_top* tb_top = new Vtb_top;

    while(!Verilated::gotFinish())
    {   
        tb_top -> clk = !tb_top -> clk;

        tb_top -> eval();
    }
    // Final model cleanup
    tb_top->final();

    // Destroy model
    delete tb_top;

    // Return good completion status
    return 0;
}
