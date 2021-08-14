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
#include "Vtb_top_shifter.h"

int main(int argc, char** argv, char** env) {

    // Prevent unused variable warnings
    if (false && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtb_top_shifter* tb_top = new Vtb_top_shifter;

    tb_top->n = 1;
    tb_top->d = 16;    
    tb_top->eval();

    ASSERT(tb_top->out == 8, "");

    tb_top->n = 2;
    tb_top->d = 16;    
    tb_top->eval();

    ASSERT(tb_top->out == 4, "");

    tb_top->n = 3;
    tb_top->d = 16;    
    tb_top->eval();

    ASSERT(tb_top->out == 2, "");

    tb_top->n = 4;
    tb_top->d = 16;    
    tb_top->eval();

    ASSERT(tb_top->out == 1, "");

    tb_top->n = 5;
    tb_top->d = 16;    
    tb_top->eval();

    ASSERT(tb_top->out == 0, "");

    tb_top->n = 1;
    tb_top->d = 17;    
    tb_top->eval();

    ASSERT(tb_top->out == 8, "");

    tb_top->n = 5;
    tb_top->d = 256; // 2^8    
    tb_top->eval();

    // 2^8/2^5 = 2^3
    ASSERT(tb_top->out == 8, "");

    // Final model cleanup
    tb_top->final();

    // Destroy model
    delete tb_top;

    // Return good completion status
    return 0;
}
