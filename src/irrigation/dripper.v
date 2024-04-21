module dripper(
    output dripper_valvule,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_water_level
);

    wire s1, s2, s3;

    and and1(s3, air_humidity, low_temperature);

    not not1(s1, mid_water_level);
    and and2(s2, air_humidity, s1);

    or or1(dripper_valvule, s3, s2);

endmodule 