module alarm_controller (
    output alarm_on,

    input low_water_level, conflicting_values;
)

    wire critical_water_level;

	not (critical_water_level, low_water_level);
	or (alarm_on, conflicting_values, critical_water_level);

endmodule