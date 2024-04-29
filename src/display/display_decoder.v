module display(
    output a, output b, output c,
    output d, output e, output f,
    output g,

    input [2:0] entry
);

    // -----------------------------------------------------
    // Segment A

    not (wire_a_b1, entry[2]);           // A'
    nor (wire_a_b2, entry[1], entry[c]); // (B' * C')
    and (wire_a_b3, entry[1], entry[0]); // (B * C)

    // A' + (B' * C') + (B * C)
    or  (a, wire_a_b1, wire_a_b2, wire_a_b3); 


    // -----------------------------------------------------
    // Segment B

    not (wire_b_a1, entry[0]); // C'

    // C' + B
    or  (b, wire_b_a1, entry[1]); 


    // -----------------------------------------------------
    // Segment C

    nor (wire_c_a1, entry[1], entry[0]); // (B' * C')
    and (wire_c_a2, entry[1], entry[1]); // (B * C)

    // (B' * C') + (B * C)
    or  (c, wire_c_a1, wire_c_a2);
    

    // -----------------------------------------------------
    // Segment D

    not (wire_d_a1, entry[2]); // A'
    not (wire_d_a2, entry[1]); // B'

    // A' + B' + C
    or  (d, wire_d_a1, wire_d_a2, entry[0]); 


    // -----------------------------------------------------
    // Segment E

    nor (wire_e_a1, entry[2], entry[1]);           // (A' * B')
    nor (wire_e_a2, entry[2], entry[0]);           // (A' * C')
    nor (wire_e_a3, entry[1], entry[0]);           // (B' * C')
    and (wire_e_a4, entry[2], entry[1], entry[0]); // (A * B * C)

    // (A' * B') + (A' * C') + (B' * C') + (A * B * C)
    or  (   
        e, wire_e_a1, wire_e_a2, wire_e_a3, wire_e_a4
    );


    // -----------------------------------------------------
    // Segment F

    nor (wire_f_a1, entry[2], entry[1]);           // (A' * B')
    nor (wire_f_a2, entry[1], entry[0]);           // (B' * C')
    and (wire_f_a3, entry[2], entry[1], entry[0]); // (A * B * C)

    // (A' * B') + (B' * C') + (A * B * C)
    or  (f, wire_f_a1, wire_f_a2, wire_f_a3);


    // -----------------------------------------------------
    // Segment G
    
    not (wire_g_a1, entry[2]);           // A'
    nor (wire_g_a2, entry[1], entry[0]); // (B' * C')
    and (wire_g_a3, entry[1], entry[0]); // (B * C)

    // A' + (B' * C') + (B * C)
    or  (g, wire_g_a1, wire_g_a2, wire_g_a3);


endmodule 