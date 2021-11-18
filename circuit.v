module circuit(A,B,C,D,F);

// INPUTS DECLARATIONS
input A;
input B;
input C;
input D;

// OUTPUTS DECLARATIONS
output F;

// WIRE DECLARATIONS
wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;

//GATE DECLARATIONS
and u0(w0, A,B);
or u1(w1, w0, C);
not u2(w2, w1);
and u3(w3, w2, D);
and u4(w4, A, B);
or u5(w5, C, w4);
or u6(w6, w5, D);
and u7(F, w3, w6);
endmodule

//TEST BENCH
module circuit_test;
// INPUT REGISTERS
reg A;
reg B;
reg C;
reg D;

// OUTPUT WIRE
wire F;

circuit UUT(A,B,C,D,F);

//SIMULATION
initial begin
$display("A B C D | F");
$display("-----------");
for (integer i=0; i<16; i=i+1)begin
    {A,B,C,D} = i[4:0]; #10
    $display("%b %b %b %b | %b", A,B,C,D,F);
    end
end
endmodule