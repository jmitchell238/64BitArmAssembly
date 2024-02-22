# Version 1
hello: hello.o
	ld -o hello hello.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

hello.o: hello.s
	as -arch arm64 -o hello.o hello.s

# Version 2 - More advanced
# This version uses the automatic variables $@ and $< to make the makefile more readable
# and telling make how to create the object file from the source file.
# We are telling make to build hello from hello.o and make can look at its implicit rules
# to see how to build the object file from the source file.
#
# Symbols:
# %.s - Symbol/Wildcard for any file ending in .s
# $< - Symbol for the source file
# $@ - Symbol for the output file
# 

# %.o: %.s
# 	as -arch arm64 -o $@ $<

# hello: hello.o
# 	ld -o hello hello.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
