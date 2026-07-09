# FSM-Based Virtual Vending Machine Controller using Verilog HDL
This project implements an FSM-based virtual vending machine controller using Verilog HDL. The controller simulates the operation of a vending machine by accepting ₹5 and ₹10 coin inputs, tracking the inserted amount through finite state transitions, dispensing products according to the implemented logic, returning change when required, rejecting invalid coins, and indicating the current machine status using LED outputs. The design was verified using a Verilog testbench through simulation. output.

## Features

- FSM-based synchronous vending machine controller
- Accepts ₹5 and ₹10 coin inputs
- Detects invalid coin insertion
- Supports product dispensing based on accumulated balance
- Returns appropriate change when required
- Indicates machine status using LED outputs
- Includes reset functionality to initialize the controller

---
