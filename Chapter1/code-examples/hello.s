//
// Assembly code for macOS 64-bit
// Program to print "hello world" to stdout
// and then terminate
//
// x0-x2: parameters to Unix system calls
// x16: Mach System Call function number
//
// Compile with:
//      as -arch arm64 -o hello.o hello.s
//      ld -o hello hello.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
//      ./hello 
//
// Let's examine the linker command in more detail:
//      The `-o` option is used in both the `as` (assembler) and `ld` (linker) commands to specify the output 
//          file name. In this case, it specifies the output file name `hello.o` for the assembler command and 
//          `hello` for the linker command.
//      -lSystem tells the linker to link our executable with libSystem.dylib. We do that to add the LC_MAIN 
//          load command to the executable. Generally, Darwin does not support statically linked executables. 
//          It is possible, if not especially elegant to create executables without using libSystem.dylib. 
//          I will go deeper into that topic when time permits. For people who read Mac OS X Internals I will 
//          just add that this replaced LC_UNIXTHREAD as of MacOS X 10.7.
//      -sysroot: In order to find libSystem.dylib, it is mandatory to tell our linker where to find it. It 
//          seems this was not necessary on macOS 10.15 because "New in macOS Big Sur 11 beta, the system ships 
//          with a built-in dynamic linker cache of all system-provided libraries. As part of this change, 
//          copies of dynamic libraries are no longer present on the filesystem.". 
//          We use xcrun -sdk macosx --show-sdk-path to dynamically use the currently active version of Xcode.
//      -e _start: Darwin expects an entrypoint _main. In order to keep the sample both as close as possible 
//          to the book, and to allow it's use within the C-Sample from Chapter 3, I opted to keep _start and 
//          tell the linker that this is the entry point we want to use
//      -arch arm64 for good measure, let's throw in the option to cross-compile this from an Intel Mac. 
//          You can leave this off when running on Apple Silicon.
// 
// Reverse Engineering Our Program
//     otool -tV hello -m
//  or
//     objdump --disassemble -M no-aliases hello
//

.global _start      // Provide program starting address to linker
.align 2            // Make sure everything is aligned to 2 bytes
// align 2 / align 4 / p2align 2 needed for 64-bit apple silicon

// Setup the parameters to print hello world
_start:
    b _printHelloWorld
    b _terminate

// Setup the parameters to print hello world
// and then call the Kernal to do it.
_printHelloWorld:
    mov x0, #1              // 1 = stdout
    adr x1, helloworld      // address of message to print
    mov x2, #13             // length of message to print
    mov x16, #4             // Unix write system call
    svc 0                   // syscall - #0x80

// Setup the parameters to reboot the computer
// and then call the Kernal to do it.
_reboot:
    mov x0, #1     // instant reboot
    mov x16, #55   // reboot
    svc 0          // syscall

// Setup the parameters to terminate the program
// and then call the Kernal to do it.
_terminate:
    mov x0, #0     // User 0 return code
    mov x16, #1    // System call number 1 terminated this program
    svc 0          // syscall - #0x80

// hello world string
helloworld: .ascii "Hello World!\n"
