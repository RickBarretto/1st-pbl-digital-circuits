module display(
    input dripper, 
    input splinker,
    
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G
);

    not not1(A, splinker);
    and and1(S1, dripper, A);

endmodule 