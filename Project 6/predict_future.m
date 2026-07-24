function [forecast_days, forecast_prices, poly_coeffs] = predict_future(x_data, y_data, num_days)
    % predict_future: Fits a 3rd-degree polynomial to the last 30 days
    % and forecasts the next 'num_days' days
    %
    % Inputs:
    %   x_data - days (last 30 days)
    %   y_data - prices (last 30 days)
    %   num_days - number of days to forecast
    %
    % Outputs:
    %   forecast_days - days for the forecast
    %   forecast_prices - predicted prices
    %   poly_coeffs - polynomial coefficients

    % Fit 3rd-degree polynomial
    poly_coeffs = polyfit(x_data, y_data, 3);

    % Generate forecast days (next 5 days after the last day)
    last_day = x_data(end);
    forecast_days = (last_day + 1):(last_day + num_days);
    forecast_days = forecast_days(:);  % Make column vector

    % Calculate forecast prices
    forecast_prices = polyval(poly_coeffs, forecast_days);
end
