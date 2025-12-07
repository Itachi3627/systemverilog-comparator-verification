// N-bit digital comparator
module comparator #(
    parameter int N = 8      // width of the inputs
)(
    input  logic [N-1:0] a,  // first operand
    input  logic [N-1:0] b,  // second operand
    output logic         lt, // a <  b
    output logic         eq, // a == b
    output logic         gt  // a >  b
);

    always_comb begin
        // default
        lt = 1'b0;
        eq = 1'b0;
        gt = 1'b0;

        if (a < b) begin
            lt = 1'b1;
        end
        else if (a > b) begin
            gt = 1'b1;
        end
        else begin
            eq = 1'b1;
        end
    end

endmodule
