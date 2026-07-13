clc;
close all;
clear;

% Parameters
initial_val = 1000;
interest_rate = 0.20;
inflation_rate = 0.15;
n = 1:20;

% Simulation
result = simulate_investment(initial_val, ...
                             interest_rate, ...
                             inflation_rate, ...
                             length(n));

% Plot
figure;

plot(n, result(:,1), '-b', 'LineWidth', 2);
hold on;

plot(n, result(:,2), '--r', 'LineWidth', 2);

yline(initial_val, ':k', 'Initial Investment', 'LineWidth', 1.5);

grid on;
box on;

title('Investment Growth with Compound Interest and Inflation', ...
      'FontSize', 14);

xlabel('Year', 'FontSize', 12);
ylabel('Investment Value', 'FontSize', 12);

legend('Nominal Value', ...
       'Real Value', ...
       'Location', 'northwest');

set(gca, 'FontSize', 11);

print('investment_growth.png', '-dpng', '-r150');
