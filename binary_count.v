module full_adder(COUT, SUM, A,B, CIN);

	//INPUT DECLARATIONS
	input A;
	input B;
	input CIN;
	
	//OUTPUT DELCARATIONS
	output COUT;
	output SUM;
	//WIRE DECLARATIONS
	wire w0;
	wire w1;
	wire w2;
	
	//LOGIC GATES
	and u0(w0, A, CIN);
	and u1(w1, B, CIN);
	and u2(w2, A, B);
	or u3(COUT, w0, w1, w2);
	xor u4(SUM, A,B,CIN);
endmodule
module adder(SUM, A, B);

	//INPUTS
	input [3:0] A;
	input [3:0] B;
	//Outputs
	output[3:0] SUM;
	//Wires
	wire w0;
	wire w1;
	wire w2;
	//SUBMODULE
	full_adder FA0(w0, SUM[0], A[0], B[0], 1'b0);
	full_adder FA1(w1, SUM[1], A[1], B[1], w0);
	full_adder FA2(w2, SUM[2], A[2], B[2], w1);
	full_adder FA3(, SUM[3], A[3], B[3], w2); //Left blank because the output connects to nowhere.
endmodule
module testbench;
	//INPUT REGISTERS
	reg A;
	reg B;
	reg CIN;
	//4-Bit adder
	reg [3:0] A_4bit;
	reg [3:0] B_4bit;
	//OUTPUT WIRES
	wire COUT;
	wire SUM;
	//4 bit wires
	wire [3:0] SUM_4bit;
	//UUTS
	full_adder UUT0(COUT, SUM, A, B, CIN);
	adder UUT1(SUM_4bit, A_4bit, B_4bit);
	integer full_adder_fails = 0;
	integer adder_fails =0;
	// TEST FULL ADDER EXECUTION
	initial begin
		$display("Begin test for full adder module");
		for (integer i=0; i<8; i+=1) begin
		{A, B, CIN} = i[2:0]; #10;
		if ({COUT,SUM} != A + B + CIN) begin
			$display("Test Case Failed %b+%b = %b%b", A, B, CIN, COUT);
			full_adder_fails +=1;
			end
		end
		$display("Full adder test with %1d fails.", full_adder_fails);
	end
	//4Bit adder
	initial begin
		$display("Begin test for 4 bit adder module");
		for (integer i=0; i<256; i+=1) begin
		{A_4bit, B_4bit} = i[7:0]; #10;
		if ({SUM_4bit} != A_4bit + B_4bit) begin
			$display("Test Case Failed %b +%b = %b", A_4bit, B_4bit, SUM_4bit);
			adder_fails +=1;
			end
		end
		$display("Adder test with %3d fails.", adder_fails);
	end
endmodule
