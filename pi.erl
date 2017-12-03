% Josh Corps, 130012977
-module (pi).
-export ([pi/0, truncPi/0]).

% sets up Pi
pi() -> 
	CurrPi = 0,
	Sign = 1,
	Denom = 1,
	pi(CurrPi, Sign, Denom).

% calculates an approximation of Pi accurate to 5 decimal places using a Taylor series
pi(CurrPi, Sign, Denom) ->
	A = 1 / Denom,
	if 
		A > 0.000001 -> 
			pi(CurrPi+(Sign*A), Sign*-1, Denom+2);
		true -> CurrPi * 4
	end. 

% sets up truncPi
truncPi() -> 
	CurrPi = 0,
	Sign = 1,
	Denom = 1,
	truncPi(CurrPi, Sign, Denom).

% calculates an approximation of Pi accurate to 5 decimal places using a Taylor series and truncates to 5 decimal places
truncPi(CurrPi, Sign, Denom) ->
	A = 1 / Denom,
	if 
		A > 0.000001 -> 
			truncPi(CurrPi+(Sign*A), Sign*-1, Denom+2);
		true -> 
			io_lib:format("~.5f",[CurrPi * 4])
	end.