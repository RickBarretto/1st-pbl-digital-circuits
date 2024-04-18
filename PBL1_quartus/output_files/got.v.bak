module asp(input solo, input ar, input T, input mid, output asp);

wire s1;

not notS(s1, solo);
not notA(s2, ar);
not notT(s3, T);
and and1(s4, s1, s2);
and and2(s5, s1, s3, mid);
or or1(asp, s4, s5);

endmodule 