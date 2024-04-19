module sensor_checker(
	output error,

	input low_watter_level, 
	input mid_watter_level, 
	input high_watter_level
);

	wire s1, s2, n1, n2;
	
	not not_0(n1, mid_watter_level);
	not not_1(n2, high_watter_level);
	and and_1(s1, n1, n2);
	
	and and_2(s2, low_watter_level, mid_watter_level);
	
	nor or_0(error, s1, s2);

endmodule