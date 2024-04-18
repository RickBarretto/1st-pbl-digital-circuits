module watter_supply(
	input error, 
	input high, 
	
	output valvule
);

	nor low_and_right(valvule, error, high);

endmodule