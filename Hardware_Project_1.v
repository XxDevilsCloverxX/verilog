module circuit(A,B,C,D,E,F);

// INPUTS DECLARATIONS
input A;
input B;
input C;
input D;
input E;

// OUTPUTS DECLARATIONS
output F;

// WIRE DECLARATIONS
wire w0;
wire w1;
wire w2;
wire w3;

//GATE DECLARATIONS
or  u0(w0,C,D);
and u1(w1, A, w0);
not u2(w2, w1);
and u3(w3, B,E);
or  u4(F, w2,w3);
endmodule

//TEST BENCH
module circuit_test;
// INPUT REGISTERS
reg A;
reg B;
reg C;
reg D;
reg E;
// OUTPUT WIRE
wire F;

//UNIT UNDER TEST UUT is identifier by convention in test bench
circuit UUT(A,B,C,D,E,F);

//SIMULATION
initial begin
$display("A B C D E | F");
$display("-------------");
//int uses 32 bit, so we use [4:0] as a means to make 4bit register
for (integer i=0; i<32; i=i+1)begin

    //INPUT VECTOR
    {A,B,C,D,E} = i[4:0]; #10
    $display("%b %b %b %b %b | %b", A,B,C,D,E,F);
    end
end
endmodule