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
		low_watter_level, 
		mid_watter_level, 
		high_watter_level, 
		alarm
	);

	watter_supply open_watter_supply(
		alarm, 
		high_watter_level, 
		watter_supply_valvule
	);

	irrigation_selector select_irrigator(
		alarm,
		earth_humidity, 
		low_watter_level, 
		irrigation_mode
	);

	splinker open_splinker(
		earth_humidity, 
		air_humidity, 
		low_temperature,
		mid_watter_level, 
		splinker_bomb
	);

	dripper open_dripper(
		earth_humidity, 
		air_humidity, 
		low_temperature, 
		mid_watter_level, 
		dripper_valvule
	);
	
endmodule