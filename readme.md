This repository helps you quickly setup a SystemVerilog starter template
with a basic Verilator testbench

## Getting started

### Dependencies
- Verilator
- Fusesoc 

```
git clone <this design> <dir>
cd <dir>

# Add fusesoc libraries and dependencies 
fusesoc library add my_design .
fusesoc library add fusesoc-cores https://github.com/fusesoc/fusesoc-cores

# Runs simulation
fusesoc run --target=sim my_design
```