//! Controls the water supply's valule
//!
//! This must be closed always when:
//! 1. There are conflicting values coming from the sensors
//! 2. The water tank is full, basically when the water level is high
//! 
module water_supply_controller(
	output valvule,

	input water_sensors_conflicting, 
	input high_water_level
);

	nor low_and_right(valvule, water_sensors_conflicting, high_water_level);

endmodule