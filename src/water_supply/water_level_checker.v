// Verify if the water level sensors' input are working
// Higher levels are enabled only when the lower ones are enalbed too.
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