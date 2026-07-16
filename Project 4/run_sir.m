% Main Script for Epidemic Outbreak Modeler (Challenge 4) - Octave Version
clear all;
close all;
clc;

%% Parameters and Initial Conditions
N = 1000;          % Total population
S0 = 999;          % Initially susceptible
I0 = 1;            % Initially infected
R0 = N - S0 - I0;  % Initially recovered (0)

t_span = [0, 100]; % Time span in days
y0 = [S0; I0; R0]; % Initial state vector (column)

%% Solve the ODE system using ode45
[t, y] = ode45(@sir_model, t_span, y0);

%% Extract results
S = y(:, 1); % Susceptible population over time
I = y(:, 2); % Infected population over time
R = y(:, 3); % Recovered population over time

%% Plotting: Three vertical subplots with full labels
figure;

% Subplot 1: Susceptible
subplot(3, 1, 1);
plot(t, S, 'b', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Susceptible Population');
title('S(t) - Susceptible');
grid on;

% Subplot 2: Infected
subplot(3, 1, 2);
plot(t, I, 'r', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Infected Population');
title('I(t) - Infected');
grid on;

% Subplot 3: Recovered
subplot(3, 1, 3);
plot(t, R, 'g', 'LineWidth', 2);
xlabel('Time (days)');
ylabel('Recovered Population');
title('R(t) - Recovered');
grid on;

%% Save the figure as PNG with 150 DPI resolution
print('sir_plot.png', '-dpng', '-r150');
% Alternative: saveas(gcf, 'sir_plot.png'); % This uses default DPI

%% Analysis: Find the epidemic peak (maximum of I curve)
[I_max, idx] = max(I); % Maximum infected value and its index
t_peak = t(idx);       % Day when the peak occurs

% Print the result
fprintf('The epidemic peaks at day %.2f with %.2f infected individuals.\n', t_peak, I_max);

%% Data Output: Save results to a CSV file
data = [t, S, I, R];          % Combine into a matrix
csvwrite('sir_results.csv', data);

disp('Simulation completed. Results saved to sir_results.csv');
disp('Plot saved as sir_plot.png with 150 DPI resolution.');
