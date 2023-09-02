function fadedSig = applyRayleighFading(dpskSig)
    % Adjust the MaximumDopplerShift value to meet the requirement
    maxDopplerShift = 1/10 * (1/1000000); % 1/10 of the sample rate

    % Specify Rayleigh channel properties using Name,Value pairs
    rayleighchan = comm.RayleighChannel(...
        'SampleRate', 1/1000000, ...
        'MaximumDopplerShift', maxDopplerShift, ... % Updated value
        'PathDelays', 1.0e-004 * [0 0.0400 0.0800 0.1200], ...
        'AveragePathGains', [0 -3 -6 -9] );

    % Apply Rayleigh fading channel effects
    fadedSig = rayleighchan(dpskSig);
end
