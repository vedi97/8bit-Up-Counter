/***************************************************************************
*** Creating 8bit UpCounter                   				                   ***
*** will fed into 8bit up counter Top Module later on 			 	           ***
***************************************************************************/
`timescale 1 ns/ 1 ns

module Counter0(Count, Clock, Reset, Enable, Load, Data);
	
//declaring input and outputs
	input Clock, Reset, Enable, Load;
	input [0:7] Data;
	output reg [0:7] Count;

//functionality of the module
	always @(posedge Clock or negedge Reset)	//active high CLK and active low reset
		if (!Reset)				//if Reset is 0 
			Count <= 8'b00000000;		//Output is 0
		else if(Enable)				//If Enable is ON
			begin
			if(Load)			//If Load is ON
			Count <= Data;			//Data goes to output
		else
			Count <= Count + 1; 		//if Load is not on and Enable and Reset are on, increment Count
			end
endmodule 
		
