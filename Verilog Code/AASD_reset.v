/***************************************************************************
 *** Creating asynchronous reset with clock which 			 ***
 *** will fed into 8bit up counter Top level module later on 		 ***
 ***************************************************************************/
`timescale 1 ns/ 1 ns

module AASD_reset(AASD_r, Clock, Reset);
	
//declaring input and outputs
	input Reset, Clock;
	output reg AASD_r;

//declaring internal wire 
	reg d;

//module functionality
	always @(posedge Clock or negedge Reset) //active high CLK and active low reset

	if(!Reset) 			//if RST = 0
		begin			
		d 	<= 1'b0;	
		AASD_r	<= 1'b0;	
		end
	else 
		begin			//any other case
		d	<= 1'b1;	
		AASD_r	<= d;		
		end			//(which eventually makes the reset to be synchronous with the clock)
endmodule
