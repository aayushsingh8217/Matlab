function outputs = mynn(X, yxx)
    inputs = X';
    targets = yxx';
    
    % Create a Pattern Recognition Network
    hiddenLayerSize = 10;
    net = patternnet(hiddenLayerSize);

    % Setup Division of Data for Training, Validation, Testing
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;

    % Train the Network
    [net, ~] = train(net, inputs, targets);

    % Test the Network
    outputs = net(inputs);
end
