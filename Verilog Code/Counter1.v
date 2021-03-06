/***************************************************************************
*** 8 bit up counter Top Level module including:				                 ***
*** AASD_reset and Counter0 modules	 			 	                             ***
***************************************************************************/
`timescale 1 ns/ 1 ns

module Counter1(Count, Clock, Reset, Enable, Load, Data);

//declaring inputs and outputs	
	input Clock, Reset, Enable, Load;
	input [7:0] Data;
	output wire [7:0] Count;

//instances for Counter0 and AASD_reset modules
AASD_reset	AASD_reset_0(AASD_r, Clock, Reset); //Having AASD_r as reset so we can use it in Counter0 instantiation

Counter0	Counter_0(Count, Clock, AASD_r, Enable, Load, Data);

endmodule
