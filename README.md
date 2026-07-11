### Challenge 1: Sports Performance Analyst (Beginner-Intermediate)
**Concepts Covered:** Scripts, Matrices, Logical Indexing, Descriptive Statistics, `bar` and `plot` graphs.

**Story:** You are a team coach with a matrix of athlete records. You need to analyze their performance.

**Data (Build it yourself in the code):**
```octave
% Each row is an athlete, each column a skill: Speed(km/h), Endurance(min), Strength(kg), Agility(score)
athletes_data = [
    28, 45, 120, 8;
    32, 40, 135, 9;
    25, 55, 110, 7;
    35, 38, 140, 9;
    22, 50, 105, 6;
    30, 42, 128, 8;
    27, 48, 115, 7;
    33, 35, 145, 10
];
athletes_names = {'Ali', 'Reza', 'Sara', 'Maryam', 'Hassan', 'Zahra', 'Amir', 'Neda'}';
```

**Tasks:**
1.  Create a script `sports_analysis.m` to analyze this matrix.
2.  **Descriptive Statistics:** Calculate the mean, median, and standard deviation for each skill and print a readable report in the Command Window using `fprintf`.
3.  **Conditional Analysis:** Using logical indexing, find the names of "elite athletes" who are above the mean in **all** skills. Print their names.
4.  **Visualization:**
    - Plot a `bar` chart of the means for the four skills (with title and labels).
    - Open a new `figure` and use `subplot` to display a `scatter` plot of Strength vs. Speed for all athletes, and a `bar` chart of the "Endurance" record for all athletes, side-by-side.
5.  **Save Results:** Save the analysis report (the mean values) to a file named `report.txt` using the `save` command.

---

### Challenge 2: Investment Simulator (Intermediate)
**Concepts Covered:** Functions, `for` Loops, Element-wise Operations, `plot` Graphs, Saving Figures.

**Story:** You want to simulate the growth of an investment with compound interest and see how inflation erodes your money.

**Data (Parametric):** Initial amount: 1000 (in your currency), Annual interest: 20%, Annual inflation: 15%, Duration: 20 years.

**Tasks:**
1.  Write a **function** named `simulate_investment.m` that takes four input arguments: `initial_amount`, `interest_rate`, `inflation_rate`, and `years`.
2.  Inside the function, use a `for` loop to calculate the nominal value and the real value (adjusted for inflation) of the investment year by year. (Try to use a loop for practice, even if vectorization is possible).
3.  **Function Output:** An `N_years x 2` matrix where the first column is nominal value and the second is real value.
4.  In a separate script, call the function for a 20-year investment.
5.  **Plot:** Plot the nominal and real values with two different colors and styles on a single `plot`. Add a horizontal line (`yline`) for the initial investment. Add a complete title, legend, and axis labels.
6.  Save the final plot as a high-quality `investment_growth.png` file using `-r150`.

---

### Challenge 3: Real-World Data Analysis (Intermediate)
**Concepts Covered:** File I/O (CSV), Working with Structures, Descriptive Statistics, `fprintf`, `pie` and `histogram` plots.

**Data:** We'll use the classic `airline_passengers.csv` dataset. **Create it yourself using Octave code:**
```octave
% Create a sample CSV file (monthly airline passengers, 2010-2012)
months = (1:36)';
passengers = [112, 118, 132, 129, 121, 135, 148, 148, 136, 119, 104, 118, ...
              115, 126, 141, 135, 125, 149, 170, 170, 158, 133, 114, 140, ...
              145, 150, 178, 163, 172, 178, 199, 199, 184, 162, 146, 166]';
data_table = [months, passengers];
csvwrite('airline_passengers.csv', data_table);
```

**Tasks:**
1.  **Read File:** Load the CSV file using `csvread` or `dlmread`.
2.  **Advanced Data Structure (Struct):** Create a Structure Array where each element represents a month with fields `year`, `month`, and `passengers`. (Hint: extract month and year from the 1-36 index using `mod` and `floor`).
3.  **Analysis:** Find the busiest and quietest months (based on passenger count) and print their names using `fprintf`.
4.  **Annual Statistics:** Calculate the mean passengers for each year (2010, 2011, 2012) and display the share of each year in a `pie` chart.
5.  **Distribution:** Plot a `histogram` of the passenger numbers and use `fprintf` to comment on what the distribution looks like (e.g., it appears bimodal, suggesting seasonality).

---

### Challenge 4: Epidemic Outbreak Modeler (Intermediate-Advanced)
**Concepts Covered:** Solving Ordinary Differential Equations (`ode45`), Anonymous Functions, Multiple Plots (`subplot`), Function Workspace.

**Story:** The famous SIR (Susceptible-Infected-Recovered) model for a disease outbreak.

**Mathematical Model (Parametric Data):**
Differential Equations:
dS/dt = -β * S * I
dI/dt = β * S * I - γ * I
dR/dt = γ * I
Where S: Susceptible, I: Infected, R: Recovered population.
Parameters: β=0.0003 (transmission rate), γ=0.1 (recovery rate). Total population N=1000. Initially, 1 infected person (I0=1), 999 susceptible (S0=999), and 0 recovered.

**Tasks:**
1.  Define a **function** `sir_model.m` that returns the ODEs in a format suitable for `ode45`. (Function inputs: `t` and vector `y` where `y(1)=S, y(2)=I, y(3)=R`).
2.  In a separate script, define the parameters and use `ode45` to simulate the system for 100 days.
3.  **Main Plot:** Create a `figure` with three vertical `subplot`s:
    - S(t) graph
    - I(t) graph
    - R(t) graph
    All three plots should be fully labeled.
4.  **Analysis:** Using the `ode45` output, find the day the epidemic peaks (maximum of the I curve) and the number of infected people at that peak. Print it with `fprintf`. (Hint: use the `max` function).
5.  **Data Output:** Save the matrix `[t, S, I, R]` to a `sir_results.csv` file using `csvwrite`.

---

### Challenge 5: Audio Signal Processor (Advanced)
**Concepts Covered:** Complex Functions, FFT (using built-in functions), Matrix Operations, `plot`, File Management.

**Story:** Generate and analyze a composite audio signal to find its constituent frequencies.

**Data (Build the signal yourself):**
```octave
Fs = 1000;            % Sampling frequency (1 kHz)
t = 0:1/Fs:2;         % Time vector for 2 seconds
% Composite signal with 50Hz and 120Hz pure tones + random noise
signal = 0.7*sin(2*pi*50*t) + 1.0*sin(2*pi*120*t) + 0.5*randn(size(t));
```

**Tasks:**
1.  **Generate Signal:** Run the code above to create the `t` and `signal` vectors.
2.  **Save and Retrieve:** Save the `signal` vector to a binary `.mat` file (using `save`). Clear the Workspace (`clear all`) and then retrieve it using `load`.
3.  **Fourier Analysis:** Compute the FFT. Calculate the frequency vector using `linspace` or `(0:N-1)*(Fs/N)`. (Note: for plotting, consider only the first half of the spectrum).
4.  **Visualization:** In a single `figure` with two `subplot`s:
    - **Top:** The signal in the time domain for the first 0.5 seconds (`t` from 0 to 0.5).
    - **Bottom:** The magnitude spectrum (Fourier Transform). Fully label the title and axes.
5.  **Peak Detection:** Using the `findpeaks` function or logical indexing, identify the two dominant frequencies (50 and 120 Hz) in the spectrum and mark them on the plot with a red circle marker (`'ro'`). Print a message confirming the frequencies were found.

---

### Challenge 6: Final Project - Price Analysis & Forecasting (Very Advanced)
**Concepts Covered:** All course topics! File Reading, Data Structures, Functions, Curve Fitting (`polyfit`), Advanced Plotting, Optimization, and Debugging.

**Story:** We have a CSV file of historical commodity prices. We want to analyze, model, and forecast it.

**Data:** Suggested site: **Kaggle** (search for a simple gold or oil price CSV) **OR** create a trending dataset with noise yourself in Octave:
```octave
% Create a random price dataset with an upward trend and noise (like a stock price)
t = (1:100)';
trend = 0.1 * t + 50;                % Linear upward trend
seasonality = 5 * sin(2*pi*t/12);   % Seasonal fluctuation
noise = 3 * randn(100, 1);          % Random noise
price = trend + seasonality + noise;
% Add a sudden "crash" like a market shock
price(70:75) = price(70:75) - 15;
csvwrite('commodity_price.csv', [t, price]);
```

**Tasks:**
1.  **Load and Explore:** Read the file. Write an analysis script.
2.  **Data Structure:** Store the data in a structure array (`struct`) with the fields `day`, `price`, and `moving_avg` (to be filled later).
3.  **Pre-processing:** Calculate a 7-day moving average (`moving_avg`) and store it in the corresponding structure field. **Use a `for` loop for this task** (for practice, although using `filter` is easier).
4.  **Modeling & Forecasting:**
    - Write a `predict_future` function that takes the last 30 days of data, fits a 3rd-degree polynomial to it (`polyfit`), and forecasts the price for the next 5 days.
    - This function must have its own isolated local workspace.
5.  **Final Visualization (Advanced):**
    - Create a comprehensive plot using `hold on` showing: the actual price, the 7-day moving average, and the fitted curve on the last 30 days.
    - Add the 5-day forecast on the same plot with a different dashed line and markers.
    - Place a complete `legend` for all 4 items on the graph.
6.  **Debugging:** Intentionally set a Breakpoint on the line of code that calculates the moving average. Run the program in debug mode, inspect the values in the Workspace, and then press `F5` to continue to successful completion.

---

**Suggested Data Sources for Future Projects:**
- **Kaggle:** The largest dataset repository (look for simple CSVs: "gold price CSV").
- **UCI Machine Learning Repository:** Classic scientific datasets like Iris, Wine.
- **Data.gov or data.world:** Public and governmental datasets.
