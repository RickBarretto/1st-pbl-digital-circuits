//! Enables the alarm (the Red LED)
//!
//! This must enabled always when:
//! 1. There is conflicting values from the water's sensor
//! 2. The water level is bellow the mid-level.
//!
module alarm_controller (
    output alarm_on,

    input low_water_level, 
    input conflicting_values
);

    wire critical_water_level;

	not (critical_water_level, low_water_level);
	or (alarm_on, conflicting_values, critical_water_level);

endmodule