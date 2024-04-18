module rega(input erro, input Us, input low, output rega);

wire S1, S2;

not not1(S1,Us);
not not2(S2,erro);
and and1(rega, S1, S2, low);

endmodule 