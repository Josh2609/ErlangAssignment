-module (uniqueFile).
-export ([main/0, main/1, loadFile/1]).

main() ->
	io:fwrite("No file provided. Using default file hamlet.txt.~n"),
	List = loadFile("hamlet.txt"),
	io:fwrite("Unique words of the file are ~p~nThe number of unique words is ~w~n", [sortUnique(List), length(sortUnique(List))]).

main(FileName) ->
	io:fwrite("Running with file: ~p.~n", [FileName]),
	List = loadFile(FileName),
	io:fwrite("Unique words of the file are ~p~nThe number of unique words is ~w~n", [sortUnique(List), length(sortUnique(List))]).

% sorts the list and removes duplicates
sortUnique([Pivot|T]) ->
	sortUnique([X || X <- T, X < Pivot])++
	[Pivot]++
	sortUnique([X || X <- T, X > Pivot]);
sortUnique([])->[].

% loads the file into a list, converts to lowercase, and tokes/removes characters.
loadFile(FileName) ->
	{ok, FileContents} = file:read_file(FileName),
	LoadedList = binary_to_list(FileContents),
	LowerList = string:to_lower(LoadedList), 
	RemoveSingleQ = re:replace(LowerList, "\\'", "", [global,{return,list}]), % remove ' from the list
	FilteredList = string:lexemes(RemoveSingleQ,"\r\n\" !@£$%^&*(){}[]<>,./?;:#€-_=+`~" ++ [[$\r,$\n]]), % split list elements based on any of these
	sortUnique(FilteredList).