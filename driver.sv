class driver;
    mailbox #(transaction) gen2drv;
    transaction trans;
    virtual inff.driver vif; 
    
  function new(virtual inff.driver vif, mailbox #(transaction) g2d);
        this.gen2drv = g2d;
        this.vif = vif;
    endfunction

    task run();
        $display("[DRIVER] Starting driver");
        forever begin
            gen2drv.get(trans);
            drive_transaction(trans);
        end
    endtask
    
    task drive_transaction(transaction trans);
        vif.a = trans.a;
        vif.b = trans.b;
        #5;
        ->vif.sample_enable;
        #5;
    endtask
endclass