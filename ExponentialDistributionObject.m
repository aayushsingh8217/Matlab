% Parameters for the exponential distribution

clear all
clc

% Generate random samples from exponential distribution
lambda = 1; % Rate parameter
num_samples = 100000; % Number of samples
samples = exprnd(1/lambda, num_samples, 1);

% Compute the probabilities using a single for loop
prob_0_to_1 = 0;
prob_0_to_5 = 0;

for i = 1:num_samples
    if samples(i) > 0 && samples(i) < 1
        prob_0_to_1 = prob_0_to_1 + 1;
    end
    if samples(i) > 0 && samples(i) < 5
        prob_0_to_5 = prob_0_to_5 + 1;
    end
end

prob_0_to_1 = prob_0_to_1 / num_samples;
prob_0_to_5 = prob_0_to_5 / num_samples;

disp(['P[0 < x < 1]: ', num2str(prob_0_to_1)]);
disp(['P[0 < x < 5]: ', num2str(prob_0_to_5)]);
