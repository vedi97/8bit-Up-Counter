/***************************************************************************
*** 8bit Up Counter Top Level module test bench					                 ***
***************************************************************************/
`timescale 1 ns / 1 ns

module Counter1_tb();

//inputs and output 
	reg  Clock, Reset, Enable, Load;
	reg  [0:7] Data;
	wire [0:7] Count;

//Counter1 module instantiation
Counter1 UUT(Count, Clock, Reset, Enable, Load, Data);

//Clock generator for 20ns period
	initial begin
		Clock = 1'b0;
		forever #10 Clock = ~Clock;
		end

//Monitoring
	initial begin
		$monitor("%d: Clock= %b ==> RESET= %b, ENABLE= %b, LOAD= %b, DATA= %b.....|.....Count= %b", 
			$time, Clock, Reset, Enable, Load, Data, Count);
		end

//Test cases
	initial begin
		$vcdpluson;

		//Asynchronous reset
		#10	$display("\n Asynchronous reset: \n"); 
			Reset	= 1'b0;
		
