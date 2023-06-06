% Define the time axis
fs = 100000; % Sampling frequency (Hz)
T = 1; % Signal duration (s)
t = 0:1/fs:T-1/fs; % Time axis (s)

% Create a signal as a sum of three harmonic oscillations
f1 = 100; % Frequency of the 1st harmonic (Hz)
f2 = 1000; % Frequency of the 2nd harmonic (Hz)
f3 = 10000; % Frequency of the 3rd harmonic (Hz)
A1 = 1; % Amplitude of the 1st harmonic 
A2 = 0.5; % Amplitude of the 2nd harmonic
A3 = 0.1; % Amplitude of the 3rd harmonic
s = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t) + A3*sin(2*pi*f3*t);

% Compute the Fourier transform of the signal and plot its spectrum
S = fftshift(fft(s));
L = length(s);
f = (-fs/2:fs/(L-1):fs/2); % Frequency axis (Hz)
figure;
plot(f, abs(S)/L);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of the signal');

% Design a high-pass filter to isolate the 1st harmonic
f_c = 50; % Cutoff frequency (Hz)
W_c = 2*pi*f_c/fs; % Cutoff frequency (rad/s)
M = 51; % Filter order (number of taps)
h = fir1(M, W_c/(2*pi), 'high'); % FIR filter coefficients

% Plot the impulse response and frequency response of the filter 
figure;
subplot(2, 1, 1);
stem(h);
xlabel('Filter tap number');
ylabel('Amplitude');
title('Impulse response of the filter');
subplot(2, 1, 2);
freqz(h);
title('Frequency response of the filter');

% Filter the signal using convolution and the designed filter
filtered_s = conv(s, h, 'same');

% Filter the signal using the FFT-based method
S_ = fftshift(fft(s));
f_ = (-fs/2:fs/(L-1):fs/2);
H_ = fftshift(fft(h, length(S_)));
filtered_S_ = S_.*H_;
filtered_s_ = ifft(ifftshift(filtered_S_));

% Plot the signals before and after filtering
figure;
subplot(2, 1, 1);
plot(t, s);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
subplot(2, 1, 2);
hold on;
plot(t, filtered_s);
plot(t, filtered_s_, '--');
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered signal');
legend('Convolution method', 'FFT method');

% Plot the spectrum of the filtered signals
filtered_S = fftshift(fft(filtered_s));
filtered_S_ = fftshift(fft(filtered_s_));
figure;
subplot(2, 1, 1);
plot(f, abs(filtered_S)/L);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of the filtered signal (convolution method)');
subplot(2, 1, 2);
plot(f_, abs(filtered_S_)/L);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectrum of the filtered signal (FFT method)');