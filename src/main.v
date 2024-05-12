module main(
	input low_water_level,
	input mid_water_level,
	input high_water_level,

	input earth_humidity,
	input air_humidity,
	input low_temperature,
	
	input selector,

	output water_supply_valvule,
	output alarm,
	output splinker_bomb,
	output dripper_valvule,
	
	output segment_a, output segment_b, output segment_c,
    output segment_d, output segment_e, output segment_f,
    output segment_g,
	 
	output display_0, 
	output display_1, 
	output display_2, 
	output displays_point
	
);

	//-------------------------------------------
	// Input related
	//-------------------------------------------

	water_sensors_checker check_error(
		conflicting_values,

		low_water_level,
		mid_water_level,
		high_water_level
	);


	//-------------------------------------------
	// Water supply related
	//-------------------------------------------

	water_supply_controller open_water_supply(
		water_supply_valvule,

		conflicting_values,
		high_water_level
	);


	//-------------------------------------------
	// Irrigation related
	//-------------------------------------------

	irrigation_controller check_prerequisites(
		irrigation_on,
		conflicting_values,
		earth_humidity,
		low_water_level
	);

	irrigation_selector select_irrigation(
		splinker_mode_on,

		air_humidity,
		low_temperature,
		mid_water_level
	);

	not not1(dripper_mode_on, splinker_mode_on);

	and open_splinker(splinker_bomb, splinker_mode_on, irrigation_on);
	and open_dripper(dripper_valvule, dripper_mode_on, irrigation_on);


	//-------------------------------------------
	// Alarm related
	//-------------------------------------------

	alarm_controller enable_alarm(alarm, mid_water_level, conflicting_values);
	

	//-------------------------------------------
	// Display related
	//-------------------------------------------



	water_encoder encode_water(
		encoded_water_Bit0,
		encoded_water_Bit1,

		high_water_level,
		mid_water_level,
		low_water_level
	);


	// mux
	
	display_selector (
		mux_out_Bit0, 
		mux_out_Bit1, 
		
		selector, 
		
		encoded_water_Bit0,
		encoded_water_Bit1, 
		splinker_bomb, 
		dripper_valvule
	);
	
	display_decoder(
		segment_a, segment_b, segment_c, 
		segment_d, segment_e, segment_f, 
		segment_g, 
		
		selector,
		mux_out_Bit0, 
		mux_out_Bit1
	);
		
	disable_display(display_0, dripper_valvule);
	disable_display(display_1, dripper_valvule);
	disable_display(display_2, dripper_valvule);
	disable_display(displays_point, dripper_valvule);

		
endmodule
