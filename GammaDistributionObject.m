% Generate a range of x values for the plot
x = linspace(0, 10, 100);

% Create gamma distribution objects
dist1 = makedist('Gamma');
dist2 = makedist('Gamma', 'a', 1, 'b', 2);
dist3 = makedist('Gamma', 'a', 2, 'b', 1);

% Compute CDFs for each distribution
cdf1 = cdf(dist1, x);
cdf2 = cdf(dist2, x);
cdf3 = cdf(dist3, x);

% Create a plot to visualize the CDFs
figure;
plot(x, cdf1, 'b', 'LineWidth', 2, 'DisplayName', 'Default Parameters');
hold on;
plot(x, cdf2, 'r', 'LineWidth', 2, 'DisplayName', 'α=1, β=2');
plot(x, cdf3, 'g', 'LineWidth', 2, 'DisplayName', 'α=2, β=1');
xlabel('x');
ylabel('CDF');
title('CDF of Gamma Distribution with Different Parameters');
legend;
grid on;
hold off;
