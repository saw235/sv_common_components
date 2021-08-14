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