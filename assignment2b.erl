-module (assignment2b).
-export ([main/0]).
-export ([main/1]).
-export ([loadFile/1]).

main() ->
	io:fwrite("No list provided. Using default list [2,5,3,6,3,2,7,8,5,6].~n"),
	List = [2,5,3,6,3,2,7,8,5,6],
	io:format("Unique elements of the list are ~w~nThe number of unique elements is ~w~n", [sortUnique(List), length(sortUnique(List))]).

main(FileName) ->
	io:fwrite("Running with file: ~p.~n", [FileName]),
	List = loadFile(FileName),
	io:fwrite("Unique elements of the list are ~p~nThe number of unique elements is ~w~n", [sortUnique(List), length(sortUnique(List))]).


% sorts the list and removes duplicates
sortUnique([Pivot|T]) ->
	sortUnique([X || X <- T, X < Pivot])++
	[Pivot]++
	sortUnique([X || X <- T, X > Pivot]);
sortUnique([])->[].

loadFile(FileName) ->
	{ok, FileContents} = file:read_file(FileName),
	LoadedList = binary_to_list(FileContents),
	LowerList = string:to_lower(LoadedList),
	RemoveSingleQ = re:replace(LowerList, "\\'", "", [global,{return,list}]),
	FilteredList = string:lexemes(RemoveSingleQ,"\r\n\" !@£$%^&*(){}[]<>,./?;:#€-_=+`" ++ [[$\r,$\n]]),
	sortUnique(FilteredList).
