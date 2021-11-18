module counter;

reg [3:0] bit_COUNTER;
initial begin
    bit_COUNTER = 4'b0;
    for(integer i =0; i<16; i=i+1) begin
        $display("Counter = %d (%b) (%h)", bit_COUNTER,bit_COUNTER,bit_COUNTER);
        bit_COUNTER = bit_COUNTER + 1;
    end
end
endmodule