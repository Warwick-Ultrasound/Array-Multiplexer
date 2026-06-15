# Array-Multiplexer
A set of MATLAB functions for controlling a custom flow measurement array multiplexer.

## Description of functions

### mp = openMP(port)
Opens a serial connection to the multiplexer and returns an object which represents it and is passed to the other functions. The input to the function is the port the multiplexer is connected to e.g. "COM5", which can be found on windows by looking in device manager.

### [flag, diag] = MPwrite(mp, updown, trans1, trans2)
Sends commands to the multiplexer to set the upstream/downstream direction and the transducer in each ring. The inputs are:
- mp: The multiplexer object returned by openMP.
- updown: Takes value 0 or 1 to indicate whether to take an upstream or downstream measurement.
- trans1: Takes a value between 0 and 7 (inclusive) to choose a transducer in ring 1.
- trans2: Takes a value between 0 and 7 (inclusive) to choose a transducer in ring 2.

The function also checks that the multiplexer reports that it has responded to the command, and sets the flag to 1 to indicate success (and 0 otherwise). diag is an empty string if the write was successful, but if it was unsuccessful it contains the diagnostic information from the multiplexer to indicate why it failed.