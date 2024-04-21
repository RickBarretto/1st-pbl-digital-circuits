//! Dripper should be open for two different cases:
//! 1. High air humidity and cold climate
//! 2. High air humidity and water supply's level bellow the middle
//!
//! Observation: 
//!     In any case, if the water level is on critical or 
//!     there is problems with the water supply's sensors, this must be closed.
//!     This is handled by the Irrigation Controller.
//!
module dripper(
    output dripper_valvule,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_water_level
);

    wire low_water_level, case2, environment_conditions;

    and and1(environment_conditions, air_humidity, low_temperature);

    not not1(low_water_level, mid_water_level);
    and and2(case2, air_humidity, low_water_level);

    or or1(dripper_valvule, environment_conditions, case2);

endmodule 