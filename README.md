# Hardware Implementation of Ascon-AEAD128

## Introduction to Ascon

Ascon was selected in 2019 as the winner of the CAESAR competition for lightweight authenticated encryption.
It was specifically designed for use in resource-constrained environments such as embedded systems, where standard AES implementations may be too demanding in terms of area or power consumption [1].

Ascon was developed by Christoph Dobraunig, Maria Eichlseder, Florian Mendel, and Martin Schläffer [2].

In 2024, the National Institute of Standards and Technology (NIST) published an initial public draft for Ascon-based lightweight cryptographic standards [3].

## About This Project

This project implements the **Ascon-AEAD128** algorithm in hardware with an **AXI4-Lite interface** using **SystemVerilog**.
It was originally developed as part of a school project to learn hardware design and FPGA development. A year later, the project was restarted from scratch, this time based on the official NIST draft specifications. Several design and code improvements were made; in addition, decryption is implemented and both operations support any number of associated data and data blocks.

Please note that this project is provided **as-is**, without any warranty or guarantee of correctness or suitability for any specific purpose.

## Project Structure

- `core/` – RTL modules that compose Ascon-AEAD128 IP
- `testbench/` – Testbenches of the RTL modules
- `sim/` – Scripts and ModelSim-related files used for simulation
- `doc/` - User manual of Ascon-AEAD128 IP
- `ip_packaging` - Scripts for FPGA implementation

## How to

**Run simulations**:
- **prerequisites** : have Modelsim 32-bit free version installed and have [Ascon-AEAD128 C model](https://github.com/c-herail/ascon-aead128-c) installed
- go to `sim/Modelsim`
- type `make compile_dpi_lib` to compile C code into a shared library, change `ASCON_C_DIR` if necessary [this step is necessary only once]
- type `make run_gui-<name of RTL module>` to run simulation with GUI
- or `make run-<name of RTL module>` to run in batch mode
- or `make run_all` to run all simulations one after the others in batch mode

**Package IP for FPGA tools**:
- **prerequisites** : have Vivado 2022.2 installed
- go to `ip_packaging/vivado`
- type `vivado -mode batch -soure package_ip.tcl`
- or use Vivado GUI to execute the sript

## References

[1] https://csrc.nist.gov/pubs/sp/800/232/ipd

[2] https://ascon.isec.tugraz.at/

[3] Meltem Sönmez Turan, Kerry A. McKay, Donghoon Chang, Jinkeon Kang, John Kelsey (2024) Ascon-Based Lightweight Cryptography Standards for Constrained Devices. (National Institute of Standards and Technology, Gaithersburg, MD),NIST Special Publication (SP) NIST SP 800-232 ipd. https://doi.org/10.6028/NIST.SP.800-232.ipd