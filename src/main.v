module main(
	input low_watter_level, 
	input mid_watter_level, 
	input high_watter_level,

	input earth_humidity, 
	input air_humidity,
	input low_temperature,

	output watter_supply_valvule, 
	output alarm,  
	output splinker_bomb,
	output dripper_valvule
);

	wire irrigation_mode, watter_sensor_error;

	sensor_checker check_error(
		alarm,

		low_watter_level, 
		mid_watter_level, 
		high_watter_level 
	);

	watter_supply open_watter_supply(
		watter_supply_valvule,

		alarm, 
		high_watter_level 
	);

	irrigation_selector select_irrigator(
		irrigation_mode,

		alarm,
		earth_humidity, 
		low_watter_level 
	);

	splinker open_splinker(
		splinker_bomb,

		earth_humidity, 
		air_humidity, 
		low_temperature,
		mid_watter_level 
	);

	dripper open_dripper(
		dripper_valvule,

		earth_humidity, 
		air_humidity, 
		low_temperature, 
		mid_watter_level 
	);
	
endmodule