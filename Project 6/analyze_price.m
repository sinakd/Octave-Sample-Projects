clc
clear
close all

%% Read Prices from the File
price_table = csvread('commodity_price.csv');

%% Create a Structure Array
for k = 1:size(price_table, 1)
  daily_price(k).day = price_table(k, 1);
  daily_price(k).price = price_table(k, 2);
  daily_price(k).moving_avg = 0;
endfor

%% Calculating 7-Day Moving Average
% Set breakpoint on the line below for debugging
for k = 1:size(daily_price, 2)
  l = k:-1:k-6;
  c = l > 0;
  s = sum([daily_price(l(c)).price]);
  daily_price(k).moving_avg = s / sum(c);
endfor

%% Extract data for modeling (last 30 days)
last_30_days = daily_price(end-29:end);
x_data = [last_30_days.day];
y_data = [last_30_days.price];

%% Call the prediction function
[forecast_days, forecast_prices, poly_coeffs] = predict_future(x_data, y_data, 5);

%% Create the comprehensive plot
figure('Position', [100, 100, 1400, 700], 'Color', 'white');
hold on;

% Plot actual prices
all_days = [daily_price.day];
all_prices = [daily_price.price];
plot(all_days, all_prices, 'b-', 'LineWidth', 2, 'DisplayName', 'Actual Price');

% Plot moving average
all_moving_avg = [daily_price.moving_avg];
plot(all_days, all_moving_avg, 'r-', 'LineWidth', 2.5, 'DisplayName', '7-Day Moving Average');

% Plot fitted curve on last 30 days
x_fit = linspace(x_data(1), x_data(end), 100);
y_fit = polyval(poly_coeffs, x_fit);
plot(x_fit, y_fit, 'g-', 'LineWidth', 2.5, 'DisplayName', 'Fitted Curve (3rd Degree)');

% Plot forecast
plot(forecast_days, forecast_prices, 'm--', 'LineWidth', 2.5, 'Marker', 'o', ...
     'MarkerSize', 10, 'MarkerFaceColor', 'm', 'DisplayName', '5-Day Forecast');

% Customize the plot
xlabel('Day', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Price', 'FontSize', 14, 'FontWeight', 'bold');
title('Commodity Price Analysis and Forecast', 'FontSize', 16, 'FontWeight', 'bold');
grid on;

% Legend outside the plot on the right side
legend('Location', 'eastoutside', 'FontSize', 11, 'Box', 'on');

% Set axis limits to show all data properly
% Convert forecast_prices to row vector if needed
forecast_prices_row = forecast_prices(:)';  % Convert to row vector
all_prices_row = all_prices(:)';            % Ensure row vector
xlim([min(all_days)-2, max(forecast_days)+2]);
ylim([min(all_prices_row)-5, max([all_prices_row, forecast_prices_row])+5]);

hold off;

%% Print summary statistics
fprintf('\n===== Price Analysis Summary =====\n');
fprintf('Total days of data: %d\n', length(daily_price));
fprintf('Last price: %.2f\n', daily_price(end).price);
fprintf('7-day moving average: %.2f\n', daily_price(end).moving_avg);
fprintf('\n===== 5-Day Forecast =====\n');
for i = 1:length(forecast_days)
    fprintf('Day %d: $%.2f\n', forecast_days(i), forecast_prices(i));
end
fprintf('================================\n');

%% Save the plot as PNG with 300 DPI
set(gcf, 'PaperPositionMode', 'auto');
print('price_analysis_forecast.png', '-dpng', '-r300');
fprintf('\nPlot saved as "price_analysis_forecast.png" with 300 DPI\n');
