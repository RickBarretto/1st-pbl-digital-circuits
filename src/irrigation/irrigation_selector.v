//! Splinker should be open for two different cases:
//! 1. Low air humidity
//! 2. High air humidity, Cold climate and water supply's level above the middle
//!
//! Observation:
//!     In any case, if the water level is on critical or
//!     there is problems with the water supply's sensors, this must be closed.
//!     This is handled by the Irrigation Controller.
//!
module irrigation_selector(
    output splinker_mode_on,

    input air_humidity,
    input low_temperature,
    input mid_water_level
);

        not (air_dryness, air_humidity);
        not (heat_climate, low_temperature);

        and (wire1, mid_water_level, heat_climate);

        or (splinker_mode_on, air_dryness, wire1);

endmodule