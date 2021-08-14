// DESCRIPTION: Verilator: Basic directed testbench for adder.sv
//
// Author : Alan Saw
//======================================================================

// Include common routines
#include <verilated.h> 
// Include model header, generated from Verilating "top.v"
#include "Vtb_top_adder.h"

#include "macro.h"

void print_res_fulladder(Vtb_top_adder* tbtop);
void print_res_ripple_2bit(Vtb_top_adder* tb_top);
void print_res_carry_select_8bit(Vtb_top_adder* tb_top);

int main(int argc, char** argv, char** env) {
    // Prevent unused variable warnings
    if (false && argc && argv && env) {}

    // Construct the Verilated model, from Vtop.h generated from Verilating "Vtb_top_adder.v"
    Vtb_top_adder* tb_top = new Vtb_top_adder;

    int cycles = 0;
    int testdone = 0;

    printf("----- testing 1 bit adder -----\n");

    tb_top -> a = 0;
    tb_top -> b = 0;
    tb_top -> cin = 0;

    tb_top-> eval();
    assert(tb_top->sum == 0);
    assert(tb_top->cout == 0);
    
    print_res_fulladder(tb_top);


    tb_top -> a = 1;
    tb_top -> b = 1;
    tb_top -> cin = 1;

    tb_top-> eval();
    assert(tb_top->sum == 1);
    assert(tb_top->cout == 1);
    print_res_fulladder(tb_top);

    tb_top -> a = 1;
    tb_top -> b = 0;
    tb_top -> cin = 1;

    tb_top-> eval();
    assert(tb_top->sum == 0);
    assert(tb_top->cout == 1);
    print_res_fulladder(tb_top);

    tb_top -> a = 0;
    tb_top -> b = 0;
    tb_top -> cin = 1;

    tb_top-> eval();
    assert(tb_top->sum == 1);
    assert(tb_top->cout == 0);
    print_res_fulladder(tb_top);

    printf("----- end testing 1 bit adder -----\n");
    printf("----- testing 2 bit adder -----\n");
    tb_top -> a_2bit = 1;
    tb_top -> b_2bit = 2;
    tb_top -> cin_2bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_2bit == 3);
    assert(tb_top->cout_2bit == 0);
    print_res_ripple_2bit(tb_top);

    tb_top -> a_2bit = 1;
    tb_top -> b_2bit = 1;
    tb_top -> cin_2bit = 1;

    tb_top-> eval();
    assert(tb_top->sum_2bit == 3);
    assert(tb_top->cout_2bit == 0);
    print_res_ripple_2bit(tb_top);

    tb_top -> a_2bit = 0;
    tb_top -> b_2bit = 0;
    tb_top -> cin_2bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_2bit == 0);
    assert(tb_top->cout_2bit == 0);
    print_res_ripple_2bit(tb_top);


    tb_top -> a_2bit = 2;
    tb_top -> b_2bit = 2;
    tb_top -> cin_2bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_2bit == 0);
    assert(tb_top->cout_2bit == 1);
    print_res_ripple_2bit(tb_top);


    tb_top -> a_2bit = 1;
    tb_top -> b_2bit = 1;
    tb_top -> cin_2bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_2bit == 2);
    assert(tb_top->cout_2bit == 0);
    print_res_ripple_2bit(tb_top);


    printf("----- end testing 2 bit adder -----\n");
    printf("----- testing 8 bit adder -----\n");

    tb_top -> a_8bit = 1;
    tb_top -> b_8bit = 2;
    tb_top -> cin_8bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 3);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);

    tb_top -> a_8bit = 1;
    tb_top -> b_8bit = 1;
    tb_top -> cin_8bit = 1;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 3);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);

    tb_top -> a_8bit = 0;
    tb_top -> b_8bit = 0;
    tb_top -> cin_8bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 0);
    assert(tb_top->cout_8bit == 0);    
    print_res_carry_select_8bit(tb_top);


    tb_top -> a_8bit = 2;
    tb_top -> b_8bit = 2;
    tb_top -> cin_8bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 4);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);


    tb_top -> a_8bit = 1;
    tb_top -> b_8bit = 1;
    tb_top -> cin_8bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 2);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);

    tb_top -> a_8bit = 4;
    tb_top -> b_8bit = 4;
    tb_top -> cin_8bit = 1;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 9);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);

    tb_top -> a_8bit = 4;
    tb_top -> b_8bit = 2;
    tb_top -> cin_8bit = 0;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 6);
    assert(tb_top->cout_8bit == 0);
    print_res_carry_select_8bit(tb_top);

    tb_top -> a_8bit = 255;
    tb_top -> b_8bit = 255;
    tb_top -> cin_8bit = 1;

    tb_top-> eval();
    assert(tb_top->sum_8bit == 255);
    assert(tb_top->cout_8bit == 1);
    print_res_carry_select_8bit(tb_top);
    printf("----- end testing 8 bit adder -----\n");
    // Final model cleanup
    tb_top->final();

    // Destroy model
    delete tb_top;

    // Return good completion status
    return 0;
}

void print_res_fulladder(Vtb_top_adder* tb_top){
    printf("tb_top a: %d b: %d cin: %d sum: %d cout:%d \n",
            tb_top -> a,
            tb_top -> b,
            tb_top -> cin,
            tb_top -> sum,
            tb_top -> cout );
}


void print_res_ripple_2bit(Vtb_top_adder* tb_top){
    printf("tb_top a: %d b: %d cin: %d sum: %d cout:%d \n",
            tb_top -> a_2bit,
            tb_top -> b_2bit,
            tb_top -> cin_2bit,
            tb_top -> sum_2bit,
            tb_top -> cout_2bit );
}

void print_res_carry_select_8bit(Vtb_top_adder* tb_top){
    printf("tb_top a: %d b: %d cin: %d sum: %d cout:%d \n",
            tb_top -> a_8bit,
            tb_top -> b_8bit,
            tb_top -> cin_8bit,
            tb_top -> sum_8bit,
            tb_top -> cout_8bit );
}
