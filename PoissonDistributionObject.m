clear all
clc

% Define the rate parameter lambda
lambda = 2;

% Create a Poisson distribution object
pd = makedist('Poisson', 'lambda', lambda);

% Define the input vector x
x = [0, 1, 2, 3, 4];

% Calculate the CDF values for the input vector x
cdf_values = cdf(pd, x);

% Display the calculated CDF values
disp('CDF Values:');
disp(cdf_values);
