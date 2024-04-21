module main(
	input low_water_level, 
	input mid_water_level, 
	input high_water_level,

	input earth_humidity, 
	input air_humidity,
	input low_temperature,

	output water_supply_valvule, 
	output alarm,  
	output splinker_bomb,
	output dripper_valvule
);

	wire irrigation_mode, water_sensor_error;

	water_level_checker check_error(
		alarm,

		low_water_level, 
		mid_water_level, 
		high_water_level 
	);

	water_supply_controller open_water_supply(
		water_supply_valvule,

		alarm, 
		high_water_level 
	);

	irrigation_controller check_prerequisites(
		irrigation_mode,

		alarm,
		earth_humidity, 
		low_water_level 
	);

	splinker open_splinker(
		splinker_bomb,

		earth_humidity, 
		air_humidity, 
		low_temperature,
		mid_water_level 
	);

	dripper open_dripper(
		dripper_valvule,

		earth_humidity, 
		air_humidity, 
		low_temperature, 
		mid_water_level 
	);
	
endmodule