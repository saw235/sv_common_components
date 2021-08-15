This repository contains the common digital design modules such as adders, multiplers, decoders, encoders, pwm, filters etc in SystemVerilog

## Getting started

### Dependencies (For SystemVerilog)
- Install Verilator >= v4.0 (See https://verilator.org/guide/latest/install.html)
- Fusesoc >= 1.12 (See https://fusesoc.readthedocs.io/en/stable/user/installation.html)

Tested on Linux Ubuntu

### To run a testbench simulation
```
git clone https://github.com/saw235/sv_common_components.git
cd sv_common_components

# Add fusesoc libraries and dependencies 
fusesoc library add common-components .
fusesoc library add fusesoc-cores https://github.com/fusesoc/fusesoc-cores

# Runs simulation
fusesoc run --target=adder_tb_sim xsaw::commoncomponents
```

### To integrate to your design (SystemVerilog)

First add the library to your fusesoc environment
```
fusesoc library add common_components https://github.com/saw235/sv_common_components.git
```

Then add ```depend : xsaw::common-components:0.1.0``` under your fileset

### Documentation

| Module name       | Description  |
| ------------- |:-------------:|
| half_adder      | 1 bit half-adder |
| full_adder  | 1 bit full-adder |
| ripple_adder_2bit  | 2 bit ripple-adder |
| ripple_adder_generic  | N bit ripple-adder |
| carry_select_adder_8bit  | Carry select-adder, less delay but bigger area |
| latch  |  |
| dff_sync_rst  | D flip-flop with synchronous active-low reset |
| dff_async_rst  | D flip-flop with asynchronous active-low reset |
| dff_sync_rst_en  | D flip-flop with synchronous active-low reset and enable |
| dff_async_rst_en  | D flip-flop with asynchronous active-low reset and enable |
| regfile_sync_rst  | Register file with synchronous active-low reset |
| regfile_async_rst  | Register file awith synchronous active-low reset  |
| rst_sync  | Active-low reset synchronizer |
| barrel_shift_right  | Generic barrel shifter right |
| barrel_shift_left  | Generic barrel shifter left |
| mux_2to1  |  |
| mux_4to1  |  |
| mux_8to1  |  |
| decoderlogN  | Generic N to log N decoder |