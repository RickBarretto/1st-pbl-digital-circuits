module irrigation_selector(
    input error, 
    input earth_humidity, 
    input low_watter_level, 
    
    output irrigation_mode
);

    wire S1, S2;

    not not1(S1, earth_humidity);
    not not2(S2, error);
    and and1(irrigation_mode, S1, S2, low_watter_level);

endmodule 