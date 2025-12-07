// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "environment.sv"

module tb_top;
  inff inf();
  environment env;
  
  // Instantiate DUT
  comparator dut (
    .a(inf.a),
    .b(inf.b),
    .lt(inf.lt),
    .eq(inf.eq),
    .gt(inf.gt)
  );
  
  initial begin
    $display("===========================================");
    $display("Starting comparator Testbench");
    $display("===========================================");
    
    env = new(inf, 25); // Create environment with 20 transactions
    env.run();
    
    $display("===========================================");
    $display("Testbench Complete");
    $display("===========================================");
    $finish;
  end
  
endmodule