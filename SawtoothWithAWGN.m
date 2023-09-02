% Creating a sawtooth
t = (0:0.1:60)';
x = sawtooth(t);


% Define a range of seed values
seed_values = [10, 20, 30];

% Create a figure with subplots
figure;

for i = 1:length(seed_values)
    % Set the random number generator seed
    rng(seed_values(i));

    % Introduce AWGN to the signal
    y = awgn(x, 10, 'measured');
    
    % Create subplots
    subplot(length(seed_values), 1, i);
    plot(t, [x y]);
    xlabel('Time')
    ylabel('Amplitude')
    title(['Seed Value: ' num2str(seed_values(i))])
    legend('Original Signal', 'Signal with AWGN')
end
