//! Controls if the water supply's valvule is open or closed
//!
//! Must be closed when:
//! * there is an sensor's error
//! * the water is full
module water_supply_controller(
	output valvule,

	input error, 
	input high
);

	nor low_and_right(valvule, error, high);

endmodule