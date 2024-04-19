module irrigation_selector(
    output irrigation_mode,

    input error, 
    input earth_humidity, 
    input low_water_level
);

    wire S1, S2;

    not not1(S1, earth_humidity);
    not not2(S2, error);
    and and1(irrigation_mode, S1, S2, low_water_level);

endmodule 