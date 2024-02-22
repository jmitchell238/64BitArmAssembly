## MAKE File Setup:
---
- Makefile is a file that contains a set of instructions that are used to build a program or a set of programs.

- The instructions are called rules and they are made up of a target, dependencies, and a recipe.
  - The target is the name of the file that is to be built.
  - The dependencies are the files that the target depends on.
  - The recipe is the set of commands that are used to build the target.

### Special Symbols:
---
- `%.s`: Symbol/Wildcard for any file ending in .s
- `$<`: Symbol for the source file
- `$@`: Symbol for the output file

### Example - Basic makefile:
---
```makefile
HelloWorld: HelloWorld.o
	ld -o HelloWorld HelloWorld.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

HelloWorld.o: HelloWorld.s
	as -arch arm64 -o HelloWorld.o HelloWorld.s
```

### Example - Makefile with special symbols:
---
```makefile
%.o: %.s
    as -arch arm64 -o $@ $<

HelloWorld: HelloWorld.o
    ld -o HelloWorld HelloWorld.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
```

### Switch Breakdown:
---
- `ld`: Linker
- `-o`: Output file
- `-lSystem`: Tells the linker to link our executable with libSystem.dylib. We do that to add the LC_MAIN load command to the executable. Generally, Darwin does not support statically linked executables. It is possible, if not especially elegant to create executables without using libSystem.dylib. I will go deeper into that topic when time permits. For people who read Mac OS X Internals I will just add that this replaced LC_UNIXTHREAD as of MacOS X 10.7.
- `-sysroot`: In order to find libSystem.dylib, it is mandatory to tell our linker where to find it. It seems this was not necessary on macOS 10.15 because "New in macOS Big Sur 11 beta, the system ships with a built-in dynamic linker cache of all system-provided libraries. As part of this change, copies of dynamic libraries are no longer present on the filesystem.". We use xcrun -sdk macosx --show-sdk-path to dynamically use the currently active version of Xcode.
- `-e _start`: Darwin expects an entrypoint _main. In order to keep the sample both as close as possible to the book, and to allow it's use within the C-Sample from Chapter 3, I opted to keep _start and tell the linker that this is the entry point we want to use
- `-arch arm64`: We want to build an executable for arm64. Since we are using a cross-compiler, we need to tell the linker which architecture we want to build for. Since we are building for arm64, we need to use the arm64 version of libSystem.dylib. If we were to build for x86_64, we would need to use the x86_64 version of libSystem.dylib. You can leave this off when running on Apple Silicon.
-
