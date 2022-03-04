/***************************************************************************
 *** ***
 *** ECE 526 L Experiment #5 		Vedi Ghahremanyans, Spring, 2022 ***
 *** 									 ***
 *** Experiment #5 8bit Up Counter		         		 ***
 *** 								   	 ***
 ***************************************************************************
 *** Filename: Counter1_tb.v 		   Created by Vedi GH, 3/01/2022 ***
 *** --- revision history, if any, goes here --- 			 ***
 ***************************************************************************
 *** Top module up counter test bench					 ***
 *** 	   							 	 ***
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
		
		//Counter starts to initiate counting
		#20	$display("\n Counter Initiation:");
			Enable	= 1'b1; 
			Reset	= 1'b1;
			Load	= 1'b0;
			
		//Counts up to 8 and parallel load of 250
		#200 	$display ("\n After 8 count, parallel load of 250:");
			Enable	= 1'b1;
			Reset	= 1'b1;
			Load	= 1'b1;
			Data	= 8'd250;

		//Now it starts counting from 250
		#20 	$display("\n Starts counting from 250 (250 not included):");
			Load  	= 1'b0;

		//Count is zero if Reset is low and even Load is high
		#140	$display("\n Demonstration of reset overrides load:");
			Load	= 1'b1;
			Reset	= 1'b0;

		//Count is zero if Reset is low and even Enable is high
		#40	$display("\n Demonstration of reset overrides enable:");
			Load	= 1'b0;
			Enable	= 1'b1;
			Reset	= 1'b0;
			Data	= 8'd15;

		//Switching Reset to high 
		#60	Enable	= 1'b1;
			Reset	= 1'b1;
			Load	= 1'b0;

		//Even Load is high when enable is low, count doesn't increment
		#140	$display("\n Enable Low - Load high:");
			Load	= 1'b1;
			Enable	= 1'b0;

		//Load is low and ENable is low, count doesn't increment
		#40	$display("\n Enable low - Load low:");
			Load	= 1'b0;
			Enable	= 1'b0;
			Data	= 8'd15;
	
		#40 $finish;
		end

endmodule






		
