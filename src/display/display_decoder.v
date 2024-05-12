module display_decoder(
    output a, output b, output c,
    output d, output e, output f,
    output g,

	input selector,
    input entry_Bit0,
	input entry_Bit1
	 
);

    // -----------------------------------------------------
    // Segment A

	// seletor - A 
	// bit1 - B
	// bit0 - C
    not (not1, selector);   // A'
    not (not2, entry_Bit1); // B'
	not (not3, entry_Bit0); // C'
	 
	and (and1, selector, entry_Bit1, entry_Bit0); // ABC
	and (and2, not2, not3);     // B'C'
	and (and3, not1, not2);     // A'B'
	 
    // ABC + B'C' + A'B'
	or (a, and1, and2, and3);


    // -----------------------------------------------------
    // Segment B

	and (and4, selector, entry_Bit1);   // AB

    // B'C' + AB
    or  (b, and4, and2); 


    // -----------------------------------------------------
    // Segment C
	 
	and (and8, not1, not3);

    // ABC + A'C' + B'C'
    or  (c, and1, and8, and2);  
    

    // -----------------------------------------------------
    // Segment D
	 
	and (and5, selector, entry_Bit0);  // AC
	 
	// AC + B'
    or  (d, and5, not2); 


    // -----------------------------------------------------
    // Segment E

	and (and6, entry_Bit1, entry_Bit0);  // BC
	and (and7, not1, entry_Bit0);

    // B'C' + A'C + BC
    or  (   
        e, and2, and7, and6
    );


    // -----------------------------------------------------
    // Segment F


    // B'C' + BC + A'
    or  (f, and2, and6, not1);


    // -----------------------------------------------------
    // Segment G

    // B'C' + A'B' + AB
    or  (g, and2, and3, and4);


endmodule 
