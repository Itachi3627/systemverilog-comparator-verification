interface inff #(parameter int N = 8);

    logic [N-1:0] a;   // first operand
    logic [N-1:0] b;   // second operand
    logic         lt;  // a <  b
    logic         eq;  // a == b
    logic         gt;  // a >  b

    event sample_enable;

    modport dut (
        input a,b,
        output lt,eq,gt
    );

    modport driver (
        output a,b,
        input lt,eq,gt
    );

    modport monitor (
        input a,b,
        input lt,eq,gt
    );


endinterface
