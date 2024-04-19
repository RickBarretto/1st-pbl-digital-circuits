module splinker(
    output splinker_bomb,

    input earth_humidity, 
    input air_humidity, 
    input low_temperature, 
    input mid_watter_level, 
);

    wire s1, s2, s3, s4, s5;

    not notS(s1, earth_humidity);
    not notA(s2, air_humidity);
    not notT(s3, low_temperature);
    and and1(s4, s1, s2);
    and and2(s5, s1, s3, mid_watter_level);
    or or1(splinker_bomb, s4, s5);

endmodule 