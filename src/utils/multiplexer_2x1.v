module multiplexer_2x1(
    output out, 
    
    input l0, 
    input l1, 
    input s
); 
   
    not (wire_a1, s);
   
    and (wire_b1, l0, wire_a1);
    and (wire_b2, l1, s); 
   
    or (out, wire_b1, wire_b2);

endmodule 