% Josh Corps, 130012977
-module (ccharcount).
-export ([load/0, load/1, load/2, count/3, go/1, join/2, split/2, processManager/3, processSpawn/2, process/2]).

% Load in the file, lower all letters, split, and send it to processes.
load() -> load("war.txt", erlang:system_info(schedulers_online)). % defaults to war.txt
load(Filename) -> load(Filename, erlang:system_info(schedulers_online)). % gets the number of cores available to erlang and uses that for numSplits
load(F, NumSplits) when is_integer(NumSplits) ->
	{ok, Bin} = file:read_file(F),
	List = binary_to_list(Bin),
	Length = round(length(List)/NumSplits),
	Ls = string:to_lower(List),
	Sl = split(Ls, Length),
	io:fwrite("Loaded, Lowered, and Split~n"),
	
	StartTime = erlang:monotonic_time(),
	
	PManagerPID = spawn(?MODULE, processManager, [[],length(Sl)-1, self()]), % create process to manage and join the other process results
	io:fwrite("Spawning processManager with PID:~p~n", [PManagerPID]),
	processSpawn(Sl, PManagerPID), % begin spawning processes for split file
	
	% receive and print the complete result list
	receive
		{From, JoinedResult} -> 
		RunTime = erlang:convert_time_unit(erlang:monotonic_time() - StartTime, native, millisecond)/1000,
		io:fwrite("~nResult:~n~p~nRun Time:~p seconds~n",[JoinedResult, RunTime]);
		_Other -> {error, unknown}
	end.

%% 
% manages the prcesses and joins the results together for displaying at the end
processManager(JoinedResult, -1, MainPID) -> MainPID ! {self(), JoinedResult}; % when finished return JoinedResult to main process for result display
processManager(JoinedResult, N, MainPID) ->
	receive
		{From, ProcessResult} -> 
		Result = join(JoinedResult, ProcessResult),
		processManager(Result, N-1, MainPID);
       _Other -> {error, unknown}
   end.

% spawns new processes with part of split file
processSpawn([], _) -> io:format("All Processes Spawned.~n", []);
processSpawn([H|T], PManagerPID) ->
	io:fwrite("Spawning new process with PID:~p~n",[spawn(?MODULE, process, [H, PManagerPID])]), % spawn a new process and display it's pid
	processSpawn(T, PManagerPID).

% performs the processing on the file and returns its result to the processManager 
process(L, PManagerPID) ->
	ProcessResult = go(L),
	PManagerPID ! {self(), ProcessResult}.
%%

join([],[]) -> [];
join([],R) -> R;
join([H1 |T1],[H2|T2]) ->
	{C, N} = H1,
	{C1, N1} = H2,
	[{C1, N+N1}] ++ join(T1, T2).

split([],_) -> [];
split(List, Length) ->
	S1 = string:substr(List,1,Length),
	case length(List) > Length of
		true -> S2 = string:substr(List, Length+1, length(List));
		false -> S2 = []
	end,
	[S1] ++ split(S2, Length).

count(Ch, [], N) -> N;
count(Ch, [H|T], N) ->
	case Ch==H of
		true-> count(Ch, T, N+1);
		false -> count(Ch, T, N)
	end.

go(L)->
Alph = [$a,$b,$c,$d,$e,$f,$g,$h,$i,$j,$k,$l,$m,$n,$o,$p,$q,$r,$s,$t,$u,$v,$w,$x,$y,$z],
rgo(Alph, L, []).

rgo([H|T], L, Result)->
	N = count(H, L, 0),
	Result2 = Result ++ [{[H], N}],
	rgo(T, L, Result2);

rgo([], L, Result) -> Result.