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

	wire water_sensor_conflict, critical_water_level;
	wire splinker_mode_on, dripper_mode_on, irrigation_on;

	water_sensors_checker check_error(
		water_sensor_conflict,

		low_water_level, 
		mid_water_level, 
		high_water_level 
	);

	water_supply_controller open_water_supply(
		water_supply_valvule,

		water_sensor_conflict, 
		high_water_level 
	);

	irrigation_controller check_prerequisites(
		irrigation_on,

		water_sensor_conflict,
		earth_humidity, 
		low_water_level 
	);

	irrigation_selector select_irrigation_mode(
		splinker_mode_on,

		air_humidity, 
		low_temperature,
		mid_water_level 
	);

	not switch_irrigation_mode(dripper_mode_on, splinker_mode_on),
		get_critical_level(critical_water_level, low_water_level);

	and open_splinker(splinker_bomb, splinker_mode_on, irrigation_on);
	and open_splinker(dripper_valvule, splinker_mode_on, irrigation_on);

	or activate_alarm(alarm, water_sensor_conflict, critical_water_level);
	
endmodule