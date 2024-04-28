module irrigation_encoder(
    output bit1, 
    output bit0, 
    
    input irrigation_on, 
    input splinker_on, 
    input dripper_on
);

    not (wire_a, dripper_on);

    and (bit1, irrigation_on, splinker_on, dripper_on);
    and (bit0, irrigation_on, splinker_on, wire_a);

endmodule