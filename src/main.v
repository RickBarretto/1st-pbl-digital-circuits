module main(
	input low, 
	input mid, 
	input Us, 
	input Ua,
	input T,
	input high, 
	output watter_supply, 
	output error, 
	output alarme, 
	output asp,
	output got
);

	wire rega;

	check_error creitinho_dugrau(low, mid, high, error);
	open_watter_supply open(error, high, watter_supply);
	rega rega_tete(error, Us, low,rega);
	asp asp_teste(Us, Ua, T, mid, asp);
	got got_teste(Us, Ua, T, mid, got);
	
endmodule