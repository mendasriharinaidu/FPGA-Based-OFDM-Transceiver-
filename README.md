# FPGA-Based OFDM Transceiver using Verilog HDL

## 📌 Overview

This project presents the design and implementation of a complete **Orthogonal Frequency Division Multiplexing (OFDM) Transceiver** using **Verilog HDL** on FPGA. The design implements both the transmitter and receiver chains by integrating custom RTL modules with **Xilinx FFT/IFFT IP cores** through the **AXI-Stream interface**.

The transceiver performs end-to-end digital communication, including pseudo-random symbol generation, QPSK modulation, OFDM modulation/demodulation, cyclic prefix processing, and symbol recovery. The complete design was verified through RTL simulation in **Xilinx Vivado**.

---

## 🚀 Features

- Designed an **LFSR-based pseudo-random symbol generator** for digital data generation.
- Implemented **QPSK Modulation and Demodulation** for baseband communication.
- Integrated **Xilinx IFFT IP Core** for OFDM symbol generation.
- Integrated **Xilinx FFT IP Core** for OFDM symbol recovery.
- Developed **Cyclic Prefix (CP) Insertion** using BRAM-based buffering and circular address pointers.
- Designed **Cyclic Prefix (CP) Removal** module for receiver processing.
- Implemented complete **AXI-Stream compliant interfaces** for FFT/IFFT IP communication.
- Built a complete **OFDM transmitter and receiver chain** entirely in Verilog HDL.
- Verified functional correctness through **RTL simulation and waveform analysis** in Xilinx Vivado.

---


# Project Modules

## Transmitter

- LFSR-Based Symbol Generator
- QPSK Modulator
- AXI-Stream Controller
- Xilinx IFFT IP Core
- Cyclic Prefix Insertion

## Receiver

- Cyclic Prefix Removal
- Xilinx FFT IP Core
- AXI-Stream Controller
- QPSK Demodulator

---


# Simulation Results

The complete OFDM transceiver was verified through RTL simulation in **Xilinx Vivado**, validating:

- LFSR pseudo-random data generation
- QPSK modulation and demodulation
- AXI-Stream handshaking
- FFT/IFFT frame processing
- Cyclic Prefix insertion and removal
- End-to-end OFDM data recovery

---

# Tools & Technologies

- Verilog HDL
- Xilinx Vivado
- Xilinx FFT IP Core
- Xilinx IFFT IP Core
- AXI-Stream Protocol
- FPGA-Based Digital Communication Design

---

# Learning Outcomes

This project provided practical experience in:

- FPGA-based wireless communication system design
- OFDM transmitter and receiver architecture
- Integration of vendor IP cores with custom RTL
- AXI-Stream interface design and verification
- High-speed digital signal processing on FPGA
- Cyclic Prefix implementation using BRAM
- Hardware implementation of QPSK modulation and demodulation
- End-to-end OFDM communication system development

---

# Applications

- Wi-Fi (IEEE 802.11)
- LTE / LTE-Advanced
- 5G NR
- Digital Broadcasting
- Broadband Wireless Communication Systems

---


## 📷 Project Images

- OFDM Transceiver Architecture
- RTL Simulation Waveforms
- AXI-Stream Handshake Verification
- FFT/IFFT Processing Results
- Cyclic Prefix Insertion & Removal
- FPGA Implementation

