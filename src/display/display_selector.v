//! This is a MUX
module display_selector (
    output [2:0] encoded,

    input selector,
    input [1:0] encoded_water,
    input [1:0] encoded_irrigation,
);

    // -----------------------------------------------------
    // Output 2

    not (encoded[2], selector);
    
    
    // -----------------------------------------------------
    // Output 1
    

    // -----------------------------------------------------
    // Output 0


endmodule