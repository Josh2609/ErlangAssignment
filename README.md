How to run:

Assignment 1:
	c(assignment1).
	assignment1:pi().

Assignment 2:
	Part A:
		c(uniqueList).
		uniqueList:main(). 	for default list, '[2,5,3,6,3,2,7,8,5,6]'
		uniqueList:main([<list>]).	for your own list, e.g. uniqueList:main([6,3,5,4,2,7,8,5]).

	Part B:
		c(uniqueFile).
		uniqueFile:main(). 	for default file, 'hamlet.txt'
		uniqueFile:main("<filename>"). 	for own file, e.g. uniqueFile:main("hamlet.txt").

Assignment 3:
	Non Concurrent (from example, with runtimer for comparison):
		c(charcount).
		charcount:load("<filename>").	e.g. charcount:load("war.txt").

	Concurrent:
		c(ccharcount).
		ccharcount:load("<filename>").	e.g. ccharcount:load("war.txt").