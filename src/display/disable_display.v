//! Disables unused display
//! You must connect its instance's output into your desired PIN.
module disable_display(
    output segment_off, 
    
    input S0
  
);
	not (Not1, S0);
	or  (segment_off, S0, Not1); 
	
endmodule

