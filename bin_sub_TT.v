module full_subtractor(BOUT, D, A,B, BIN);

	//INPUT DECLARATIONS
	input A;
	input B;
	input BIN;
	
	//OUTPUT DELCARATIONS
	output BOUT;
	output D;
	//WIRE DECLARATIONS
	wire w0;
	wire w1;
	wire w2;
	
	//LOGIC GATES
	not u0(w0, A);
	and u1(w1, w0, BIN);
	and u2(w2, w0, B);
	and u3(w3, B, BIN);
	or  u4(BOUT, w1, w2, w3);
	xor u5(D, A,B, BIN);
endmodule
module subtractor(D, A, B);

	//INPUTS
	input [3:0] A;
	input [3:0] B;
	//Outputs
	output[3:0] D;
	//Wires
	wire w0;
	wire w1;
	wire w2;
	//SUBMODULE
	full_subtractor FS0(w0, D[0], A[0], B[0], 1'b0);
	full_subtractor FS1(w1, D[1], A[1], B[1], w0);
	full_subtractor FS2(w2, D[2], A[2], B[2], w1);
	full_subtractor FS3(, D[3], A[3], B[3], w2); //Left blank because the output connects to nowhere.
endmodule
module testbench;
	
	//INPUT REGISTERS
	reg A;
	reg B;
	reg BIN;
	
	//4-Bit adder
	reg [3:0] A_4bit;
	reg [3:0] B_4bit;
	
	//OUTPUT WIRES
	wire BOUT;
	wire D;
	
	//4 bit wires
	wire [3:0] D_4bit;
	
	//UUTS
	full_subtractor UUT0(BOUT, D, A, B, BIN);
	subtractor UUT1(D_4bit, A_4bit, B_4bit);
	
	initial begin
		#10000;
		$display("A_4bit  B_4bit|   D");
		for (integer i=0; i<256; i+=1) begin
		{A_4bit, B_4bit} = i[7:0]; #10;
		$display(" %b    %b | %b", A_4bit, B_4bit, D_4bit);
		end
		end
endmodule
