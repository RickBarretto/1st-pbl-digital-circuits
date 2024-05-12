//! Decodes binary code to output display
//!
//! See: 
//!     ``display.md`` for more information.
//!
module display_decoder(
    output a, output b, output c,
    output d, output e, output f,
    output g,

	input selector,
    input entry_Bit0,
	input entry_Bit1
	 
);

    //! Caption for formulas:
    //!
    //! seletor - A 
	//! bit1 - B
	//! bit0 - C

    //! Segment A
    //! ---------
    //! Formula: ABC + B'C' + A'B'

    not (not1, selector);
    not (not2, entry_Bit1); 
	not (not3, entry_Bit0);

	and (and1, selector, entry_Bit1, entry_Bit0);
	and (and2, not2, not3);
	and (and3, not1, not2);
    
	or (a, and1, and2, and3);


    //! Segment B
    //! ---------
    //! Formula: B'C' + AB

	and (and4, selector, entry_Bit1);
    or  (b, and4, and2); 


    //! Segment C
    //! ---------
    //! Formula: ABC + A'C' + B'C'
	 
	and (and8, not1, not3);
    or  (c, and1, and8, and2);  
    

    //! Segment D
    //! ---------
    //! Formula: AC + B'
	 
	and (and5, selector, entry_Bit0); 
    or  (d, and5, not2); 


    //! Segment D
    //! ---------
    //! Formula: B'C' + A'C + BC

	and (and6, entry_Bit1, entry_Bit0);
	and (and7, not1, entry_Bit0);

    or  (   
        e, and2, and7, and6
    );


    //! Segment F
    //! ---------
    //! Formula: B'C' + BC + A'
    or  (f, and2, and6, not1);


    //! Segment G
    //! ---------
    //! Formula: B'C' + A'B' + AB
    or  (g, and2, and3, and4);


endmodule 
