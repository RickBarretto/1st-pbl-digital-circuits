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

    wire dry_earth, dry_air, heat_climate, climate_condition, case2;

    not not1(dry_earth, earth_humidity);

    not not2(dry_air, air_humidity);
    and and1(climate_condition, dry_earth, dry_air);

    not not3(heat_climate, low_temperature);
    and and2(case2, dry_earth, heat_climate, mid_water_level);
    
    or or1(splinker_bomb, climate_condition, case2);

endmodule 