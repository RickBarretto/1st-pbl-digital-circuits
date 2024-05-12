//! A multiplexer that selects which output will be enabled
//!
//! When the selector is enabled, the choosen output 
//! is from irrigation-system.
//!
module display_selector (
    output  encoded_Bit0,
	output  encoded_Bit1,
	
    
	input selector,
    input encoded_water_Bit0,
	input encoded_water_Bit1,
    input encoded_irrigation_Bit0,
	input encoded_irrigation_Bit1
);
   
    // -----------------------------------------------------
    // Output 1

    multiplexer_2x1 (
        encoded_Bit1, 
        
        encoded_water_Bit1, 
        encoded_irrigation_Bit1, 
        
        selector
    );

    // -----------------------------------------------------
    // Output 0
    
	multiplexer_2x1(
        encoded_Bit0, 
        
        encoded_water_Bit0, 
        encoded_irrigation_Bit0, 
        
        selector
    );


endmodule
