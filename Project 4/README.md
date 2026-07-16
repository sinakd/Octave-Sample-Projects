```markdown
# 🦠 Epidemic Outbreak Modeler (Challenge 4)

A numerical simulation of the classic **SIR (Susceptible-Infected-Recovered)** epidemic model using ordinary differential equations.  
This project was completed as part of a coding challenge, demonstrating the use of `ode45`, anonymous functions, multiple subplots, and data export in MATLAB/GNU Octave.

---

## 📚 Table of Contents
- [Mathematical Model](#mathematical-model)
- [Project Structure](#project-structure)
- [Implementation Details](#implementation-details)
- [Tasks Completed](#tasks-completed)
- [Results](#results)
- [How to Run](#how-to-run)
- [Output Files](#output-files)
- [Example Console Output](#example-console-output)
- [Dependencies](#dependencies)

---

## 🧮 Mathematical Model

The SIR model splits a fixed population of **N = 1000** into three compartments:

| Compartment | Description | Initial Value |
|-------------|-------------|---------------|
| **S** | Susceptible | 999 |
| **I** | Infected    | 1   |
| **R** | Recovered   | 0   |

The dynamics are governed by the following system of first-order ODEs:

```
dS/dt = -β · S · I
dI/dt =  β · S · I - γ · I
dR/dt =  γ · I
```

**Parameters:**
- Transmission rate **β = 0.0003**
- Recovery rate **γ = 0.1**

---

## 📁 Project Structure

```
├── sir_model.m         # Function defining the ODE system
├── run_sir.m           # Main script (parameters, ode45, plots, analysis, export)
├── sir_results.csv     # Exported time series data [t, S, I, R]
├── sir_plot.png        # Saved figure with three subplots (150 DPI)
└── README.md           # This file
```

---

## ⚙️ Implementation Details

### 1. ODE Function – `sir_model.m`
- Takes time `t` and state vector `y = [S; I; R]`.
- Returns `dydt` as a column vector according to the SIR equations.
- Parameters `beta` and `gamma` are hardcoded inside the function (as required by the challenge).

```matlab
function dydt = sir_model(t, y)
    beta = 0.0003;
    gamma = 0.1;
    dydt = zeros(3,1);
    dydt(1) = -beta * y(1) * y(2);
    dydt(2) =  beta * y(1) * y(2) - gamma * y(2);
    dydt(3) =  gamma * y(2);
end
```

### 2. Main Script – `run_sir.m`
- Defines initial conditions and time span (`0` to `100` days).
- Solves the ODE system using `ode45`.
- Extracts `S`, `I`, `R` from the solution matrix.
- Creates a figure with **three vertically stacked subplots**, each fully labeled.
- Saves the plot as `sir_plot.png` with 150 DPI.
- Locates the epidemic peak using `max(I)` and prints the day and peak value.
- Exports the full time series to `sir_results.csv` using `csvwrite`.

---

## ✅ Tasks Completed

- [x] Define `sir_model.m` with the correct ODE format for `ode45`.  
- [x] Set up parameters and solve the system for 100 days in a separate script.  
- [x] Generate three subplots: **S(t)**, **I(t)**, **R(t)** with titles, axis labels, and grid.  
- [x] Find and print the epidemic peak (maximum of the `I` curve) using `max`.  
- [x] Save the simulation results `[t, S, I, R]` to a CSV file.  

---

## 📊 Results

The simulation clearly shows the progression of an epidemic:

- **Susceptible** population declines as individuals become infected.
- **Infected** count rises to a peak and then falls as recovery dominates.
- **Recovered** population grows and eventually reaches the total population (everyone recovers in this simplified model).

The peak of the epidemic (maximum number of infected individuals) is automatically computed and displayed.  
The exported `sir_results.csv` contains the full daily values for further analysis.

### 📈 Generated Plot (`sir_plot.png`)

![SIR Simulation Plot](sir_plot.png)

*Three subplots: S(t) in blue, I(t) in red, R(t) in green.*

---

## 🚀 How to Run

1. **Clone the repository** or copy the files into your working directory.
2. Open **MATLAB** or **GNU Octave**.
3. Run the main script:
   ```matlab
   run_sir
   ```
4. The console will display:
   - The day of the epidemic peak and the number of infected at that peak.
   - Confirmation that `sir_results.csv` and `sir_plot.png` have been saved.

---

## 📦 Output Files

| File | Description |
|------|-------------|
| `sir_results.csv` | Matrix of `[t, S, I, R]` for all time steps. |
| `sir_plot.png`    | High-resolution figure with the three subplots (150 DPI). |

---

## 💬 Example Console Output

```
The epidemic peaks at day 39.05 with 300.53 infected individuals.
Simulation completed. Results saved to sir_results.csv
Plot saved as sir_plot.png with 150 DPI resolution.
```

---

## 🛠️ Dependencies

- **MATLAB** (R2015b or later) **or** **GNU Octave** (≥ 4.0)
- No additional toolboxes are required. The code uses only built-in functions: `ode45`, `csvwrite`, `plot`, `subplot`, `fprintf`, `max`.

---

*Challenge 4 – Epidemic Outbreak Modeler  
Concepts: Solving ODEs (ode45), function workspaces, subplot, data export.*
```
