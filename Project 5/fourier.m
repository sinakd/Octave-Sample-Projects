clear all;
close all;
clc;

% Load signal processing package
pkg load signal;

% Load the audio signal
load('audio_signal.mat');

% Step 3: Fourier Analysis
N = length(signal);
Y = fft(signal);
f = (0:N-1) * (Fs/N);

% Keep only the first half (up to Nyquist frequency)
half_N = floor(N/2) + 1;
Y_half = Y(1:half_N);
f_half = f(1:half_N);

% Compute magnitude spectrum
magnitude = abs(Y_half) / (N/2);
magnitude(1) = magnitude(1) / 2;  % Correct DC component

% Step 4: Visualization
% Find indices for first 0.5 seconds
idx = t <= 0.5;

figure;

% Top subplot: Time domain (first 0.5 seconds)
subplot(2,1,1);
plot(t(idx), signal(idx), 'b');
title('Time Domain Signal (0 to 0.5 seconds)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Bottom subplot: Magnitude spectrum
subplot(2,1,2);
plot(f_half, magnitude, 'b');
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
xlim([0 Fs/2]);

% Step 5: Peak Detection
% Find peaks in magnitude spectrum (ignore DC component)
min_peak_height = 0.1;  % Minimum peak height threshold
[peaks, locs] = findpeaks(magnitude(2:end), 'MinPeakHeight', min_peak_height);

% Sort peaks and keep top 2
[peaks_sorted, sort_idx] = sort(peaks, 'descend');
peaks_sorted = peaks_sorted(1:2);
locs_sorted = locs(sort_idx(1:2));

% Convert indices to actual frequencies
peak_freqs = f_half(locs_sorted + 1);  % +1 because we started from index 2

% Mark peaks on magnitude spectrum
subplot(2,1,2);
hold on;
plot(peak_freqs, peaks_sorted, 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);
hold off;

% Print detected frequencies
fprintf('Detected dominant frequencies:\n');
for i = 1:length(peak_freqs)
    fprintf('  %.1f Hz (magnitude: %.3f)\n', peak_freqs(i), peaks_sorted(i));
end

% Save figure
print('spectrum_analysis.png', '-dpng', '-r150');
disp('Figure saved as spectrum_analysis.png');
