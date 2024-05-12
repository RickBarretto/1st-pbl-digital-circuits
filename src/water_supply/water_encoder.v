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
    output  encoded_water_Bit0,
	 output  encoded_water_Bit1,  
        
        
    //! Water Level inputs
    input high, 
    input mid, 
    input low
);

    // -----------------------------------------------------
    // OUTPUT 1

    // M * L
    and (encoded_water_Bit1, mid, low);


    // -----------------------------------------------------
    // OUTPUT 0

    not (wire_a1, high);             // H'
    not (wire_a2, mid);              // M'
    and (wire_b1, wire_a1, wire_a2, low); // (H' * M' * L)

    
    and (wire_b2, high, mid, low);   // (H * M * L)

    // (H' * M' * L) + (H * M * L)
    or  (encoded_water_Bit0, wire_b1, wire_b2);


endmodule
