function result = simulate_investment (initial_amount, interest_rate, inflation_rate, years)
  nominal_val = initial_amount * (1 + interest_rate);
  real_val = nominal_val / (1 + inflation_rate);
  result = zeros(years, 2);
  result(1, :) = [nominal_val, real_val];
  for n = 2:years
    nominal_val = result(n - 1, 1) * (1 + interest_rate);
    real_val = result(n - 1, 2) * (1 + interest_rate) / (1 + inflation_rate);
    result(n, :) = [nominal_val, real_val];
  endfor
endfunction
