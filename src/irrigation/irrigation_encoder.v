//! Encodes the irrigation system
//!
//! Possible Encodings:
//!     * 100: Dripper
//!     * 101: Splinker 
//! 
//! Observation: 
//!     Encoding it is important because of the display decoder.
//!
module irrigation_encoder(
    output irrigation_encoded_Bit0,
	output irrigation_encoded_Bit1,
    
    input irrigation_on, 
    input splinker_on, 
    input dripper_on
);

    // -----------------------------------------------------
    // OUTPUT 1

    // Irrigação * Asp * Got
    and (
        irrigation_encoded_Bit1, 
        irrigation_on, splinker_on, dripper_on
    );

    
    // -----------------------------------------------------
    // OUTPUT 0

    not (dripper_off, dripper_on); // Irrigação'
 
    // Irrigação * Asp * Got'
    and (
        irrigation_encoded_Bit0,
        irrigation_on, splinker_on, dripper_off    
    );


endmodule
