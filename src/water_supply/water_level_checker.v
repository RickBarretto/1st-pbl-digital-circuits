//! Checks if there are conflicting values between water level's sensors
//!
//! There is a conflict always when there is a higher level enabled,
//! without lower ones.
//! So, to high be enabled, middle and low must be too.
//!
module water_level_checker(
    output conflict,

    input low_level,
    input mid_level,
    input high_level
);

    wire higher_levels;

    nor nor_1(higher_levels, high_level, mid_level);
    nor nor_2(conflict, higher_levels, low_level); 

endmodule