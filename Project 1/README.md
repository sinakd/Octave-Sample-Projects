# Sports Performance Analyst (GNU Octave)

A GNU Octave project for analyzing athletes' performance using descriptive statistics, logical indexing, and data visualization.

---

## Project Overview

This project analyzes the performance records of a group of athletes based on four different skills:

* Speed (km/h)
* Endurance (min)
* Strength (kg)
* Agility (score)

The program computes descriptive statistics, identifies elite athletes based on their overall performance, visualizes the results, and exports the average values to a text file.

---

## Dataset

Each row represents one athlete, while each column represents one skill.

| Column | Skill           |
| ------ | --------------- |
| 1      | Speed (km/h)    |
| 2      | Endurance (min) |
| 3      | Strength (kg)   |
| 4      | Agility (score) |

The athlete names are stored separately in a cell array.

---

## Features

* Computes descriptive statistics:

  * Mean
  * Median
  * Standard Deviation
* Displays a formatted statistical report in the Command Window.
* Uses logical indexing to identify elite athletes.
* Generates multiple visualizations.
* Saves the calculated mean values to a text file.

---

## Elite Athlete Selection

The original challenge defines an elite athlete as one whose performance is **above the mean in all four skills**.

With the provided dataset, **no athlete satisfies this condition**.

Therefore, the implementation identifies athletes whose performance is **above the mean in at least three of the four skills**.

---

## Visualizations

The program generates two figures:

### 1. Mean Performance of Each Skill

A bar chart comparing the average values of:

* Speed
* Endurance
* Strength
* Agility

### 2. Athlete Performance

A second figure containing two subplots:

* **Scatter Plot:** Strength vs. Speed
* **Bar Chart:** Endurance values for all athletes

---

## Project Structure

```text
.
├── sports_analysis.m
├── report.txt
├── mean_skills_bar.png
├── athlete_performance.png
└── README.md
```

> If the figures are saved as images, they can be displayed below.

### Mean Skill Values

![Mean Skill Values](mean_skills_bar.png)

### Athlete Performance

![Athlete Performance](athlete_performance.png)

---

## Output Files

| File                      | Description                                       |
| ------------------------- | ------------------------------------------------- |
| `report.txt`              | Mean values of the four skills                    |
| `mean_skills_bar.png`     | Average skill bar chart *(optional)*              |
| `athlete_performance.png` | Scatter plot and endurance bar chart *(optional)* |

---

## How to Run

Run the script in GNU Octave:

```octave
sports_analysis
```

The script will:

1. Compute descriptive statistics.
2. Display a formatted report.
3. Identify elite athletes.
4. Generate the plots.
5. Save the mean values to `report.txt`.

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
