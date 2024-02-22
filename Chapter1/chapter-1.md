# Chapter 1: Getting Started

Welcome to Chapter 1 of the "64 Bit Arm Assembly Language Programming" book! This chapter covers the basics to get you started with Arm assembly language programming.

## Contents

- [About](#chapter-1-getting-started)
- [Setting Up Your Development Environment](#setting-up-your-development-environment)
- [Compiling and Running the HelloWorld Program](#compiling-and-running-the-helloworld-program)
- [Using the Makefile](#using-the-makefile)

## Setting Up Your Development Environment

Before you begin, ensure you have the necessary tools and environment set up for Arm assembly programming. If you need help with setting up your environment, refer to the book or relevant online resources.

## Compiling and Running the HelloWorld Program

The only program for this chapter is the HelloWorld program, which is provided in the `hello.s` file. This program displays "Hello, World!" on the console when executed.

To compile and run the HelloWorld program, you can use the provided `makefile`. Alternatively, you can manually run the commands from the makefile in the terminal to build the program yourself.

## Using the Makefile

The `makefile` in this directory automates the build process for the HelloWorld program. It contains two versions (`Version 1` and `Version 2`) for your reference.

To build the program using the makefile, navigate to this directory in your terminal and run the following command:

```bash
make
```

This will compile the hello.s file and generate an executable named hello.

## Next Steps

After compiling and running the HelloWorld program, you should have a basic understanding of how to write and build simple Arm assembly programs. Feel free to experiment with the code and explore more advanced topics covered in subsequent chapters.

Happy coding!
