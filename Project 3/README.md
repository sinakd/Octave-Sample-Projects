# Airline Passenger Data Analysis (Octave)

## Overview

This project analyzes a small airline passenger dataset using GNU Octave. The goal is to practice fundamental Octave programming concepts, including file input/output, structure arrays, descriptive statistics, formatted output, and data visualization.

## Dataset

The dataset contains monthly airline passenger counts for three consecutive years (2010–2012). It is stored in a CSV file with two columns:

* **Month Index** (1–36)
* **Number of Passengers**

## Features

* Reads passenger data from a CSV file.
* Creates a **Structure Array** where each element represents one month with the following fields:

  * `year`
  * `month`
  * `passengers`
* Identifies the busiest and quietest months.
* Computes the average monthly passenger count for each year.
* Displays yearly averages using a **pie chart**.
* Visualizes the passenger distribution using a **histogram**.
* Saves all generated figures as **150 DPI PNG** images.
* Prints a brief interpretation of the histogram.

## Example Console Output

```text
================ Airline Passenger Statistics ================

Busiest Month
-------------
Year       : 2012
Month      : 7
Passengers : 199

Quietest Month
--------------
Year       : 2010
Month      : 11
Passengers : 104
```

## Generated Figures

The program automatically generates and saves:

* `yearly_average_passengers.png`
* `passenger_distribution.png`

## Concepts Demonstrated

* CSV file I/O
* Structure Arrays
* Loops
* Conditional indexing
* Descriptive statistics (`mean`, `max`, `min`)
* Formatted output (`fprintf`)
* Pie charts
* Histograms

## Requirements

* GNU Octave
* `airline_passengers.csv`

## How to Run

```octave
analyze_airline
```

## Notes

The histogram suggests a bimodal distribution, indicating seasonal variations in passenger traffic. Passenger counts tend to be lower during off-peak months and higher during peak travel seasons.
