module display(
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,

    input dripper, 
    input splinker
);

    not not1(A, splinker);
    and and1(S1, dripper, A);

endmodule 