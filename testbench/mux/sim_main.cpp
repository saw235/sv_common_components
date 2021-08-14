// DESCRIPTION: Verilator: Basic directed testbench for mux.sv
//
// Author : Alan Saw
//======================================================================

#include "macro.h"

// Include common routines
#include <verilated.h> 
// Include model header, generated from Verilating "top.v"
#include "Vtb_top_mux.h"

int main(int argc, char** argv, char** env) {

    // Prevent unused variable warnings
    if (false && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
    Vtb_top_mux* tb_top = new Vtb_top_mux;

    tb_top->a = 3;
    tb_top->b = 1;
    tb_top->sel = 0;
    
    tb_top->eval();

    assert(tb_top->o == 3);

    tb_top->a = 3;
    tb_top->b = 1;
    tb_top->sel = 1;
    
    tb_top->eval();

    assert(tb_top->o == 1);

    tb_top->a = 3;
    tb_top->b = 2;
    tb_top->sel = 1;
    
    tb_top->eval();

    assert(tb_top->o == 2);    

    tb_top->a_4to1mux = 0;
    tb_top->b_4to1mux = 1;
    tb_top->c_4to1mux = 2;
    tb_top->d_4to1mux = 3;
    tb_top->sel_4to1mux = 3;
    
    tb_top->eval();

    assert(tb_top->o_4to1mux == 3);   

    tb_top->a_4to1mux = 0;
    tb_top->b_4to1mux = 1;
    tb_top->c_4to1mux = 2;
    tb_top->d_4to1mux = 3;
    tb_top->sel_4to1mux = 0;
    
    tb_top->eval();

    assert(tb_top->o_4to1mux == 0);   

    tb_top->a_8to1mux = 0;
    tb_top->b_8to1mux = 1;
    tb_top->c_8to1mux = 2;
    tb_top->d_8to1mux = 3;
    tb_top->e_8to1mux = 7;
    tb_top->f_8to1mux = 6;
    tb_top->g_8to1mux = 5;
    tb_top->h_8to1mux = 4;
    tb_top->sel_8to1mux = 7;
    
    tb_top->eval();

    assert(tb_top->o_8to1mux == 4);   

    // Final model cleanup
    tb_top->final();

    // Destroy model
    delete tb_top;

    // Return good completion status
    return 0;
}
