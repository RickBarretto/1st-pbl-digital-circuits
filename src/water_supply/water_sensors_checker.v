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

    wire higher_levels;

    not (wire1, low_level);
    not (wire2, mid_level);

    and (wire3, wire1, mid_level);
    and (wire4, high_level, wire2);

    or (conflict, wire3, wire4);

endmodule