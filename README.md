How to run:

Assignment 1:
	Creates an approximation of Pi accurate to 5 decimal places using a Taylor series
	
	c(pi).

	For Pi accurate to 5 decimal places:
		pi:pi().

	For Pi to accurate 5 decimal places and truncated to 5 decimal places:
		pi:truncPi().

Assignment 2:
	Returns Unique values from a list or a file and the number of unique values.

	Part A:
		c(uniqueList).
		uniqueList:main(). 	for default list, '[2,5,3,6,3,2,7,8,5,6]'
		uniqueList:main([<list>]).	for your own list, e.g. uniqueList:main([6,3,5,4,2,7,8,5]).

	Part B:
		c(uniqueFile).
		uniqueFile:main(). 	for default file, 'hamlet.txt'
		uniqueFile:main("<filename>"). 	for own file, e.g. uniqueFile:main("hamlet.txt").

Assignment 3:
	Calculates the number of each character of the alphabet in a file both non concurrently and concurrently. Concurrent defaults to using the number of threads available to erlang. Non concurrent runtime on my laptop is ~8-9 seconds and concurrent runtime is ~3-4 seconds.

	Non Concurrent (from example, with runtimer for comparison):
		c(charcount).
		charcount:load().	for default file, 'war.txt'
		charcount:load("<filename>").	for own file, e.g. charcount:load("hamlet.txt").

	Concurrent:
		c(ccharcount).
		ccharcount:load().	for default file, 'war.txt'
		ccharcount:load("<filename>").	for own file, e.g. ccharcount:load("hamlet.txt").
		ccharcount:load("<filename>", <num of file splits>)	for own file and a custom number of file splits, e.g. e.g. ccharcount:load("hamlet.txt", 16).