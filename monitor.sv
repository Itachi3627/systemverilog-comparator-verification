class monitor;
    mailbox #(transaction) mon2scd;
    transaction trans;
    virtual inff.monitor vif;

  function new(virtual inff.monitor vif, mailbox #(transaction) m2s);
        this.vif= vif;
        this.mon2scd = m2s;
    endfunction

    task run();
        $display("[MONITOR] Starting monitor");

        forever begin
            @(vif.sample_enable);
            trans = new();
            trans.a = vif.a;
            trans.b = vif.b;
            trans.lt = vif.lt;
            trans.eq = vif.eq;
            trans.gt = vif.gt;

            mon2scd.put(trans);
            $display("[Monitor] Captured: A = %h, B = %h, A < B = %h, A == B = %h, A > B = %h", trans.a, trans.b, trans.lt, trans.eq, trans.gt);
        end
    endtask
endclass