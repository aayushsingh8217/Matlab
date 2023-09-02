% Parameters
A = 1;         % Amplitude
Tb = 1;        % Bit duration
fs = 1000;     % Sampling frequency
fc = 10;       % Carrier frequency
numBits = 100; % Number of bits

% Generate bit sequence
bits = randi([0, 1], 1, numBits);

% Time vector
t = 0:1/fs:Tb*numBits-1/fs;

% BPSK signal generation
bpsk_signal = A * sqrt(2 / Tb) * cos(2 * pi * fc * t + pi * bits);

% Plot the BPSK signal
figure;
subplot(2, 1, 1);
stem(bits, 'Marker', 'none');
title('Transmitted Bits');
xlabel('Bit Index');
ylabel('Bit Value');
axis([0 numBits+1 -0.5 1.5]);

subplot(2, 1, 2);
plot(t, bpsk_signal);
title('BPSK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Adjust plot
linkaxes;