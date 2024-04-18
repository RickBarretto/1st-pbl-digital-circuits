module got(input solo, input ar, input T, input mid, output got);

wire s1, s2, s3;

// (not m and ar) or (t and ar);

not notM(s1, mid);
and and1(s2, ar, s1);
and and2(s3, ar, T);
or or1(got, s3, s2);

endmodule 