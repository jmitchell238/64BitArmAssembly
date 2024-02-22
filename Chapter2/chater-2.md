# Chapter 2: Loading and Adding

Welcome to Chapter 2 of the "64 Bit Arm Assembly Language Programming" book! This chapter focuses on loading values from registers and performing addition operations in Arm assembly language.

## Contents

- [About](#chapter-2-loading-and-adding)
- [Makefile](#makefile)
- [Code Examples](#code-examples)

## Makefile

The `makefile` provided in this directory automates the build process for the code examples in this chapter. It defines rules for assembling and linking the assembly files to generate executable programs.

To build the programs, you can use the following commands in your terminal:

```bash
make
```

This command will build all programs defined in the makefile.

This will compile the hello.s file and generate an executable named hello.

If you have already built the program, then this won't do anything, since make sees that the executable is older than the .o file and that the .o file is older than the .s file. If you want to force a rebuild, you can use the following command:

```bash
make -B
```

To clean up the directory and remove object files and executables, you can use the following command:

```bash
make clean
```

## Code Examples

This chapter includes several code examples demonstrating the concepts covered:

1. **addexamp1.s**: Example code for adding values from registers.
2. **addexamp2.s**: Another example code for adding values from registers.
3. **addexamps.s**: Example code for adding values from registers (possible misspelling).
4. **codesnippets.s**: Code snippets demonstrating various concepts covered in the chapter.
5. **movexamps.s**: Example code for moving values between registers.

Feel free to explore and experiment with these code examples to deepen your understanding of ARM assembly language programming.

## Next Steps

After studying and experimenting with the code examples in this chapter, you should have a solid understanding of loading values from registers and performing addition operations in Arm assembly language. Feel free to explore more advanced topics covered in subsequent chapters.

Happy coding!
