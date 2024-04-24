//! Returns 1 of splinker and 0 for dripper
module irrigation_selector(
    output splinker_mode_on,
 
    input air_humidity, 
    input low_temperature, 
    input mid_water_level
);

    wire air_dryness, heat_climate, wire1;

    not (air_dryness, air_humidity),
        (heat_climate, low_temperature);

    and (wire1, mid_water_level, heat_climate);
    or (splinker_mode_on, air_dryness, wire1)


endmodule 