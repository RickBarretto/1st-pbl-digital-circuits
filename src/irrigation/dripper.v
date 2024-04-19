module dripper(
    output dripper_valvule,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_watter_level
);

    wire s1, s2, s3;

    // (not m and ar) or (t and ar);

    not notM(s1, mid_watter_level);
    and and1(s2, air_humidity, s1);
    and and2(s3, air_humidity, low_temperature);
    or or1(dripper_valvule, s3, s2);

endmodule 