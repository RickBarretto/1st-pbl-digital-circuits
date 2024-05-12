//! Checks if there are conflicting values between water level's sensors
//!
//! There is a conflict always when there is a higher level enabled,
//! without lower ones.
//! So, to high be enabled, middle and low must be too.
//!
module water_sensors_checker(
    output conflict,

    input low_level,
    input mid_level,
    input high_level
);

    not (wire_a1, low_level);
    not (wire2, mid_level);

    and (wire_b1, wire_a1, mid_level);
    and (wire_b2, high_level, wire2);

    or (conflict, wire_b1, wire_b2);

endmodule