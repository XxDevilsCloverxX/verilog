module top;

reg [3:0] A;
reg [3:0] B;
reg [7:0] PRODUCT;
reg [3:0] COUNTER;
initial begin
    A = 4'd4;
    B = 4'd6;
    $display("%b + %b = %b", A,B, A+B);
    $display("%b - %b = %b", A,B, B-A);
    PRODUCT = A * B;
    $display("%b * %b = %b", A,B,PRODUCT);
    $display("%b is %h in hex", PRODUCT, PRODUCT);
    COUNTER = 4'b0;
    for(integer i = 0; i < 16; i=i+1) begin
        $display("Counter = %d", COUNTER);
        COUNTER= COUNTER +1;
    end
end
endmodule