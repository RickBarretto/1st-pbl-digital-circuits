module check_error(input low, input mid, input high, output error);

	wire s1, s2, n1, n2;
	
	not not_0(n1, mid);
	not not_1(n2, high);
	and and_1(s1, n1, n2);
	
	and and_2(s2, low, mid);
	
	nor or_0(error, s1, s2);

endmodule