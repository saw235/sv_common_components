import uvm_pkg::*;
`include "uvm_macros.svh"

class env extends uvm_env;
  virtual dff_interface m_if;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    assert(uvm_resource_db#(virtual dff_interface)::read_by_name(
      get_full_name(), "add_sub_if", m_if));
  endfunction: connect_phase

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin
      bit rst = 0;
      bit en = 1;

      m_if.rst = rst;
      m_if.en = en;
      m_if.d = 0;

      #75; 
      `uvm_info("RESULT", $sformatf("d = %0d , q = %0d",
        m_if.d, m_in.q), UVM_LOW);

      m_if.d = 1;
      
      #125;
      `uvm_info("RESULT", $sformatf("d = %0d , q = %0d",
        m_if.d, m_in.q), UVM_LOW);
    
    end
    `uvm_info("", "Finished run phase.", UVM_HIGH);
    phase.drop_objection(this);
  endtask: run_phase
endclass