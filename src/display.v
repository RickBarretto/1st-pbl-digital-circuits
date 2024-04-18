module display(
    input asp, 
    input got,
    
    output A,
    output B,
    output C,
    output D,
    output E,
    output F,
    output G,
);

    not not1(A,asp);
    and and1(S1,got,A);

endmodule 