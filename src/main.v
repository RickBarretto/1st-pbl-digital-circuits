module main(
        input low_water_level,
        input mid_water_level,
        input high_water_level,

        input earth_humidity,
        input air_humidity,
        input low_temperature,

        output water_supply_valvule,
        output alarm,
        output splinker_bomb,
        output dripper_valvule
);

        wire irrigation_on, conflicting_values, critical_water_level;
        wire splinker_mode_on, dripper_mode_on;

        water_sensors_checker check_error(
                conflicting_values,

                low_water_level,
                mid_water_level,
                high_water_level
        );

        water_supply_controller open_water_supply(
                water_supply_valvule,

                conflicting_values,
                high_water_level
        );

        irrigation_controller check_prerequisites(
                irrigation_on,

                conflicting_values,
                earth_humidity,
                low_water_level
        );

        irrigation_selector select_irrigation(
                splinker_mode_on,

                air_humidity,
                low_temperature,
                mid_water_level
        );

        wire encoded_water_1, encoded_water_0;
        wire encode_irrigation_1, encode_irrigation_0;

        not not1(dripper_mode_on, splinker_mode_on);

        and open_splinker(splinker_bomb, splinker_mode_on, irrigation_on);
        and open_dripper(dripper_valvule, dripper_mode_on, irrigation_on);

        not not2(critical_water_level, low_water_level);
        or enable_alarm(alarm, conflicting_values, critical_water_level);

        water_encoder encode_water(
                encoded_water_1,
                encoded_water_0,

                high_water_level,
                mid_water_level,
                low_water_level
        );

        irrigation_encoder encode_irrigation(
                encode_irrigation_1,
                encode_irrigation_0,

                irrigation_on,
                splinker_bomb,
                dripper_valvule
        );


endmodule