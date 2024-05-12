//! Checks the pre-requisites of the irrigation system
//! The Dripper and Splinker can only be active if this pass.
//!
//! There are two pre-requisites the irrigation must follow:
//! 1. All sensors must be working right
//! 2. Water level isn't critical
//! 3. Earth must be dry
//!
module irrigation_controller(
    output irrigation,

    input water_sensor_conflicting,
    input earth_humidity,
    input low_water_level
);

    not (dry_earth, earth_humidity);
    not (no_conflicts, water_sensor_conflicting);

    //! The reason why other levels are not checked here is because
    //! if there is a low level enabled and there is no conflict on sensors,
    //! that means the real value of the water supply is at least on low,
    //! since this is a pre-requisite for other higher levels.
    //!
    //! So, low_water_level disabled and no_conflicts means critical_water_level
    and all_cases(
        irrigation,

        dry_earth,
        no_conflicts,
        low_water_level
    );

endmodule