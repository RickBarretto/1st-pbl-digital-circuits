
module dripper(
    output dripper_valvule,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_water_level
);

    wire low_water_level, s2, environment_conditions;

    and and1(environment_conditions, air_humidity, low_temperature);

    not not1(low_water_level, mid_water_level);
    and and2(s2, air_humidity, low_water_level);

    or or1(dripper_valvule, environment_conditions, s2);

endmodule 