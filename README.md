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

## State Description

| State | Description |
|--------|-------------|
| S0 | Idle (₹0 inserted) |
| S1 | ₹5 inserted |
| S2 | ₹10 inserted |

---

## Input Description

| Input | Description |
|-------|-------------|
| clk | System clock |
| rst | Active-high synchronous reset |
| in = 00 | No coin / Cancel |
| in = 01 | ₹5 coin |
| in = 10 | ₹10 coin |
| in = 11 | Invalid coin |

---

## Output Description

### Product Output (`out`)

| Value | Description |
|-------|-------------|
| 00 | No product |
| 01 | Dispense Normal Item |
| 10 | Dispense Special Item |

### Change Output (`change`)

| Value | Description |
|-------|-------------|
| 00 | No change |
| 01 | Return ₹5 |
| 10 | Return ₹10 |
| 11 | Return invalid coin |

### Status LED (`state_led`)

| Value | Description |
|-------|-------------|
| 001 | Idle |
| 010 | Processing |
| 100 | Error |

---

## Working

The vending machine starts in the Idle state (₹0).

- Inserting a ₹5 coin moves the controller to the ₹5 state.
- Inserting a ₹10 coin moves it to the ₹10 state.
- Appropriate products are dispensed once the required amount is reached.
- Any excess money is returned as change.
- Invalid coin inputs are detected and returned immediately.
- A reset signal returns the controller to the idle state.

---

## Working
<img width="1548" height="240" alt="image" src="https://github.com/user-attachments/assets/4022e900-8a8f-4b21-9624-9707ba80e11c" />

