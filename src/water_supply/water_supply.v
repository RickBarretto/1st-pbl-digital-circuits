module water_supply(
	output valvule,

	input error, 
	input high
);

	nor low_and_right(valvule, error, high);

endmodule