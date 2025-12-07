# systemverilog-comparator-verification
SystemVerilog Verification for 8-bit Comparator Layered, class-based testbench environment for verification of a parameterizable digital comparator. Provides random stimulus generation, mailbox-based communication, and a self-checking scoreboard.
Use this for the main documentation file. You can copy and paste this directly into a file named README.md.

SystemVerilog Verification: 8-bit Comparator
This repository contains a complete SystemVerilog verification environment for a parameterizable N-bit Digital Comparator. The testbench is designed using a layered architecture (Generator, Driver, Monitor, Scoreboard) to ensure modularity and reusability.

📌 Project Overview
The project verifies the functionality of a digital comparator that takes two 8-bit inputs (A and B) and outputs their relationship (A > B, A < B, or A == B). The environment utilizes object-oriented programming (OOP) features of SystemVerilog to create a robust self-checking testbench.

🛠️ Architecture & Features

Layered Testbench: Implements a standard verification hierarchy including Environment, Generator, Driver, Monitor, and Scoreboard.


Transaction-Level Modeling: Uses Mailboxes to pass transaction objects between components.



Randomization: Utilizes randc (random-cyclic) to generate unique input stimuli for comprehensive coverage.


Interface & Modports: separating signal communication using SystemVerilog Interfaces with specific modports for the DUT, Driver, and Monitor.



Self-Checking: The Scoreboard acts as a reference model, independently calculating expected results and comparing them against the DUT outputs.


Synchronization: Uses events (sample_enable) to synchronize the Driver and Monitor for accurate sampling.
