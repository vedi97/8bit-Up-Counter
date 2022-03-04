# 8bit-Up-Counter

Project Description:
8 bit Up Counter using AASD reset synchronizer. 
The HDL language is VERILOG, and is coded in behavioral model. 

Procedure: 
-Use the AASD_reset file as the reset synchronizer.  
-Use the Counter0 file as an 8 bit up counter (same level as AASD_reset).
-Use the Counter1 file as Top level module which uses AASD_reset and Counter0 in it.
-Use the Counter1_tb file as a test bench in order to test the functionality of your 8 bit counter: 
   Counter1_tb tests the following:   
          ● Generates a clock with a 20ns period.
          ● Shows the output of an asynchronous reset.
          ● Shows that the counter initiates to increment after the reset is high.
          ● Shows when the counter reaches count of 8 it parallel loads 250 decimal.
          ● Shows it counted from 250 until it reached its max bits and rolled over to zero.
          ● After it reaches zero, it starts counting up again.
          ● Demonstrates if reset is zero, it overrides load and increment (enable).
          ● Shows the correct functionality of enable.
