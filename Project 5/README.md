# Audio Signal Processor - Octave Challenge

## Overview
This project generates a composite audio signal and performs Fourier analysis to identify its constituent frequencies using Octave.

## Signal Composition
- Sampling frequency: 1 kHz
- Duration: 2 seconds
- Signal components:
  - 50 Hz pure tone (amplitude: 0.7)
  - 120 Hz pure tone (amplitude: 1.0)
  - Random Gaussian noise (amplitude: 0.5)

## Implementation Steps

### 1. Signal Generation
A composite signal is created by summing two sine waves of different frequencies with added random noise.

### 2. File Storage & Retrieval
The generated signal is saved to a binary `.mat` file (`audio_signal.mat`). The workspace is then cleared and the data is reloaded to verify successful storage and retrieval.

### 3. Fourier Analysis
- Fast Fourier Transform (FFT) is computed on the signal
- Frequency vector is calculated using `(0:N-1) * (Fs/N)`
- Only the first half of the spectrum is retained (up to Nyquist frequency: Fs/2)
- Magnitude spectrum is normalized

### 4. Visualization
A single figure with two subplots is generated:
- **Top**: Time domain signal for the first 0.5 seconds
- **Bottom**: Magnitude spectrum showing frequency components

### 5. Peak Detection
Using `findpeaks` function to automatically detect the two dominant frequencies (50 Hz and 120 Hz). Detected peaks are marked with red circles on the spectrum plot.

## Files
- `fourier.m` - Main analysis script
- `audio_signal.mat` - Generated audio signal data
- `spectrum_analysis.png` - Output visualization (150 dpi)

## Requirements
- GNU Octave (with `signal` package)

## Usage
```octave
octave fourier.m
```

## Results
The script successfully detects both target frequencies:
- 50.0 Hz (magnitude: ~0.7)
- 120.0 Hz (magnitude: ~1.0)
