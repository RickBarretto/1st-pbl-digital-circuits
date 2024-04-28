//! Encodes the water level
//!
//! Possible Encodings for water level:
//!     * 000: Critical
//!     * 001: Low
//!     * 010: Mid
//!     * 011: High
//! 
//! Observation: 
//!     Encoding it is important because of the display decoder.
//!
module water_encoder(
    output [1:0] encoded_water,  
        
    input high_water_level, 
    input mid_water_level, 
    input low_water_level
);

    // A Level
    not (wire_a1, high_water_level);
    not (wire_a2, mid_water_level);

    // B Level
    and (wire_b1, wire_a1, wire_a2, low_water_level);
    and (wire_b2, high_water_level, mid_water_level, low_water_level);

    // C Level
    and (encoded_water[1], mid_water_level, low_water_level);
    or  (encoded_water[0], wire_b1, wire_b2);

endmodule