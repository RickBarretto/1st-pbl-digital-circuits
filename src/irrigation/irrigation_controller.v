//! Checks the pre-requisites of the irrigation system
//! The Dripper and Splinker can only be active if this pass.
//!
//! There are two pre-requisites the irrigation must follow:
//! 1. All sensors must be working right
//! 2. Water level isn't critical
//! 3. Earth must be dry
//!
module irrigation_controller(
    output irrigation,

    input water_sensor_conflicting,
    input earth_humidity, 
    input low_water_level
);

    wire S1, S2;

    not not1(S1, earth_humidity);
    not not2(S2, water_sensor_conflicting);
    and and1(irrigation, S1, S2, low_water_level);

endmodule 