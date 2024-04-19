module water_sensor_checker(
	output error,

	input low_water_level, 
	input mid_water_level, 
	input high_water_level
);

	wire s1, s2, n1, n2;
	
	not not_0(n1, mid_water_level);
	not not_1(n2, high_water_level);
	and and_1(s1, n1, n2);
	
	and and_2(s2, low_water_level, mid_water_level);
	
	nor or_0(error, s1, s2);

endmodule