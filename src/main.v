module main(
    //! Switches' channels inputs
    //! CH 8
    input low, 
    //! CH 7
    input middle,
    //! CH 8
    input high,

    //! Led RGB outputs
    //! Blue LED
    output watter_supply,
    //! RED LED
    output error,
);


    watter_level_checker verify_inputs(error, low, mid, high);
    watter_supply_controller open(watter_supply, error, high);


endmodule