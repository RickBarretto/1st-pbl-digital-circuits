module disable_display(
    output segment_off, 
    
    input S0
  
);
	not (Not1, S0);
	or or1(segment_off, S0, Not1); 
	
endmodule
