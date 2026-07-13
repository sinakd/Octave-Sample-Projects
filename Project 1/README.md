# Sports Performance Analyst (GNU Octave)

A GNU Octave project that analyzes athletes' performance using descriptive statistics, logical indexing, and data visualization.

---

## Project Overview

This project evaluates the performance of a group of athletes based on four different skills:

* Speed (km/h)
* Endurance (min)
* Strength (kg)
* Agility (score)

The program calculates descriptive statistics, identifies high-performing athletes, visualizes the data, and exports the mean values to a text file.

---

## Dataset

Each row of the matrix represents an athlete, and each column represents a performance metric.

| Column | Skill           |
| ------ | --------------- |
| 1      | Speed (km/h)    |
| 2      | Endurance (min) |
| 3      | Strength (kg)   |
| 4      | Agility (score) |

The athletes' names are stored separately in a cell array.

---

## Features

* Calculates descriptive statistics for each skill:

  * Mean
  * Median
  * Standard Deviation
* Prints a formatted statistical report using `fprintf`.
* Uses logical indexing to identify elite athletes.
* Creates multiple plots for performance analysis.
* Saves the mean values to a text file named `report.txt`.

---

## Elite Athlete Selection

The original challenge defines an elite athlete as someone whose performance is **above the mean in all four skills**.

Since no athlete in the provided dataset satisfies this condition, the implementation identifies athletes who perform **above the mean in at least three skills**.

---

## Visualizations

The script displays two figures:

1. A **bar chart** showing the mean value of each skill.
2. A second figure containing two subplots:

   * **Scatter plot:** Strength vs. Speed
   * **Bar chart:** Endurance values of all athletes

> **Note:** These figures are displayed on the screen only and are **not saved as image files**, as the project requirements only require saving the numerical report.

---

## Project Structure

```text
.
├── sports_analysis.m
├── report.txt
└── README.md
```

---

## Output

The script generates:

* A formatted statistical report in the Command Window.
* Two visualization figures.
* A text file named `report.txt` containing the mean values of the four skills.

---

## How to Run

Execute the script in GNU Octave:

```octave
sports_analysis
```

The script will:

1. Load the dataset.
2. Compute descriptive statistics.
3. Display the statistical report.
4. Identify elite athletes.
5. Display the charts.
6. Save the mean values to `report.txt`.

---

## Concepts Covered

* Scripts
* Matrices
* Cell Arrays
* Descriptive Statistics
* Logical Indexing
* Formatted Output (`fprintf`)
* Bar Charts
* Scatter Plots
* Subplots
* Saving Data to Text Files
