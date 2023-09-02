clear all;
clc;

% Define the variance of the AWGN (Additive White Gaussian Noise)
sig = 0.01; % Sigma square

% Initialize arrays and counters
count = 1;
for i = 0:0.0035:35
    e_b = i / 1;
    
    % Calculate BER using different formulas
    pb_e1(count) = (1/2) * (1 - sqrt((e_b * (e_b * sig + 2 - 2 * sig)) / ((e_b + 2) * (e_b * sig + 2))));
    pb_e2(count) = (1/2) * (1 - sqrt(e_b / (2 + e_b)));
    pb_e3(count) = 1 / (2 + e_b);
    pb_e4(count) = (1/2) * (1 - sqrt(((1 - sig) * e_b) / (1 + e_b)));
    
    % Store the value of e_b for plotting
    x(count) = e_b;
    count = count + 1;
end

% Plot BER vs. Eb/N0 for different formulas
semilogy(x, pb_e1);
hold on;
grid on;
semilogy(x, pb_e2);
semilogy(x, pb_e3);
semilogy(x, pb_e4);
hold off;

% Generate random bits and apply BPSK modulation
M = 2; % BPSK modulation order
hMod = comm.BPSKModulator; % Create a BPSK modulator
hDemod = comm.BPSKDemodulator; % Create a BPSK demodulator
tx = randi([0 M-1], 500, 1); % Generate random bits
dpskSig = step(hMod, tx); % BPSK modulation
y = dpskSig * 2 - 1; % Convert BPSK symbols to -1 and 1
Y = eye(M); % Eye diagram
yxx = zeros(500, 2);

for i = 1:length(dpskSig)
    if y(i) == 1
        yxx(i, :) = Y(1, :);
    else
        yxx(i, :) = Y(2, :);
    end
end

% Apply Rayleigh fading channel effects
fadedSig = applyRayleighFading(dpskSig);

% Define SNR values and initialize BER arrays
SNR = 0:2:20; % Range of SNR values, in dB
numSNR = length(SNR);
berVec = zeros(3, numSNR);
ber2 = zeros(numSNR, 1);

% Create AWGN channel and ErrorRate calculator objects
hChan = comm.AWGNChannel('NoiseMethod', 'Signal to noise ratio (SNR)');
hErrorCalc = comm.ErrorRate;

for n = 1:numSNR
    hChan.SNR = SNR(n);
    rxSig = step(hChan, fadedSig); % Add Gaussian noise
    rx = step(hDemod, rxSig); % Demodulate using BPSK Demodulator
    X = [real(rxSig), imag(rxSig)];
    reset(hErrorCalc);
    
    % Compute error rate
    berVec(:, n) = computeBER(tx, rx);
    
    % Perform neural network-based signal detection
    output2 = mynn(X, yxx);
    [~, ii] = max(output2);
    yt = (ii == 1);
    rxf = step(hDemod, 2 * double(yt') - 1);
    ber2(n) = computeBER(tx, rxf);
end

% Plot BER results
BER = berVec(1, :);
figure;
semilogy(SNR, BER, 'b-');
xlabel('SNR (dB)');
ylabel('BER');
title('Binary Signal over Rayleigh Fading Channel');
