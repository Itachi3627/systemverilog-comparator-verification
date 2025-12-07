class transaction;
  randc logic [7:0] a;   // first operand
  randc logic [7:0] b;   // second operand
       logic       lt;  // a <  b
       logic       eq;  // a == b
       logic       gt;  // a >  b

  constraint data_range {
    a inside { [8'h00:8'hff] };
    b inside { [8'h00:8'hff] };
  };

   

endclass
