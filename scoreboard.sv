class scoreboard;
    mailbox #(transaction) mon2scd;
    transaction trans;
    int passed = 0;
    int failed = 0;

  function new(mailbox #(transaction) m2s);
        this.mon2scd = m2s;
    endfunction

    task run();
        logic expected_lt;
        logic expected_gt;
        logic expected_eq;
        
        forever begin
            expected_lt = 0;
            expected_gt = 0;
            expected_eq = 0;
            mon2scd.get(trans);
            if (trans.a < trans.b) begin
                expected_lt = 1'b1;
            end
            else if (trans.a > trans.b) begin
                expected_gt = 1'b1;
            end
            else begin
                expected_eq = 1'b1;
            end
            
            if((trans.lt === expected_lt) & (trans.eq === expected_eq) & (trans.gt === expected_gt)) begin
              $display("[SCOREBOARD] PASSED: A = %h, B = %h, A < B = %h, A == B = %h, A > B = %h", trans.a, trans.b, 	trans.lt, trans.eq, trans.gt);
                passed++;
            end else begin
                $display("[SCOREBOARD] FAIL: A = %h, B = %h, A < B = %h, A == B = %h, A > B = %h", trans.a, trans.b, trans.lt, trans.eq, trans.gt);
                failed++;
            end
        end
    endtask

    function void report();
    $display("===========================================");
    $display("[SCOREBOARD] Test Results:");
    $display("  PASSED: %0d", passed);
    $display("  FAILED: %0d", failed);
    $display("  TOTAL:  %0d", passed + failed);
    $display("===========================================");
    endfunction
endclass