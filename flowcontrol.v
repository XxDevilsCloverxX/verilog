module flowcontrol(A,B,C,D,valve);

// INPUTS DECLARATIONS
input A;
input B;
input C;
input D;

// OUTPUTS DECLARATIONS
output valve;

// WIRE DECLARATIONS
wire w0;
wire w1;
wire w2;
wire w3;
wire w4;
wire w5;
wire w6;

//GATE DECLARATIONS
not u0(w0,A);
and u1(w1,w0,w2);
not u2(w2,B);
and u3(w3,w0,w4);
not u4(w4,C);
and u5(w5,B,D,w4);
and u6(w6,A,B,C);
or  u7(valve,w1,w3,w5,w6);
endmodule

//TEST BENCH
module flowcontrol_test;
// INPUT REGISTERS
reg A;
reg B;
reg C;
reg D;
// OUTPUT WIRE
wire valve;

//UNIT UNDER TEST UUT is identifier by convention in test bench
flowcontrol UUT(A,B,C,D,valve);

//SIMULATION
initial begin
$display("A B C D | Valve");
$display("----------------");
//int uses 32 bit, so we use [4:0] as a means to make 4bit register
for (integer i=0; i<16; i=i+1)begin

    //INPUT VECTOR
    {A,B,C,D} = i[4:0]; #10
    $display("%b %b %b %b |   %b", A,B,C,D,valve);
    end
end
endmodule
