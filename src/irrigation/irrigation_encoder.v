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
    output [1:0] irrigation_encoded,
    
    input irrigation_on, 
    input splinker_on, 
    input dripper_on
);

    not (wire_a, dripper_on);

    and (irrigation_encoded[1], irrigation_on, splinker_on, dripper_on);
    and (irrigation_encoded[0], irrigation_on, splinker_on, wire_a);

endmodule