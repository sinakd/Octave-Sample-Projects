function dydt = sir_model(t, y)
    % SIR Model Differential Equations for Octave
    % y(1) = S (Susceptible), y(2) = I (Infected), y(3) = R (Recovered)

    beta = 0.0003; % Transmission rate
    gamma = 0.1;   % Recovery rate

    % Initialize output as a column vector
    dydt = zeros(3, 1);

    % Differential equations
    dydt(1) = -beta * y(1) * y(2);                 % dS/dt
    dydt(2) =  beta * y(1) * y(2) - gamma * y(2);  % dI/dt
    dydt(3) =  gamma * y(2);                       % dR/dt
end
