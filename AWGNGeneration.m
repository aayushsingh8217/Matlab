clear all;
clc;



% Parameters
samples = 1000; % Number of samples
desired_power_dBW = -6; % Desired power level in dBW (0.25 watts)
desired_power = 10^(desired_power_dBW/10); % Convert dBW to linear scale in watts

% Generate complex white Gaussian noise samples
noise = sqrt(desired_power / 2) * (randn(samples, 1) + 1i * randn(samples, 1));

% Calculate the achieved power
achieved_power = mean(abs(noise).^2);

% Convert achieved power to dBW
achieved_power_dBW = 10 * log10(achieved_power);

% Display the achieved power in both linear scale and dBW
disp(['Achieved power: ' num2str(achieved_power)]);
disp(['Achieved power in dBW: ' num2str(achieved_power_dBW)]);
