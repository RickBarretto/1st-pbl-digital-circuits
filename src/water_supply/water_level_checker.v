//! Checks if there are conflicting values between water level's sensors
//!
//! There is a conflict always when there is a higher level enabled,
//! without lower ones.
//! So, to high be enabled, middle and low must be too.
//!
module water_level_checker(
    output error,

    //! water's level sensors
    input low,
    input mid,
    input high
);

    wire high_mid;

    nor nor_1(high_mid, high, mid);
    nor nor_2(error, high_mid, low); 


endmodule