
//! Controls if the watter supply's valvule is open or closed
//!
//! Must be closed when:
//! * there is an sensor's error
//! * the watter is full
module watter_supply_controller (
    output valvule,

    input error,
    input high
);

    nor low_and_ok(valvule, error, high);

    
endmodule