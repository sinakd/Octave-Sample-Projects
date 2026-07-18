clc;
clear;
close all;

%% Read data from CSV file
data_table = csvread('airline_passengers.csv');

%% Create a structure array
for k = 1:size(data_table, 1)
    index = data_table(k, 1);

    monthly_data(k).year = floor((index - 1) / 12) + 2010;
    monthly_data(k).month = mod(index - 1, 12) + 1;
    monthly_data(k).passengers = data_table(k, 2);
end

%% Find the busiest and quietest months
[~, max_idx] = max([monthly_data.passengers]);
[~, min_idx] = min([monthly_data.passengers]);

busiest_month = monthly_data(max_idx);
quietest_month = monthly_data(min_idx);

fprintf('================ Airline Passenger Statistics ================\n\n');

fprintf('Busiest Month\n');
fprintf('-------------\n');
fprintf('Year       : %d\n', busiest_month.year);
fprintf('Month      : %d\n', busiest_month.month);
fprintf('Passengers : %d\n\n', busiest_month.passengers);

fprintf('Quietest Month\n');
fprintf('--------------\n');
fprintf('Year       : %d\n', quietest_month.year);
fprintf('Month      : %d\n', quietest_month.month);
fprintf('Passengers : %d\n\n', quietest_month.passengers);

%% Calculate the average passenger count for each year
years = [monthly_data.year];
unique_years = unique(years);
years_mean = zeros(1, length(unique_years));

for k = 1:length(unique_years)
    year = unique_years(k);

    months = years == year;
    year_data = monthly_data(months);

    years_mean(k) = mean([year_data.passengers]);
end

%% Pie chart of yearly average passengers
labels = arrayfun(@num2str, unique_years, 'UniformOutput', false);

figure('Name', 'Yearly Average Passengers');
set(gcf, 'Position', [100 100 800 600]);

pie(years_mean, labels);
title('Average Monthly Passengers by Year');
axis equal;

print('yearly_average_passengers.png', '-dpng', '-r150');

%% Histogram of passenger distribution
figure('Name', 'Passenger Distribution');
set(gcf, 'Position', [100 100 800 600]);

hist([monthly_data.passengers], 8);

title('Distribution of Monthly Passenger Counts');
xlabel('Number of Passengers');
ylabel('Frequency');
grid on;

print('passenger_distribution.png', '-dpng', '-r150');

%% Histogram interpretation
fprintf('Histogram Interpretation\n');
fprintf('------------------------\n');
fprintf(['The histogram is not perfectly symmetric. ', ...
         'It appears to be bimodal, suggesting seasonal variations ', ...
         'in passenger traffic. Lower passenger counts occur during ', ...
         'off-peak months, while higher passenger counts are observed ', ...
         'during peak travel seasons.\n']);
