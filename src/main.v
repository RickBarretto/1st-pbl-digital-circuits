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

	wire water_sensor_error, splinker_mode_on, dripper_mode_on, irrigation_on;

	water_sensors_checker check_error(
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
		irrigation_on,

		alarm,
		earth_humidity, 
		low_water_level 
	);

	irrigation_selector select_irrigation_mode(
		splinker_mode_on,

		air_humidity, 
		low_temperature,
		mid_water_level 
	);

	not switch_irrigation_mode(dripper_mode_on, splinker_mode_on);

	and open_splinker(splinker_bomb, splinker_mode_on, irrigation_on);
	and open_splinker(dripper_valvule, splinker_mode_on, irrigation_on);
	
endmodule