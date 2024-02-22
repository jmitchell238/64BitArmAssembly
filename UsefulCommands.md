# Useful Command Line Commands

## Directory Navigation
- [LLDB Commands](#lldb-commands)

## LLDB Commands
### Using lldb

- [Launch LLDB debugger](#launch-lldb-debugger)
- [Run file](#run-file)
- [Create Breakpoint](#create-breakpoint)
- [List Breakpoints](#list-breakpoints)
- [Delete Breakpoint](#delete-breakpoint)
- [Threads](#threads)
- [Frame](#frame)
- [Disassemble](#disassemble)
- [Registers](#registers)
- [Display Memory Contents](#display-memory-contents)

### Launch LLDB debugger
- `lldb <executable>`: Launches the LLDB debugger with the specified executable.

### Run file
- `run`: Runs the program until the next breakpoint or until it exits.
- `continue`: Continues execution until the next breakpoint or until the program exits.

### Create Breakpoint
- `breakpoint set --name <function_name>`: Sets a breakpoint at the specified function name.
- `b <function_name>`: Also sets a breakpoint at the specified function name.

### List Breakpoints
- `breakpoint list`: List all the breakpoints.
- `br l`: Also list all the breakpoints.

### Delete Breakpoint
- `breakpoint delete <breakpoint_id/number>`: Deletes the specified breakpoint.
- `br de <breakpoint_id/number>`: Also deletes the specified breakpoint.

### Threads
- `thread list`: Lists all threads in the current process.
- `thread select <thread_id>`: Selects the specified thread.

### Frame
- `frame variable`: Prints the values of all variables in the current stack frame.

### Disassemble
- Open file in lldb `lldb <file_name>`
- `target create <file_name>`: Creates a target for the specified file. You should see this after you open the file. You can re-run this command to be sure.
- Disassemble our file at a specific function
    - `disassemble -n <function_name>`: Disassembles the specified function. example: `disassemble -n start`

### Registers
- open file in lldb `lldb <file_name>`
  - Set a breakpoint at a location in the program you would like to inspect.
    - `breakpoint set --name <function_name>`: Sets a breakpoint at the specified function name. example: `breakpoint set --name start`
- run file `run`
  - `register read`: This will show you what's in each register. example: `register read`
  - `register read <register_name>`: This will show you what's in the specified register. example: `register read x0`
  - `register read <register_name_1> <register_name_2> <register_name_3>`: This will show you what's in the specified registers. example: `register read SP X0 X1`
  - `register write <register_name> <value>`: This will write the specified value to the specified register. example: `register write x0 0x0`

### Display Memory Contents
- `memory read <address>`: Displays the contents of the specified address. example: `memory read 0x100000000`
- `m read <address>`: Also displays the contents of the specified address. example: `m read 0x100000000`
- `memory read -fx -c4 -s4 $address`: Displays the contents of the specified address in hexadecimal format, with 4 columns, and 4 bytes per column. `-f`: Display format. `-x`: Display in hexadecimal format. `-c`: Number of columns. `-s`: Number of bytes per column.
