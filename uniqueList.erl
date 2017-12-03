-module (uniqueList).
-export ([main/0, main/1]).

main() ->
	io:fwrite("No list provided. Using default list [2,5,3,6,3,2,7,8,5,6].~n"),
	List = [2,5,3,6,3,2,7,8,5,6],
	io:format("Unique elements of the list are ~w~nThe number of unique elements is ~w~n", [sortUnique(List), length(sortUnique(List))]).

main(List) ->
	io:fwrite("Running with list: ~w.~n", [List]),
	sortUnique(List),
	io:fwrite("Unique elements of the list are ~w~nThe number of unique elements is ~w~n", [sortUnique(List), length(sortUnique(List))]).

% sorts the list and removes duplicates
sortUnique([Pivot|T]) ->
	sortUnique([X || X <- T, X < Pivot])++
	[Pivot]++
	sortUnique([X || X <- T, X > Pivot]);
sortUnique([])->[].