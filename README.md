# Iverilog_Circuit_Models
Using Iverilog's Hardware Description Language to model digital logic circuits


TTU ECE 2372 is a course in Modern Digital Systems and Design. In this repository, you will find my solutions to some assignments and notes of the verilog
simulations of these digital logic circuits.

The files included here are designed with iverilog and vvp in mind.

To run a downloaded copy of these files, open a terminal window and navigate to the directory of the file, then type:

iverilog -o <buildfilename.out> <verilogcode.v> && vvp <buildfilename.out>
  
A quick note: buildfilename on windows machines is recommended to use a .vvp extension at the end instead of out. On the linux machine these were written on,
  vvp extensions would fail, and therefore defaulted to the .out extension.
