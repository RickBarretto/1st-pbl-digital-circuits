//! Splinker should be open for two different cases:
//! 1. Low air humidity
//! 2. High air humidity and water supply's level on middle or high 
//!
//! Observation: 
//!     In any case, if the water level is on critical or 
//!     there is problems with the water supply's sensors, this must be closed.
//!     This is handled by the Irrigation Controller.
//!
module splinker(
    output splinker_bomb,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_water_level
);

    wire s1, s2, s3, s4, s5;

    not not1(s1, earth_humidity);
    not not2(s2, air_humidity);
    and and1(s4, s1, s2);

    not not3(s3, low_temperature);
    and and2(s5, s1, s3, mid_water_level);
    
    or or1(splinker_bomb, s4, s5);

endmodule 