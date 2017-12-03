-module (pi).
-export ([pi/0, truncPi/0]).

pi() -> 
	CurrPi = 0,
	Sign = 1,
	Denom = 1,
	pi(CurrPi, Sign, Denom).

pi(CurrPi, Sign, Denom) ->
	A = 1 / Denom,
	if 
		A > 0.000001 -> 
			pi(CurrPi+(Sign*A), Sign*-1, Denom+2);
		true -> CurrPi * 4
	end. 

truncPi() -> 
	CurrPi = 0,
	Sign = 1,
	Denom = 1,
	truncPi(CurrPi, Sign, Denom).

truncPi(CurrPi, Sign, Denom) ->
	A = 1 / Denom,
	if 
		A > 0.000001 -> 
			pi(CurrPi+(Sign*A), Sign*-1, Denom+2);
		true -> 
			io_lib:format("~.5f",[CurrPi * 4])
	end.