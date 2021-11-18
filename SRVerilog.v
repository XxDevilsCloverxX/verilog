module demo;
reg my_reg_1bit;
reg [3:0] my_reg_4bit;
    initial begin
    my_reg_1bit = 1'd0;
    $display("my_reg_1bit = %d", my_reg_1bit);
    my_reg_4bit = 4'b1010;
    $display("my_reg_4bit = %d", my_reg_4bit);
    $finish;
    end
endmodule