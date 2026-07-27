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

## 1. QPSK Symbol Generation

- Generated pseudo-random 2-bit symbols using an LFSR and successfully mapped them into QPSK I/Q values.
- Verified correct symbol generation and `symbol_valid` assertion through RTL simulation.

> **Waveform:** <img width="1909" height="250" alt="ofdm1" src="https://github.com/user-attachments/assets/d8a48da9-a982-4782-a60a-5935c7f8bc40" />

---

## 2. IFFT Processing with AXI-Stream Interface

- Successfully transferred OFDM symbols to the IFFT IP using `TVALID`, `TREADY`, and `TLAST` handshake signals.
- Verified correct time-domain OFDM sample generation and frame synchronization.

> **Waveform:** <img width="1913" height="539" alt="ofdm2" src="https://github.com/user-attachments/assets/68f10b82-2a41-44b1-a2e4-1697282bb460" />

---

## 3. Cyclic Prefix (CP) Insertion

- Stored IFFT output samples into BRAM and appended the final samples as the cyclic prefix.
- Verified correct write/read pointer operation and CP generation before transmission.

> **Waveform:** <img width="1920" height="236" alt="ofdm3" src="https://github.com/user-attachments/assets/ae2db5d2-893f-4852-81ef-7e90321d81eb" />

---

## 4. FFT Processing and OFDM Symbol Recovery

- Processed received OFDM symbols through the FFT IP using AXI-Stream protocol.
- Verified successful frequency-domain recovery and proper FFT output synchronization.

> **Waveform:** <img width="1920" height="411" alt="ofdm4" src="https://github.com/user-attachments/assets/74e5264c-64f0-4bba-90f3-9cf2da3675dd" />

---

## 5. QPSK Demodulation and Data Recovery

- Successfully demodulated recovered I/Q samples into the original 2-bit QPSK symbols.
- Verified complete end-to-end OFDM communication by matching transmitted and recovered data bits.

> **Waveform:** <img width="1896" height="246" alt="ofdm5" src="https://github.com/user-attachments/assets/89d42413-af20-4151-bfba-440e98b85a1b" />

---

# Tools & Technologies

- Verilog HDL
- Xilinx Vivado
- Xilinx FFT IP Core
- Xilinx IFFT IP Core
- AXI-Stream Protocol
- FPGA-Based Digital Communication Design

---

# Applications

- Wi-Fi (IEEE 802.11)
- LTE / LTE-Advanced
- 5G NR
- Digital Broadcasting
- Broadband Wireless Communication Systems



