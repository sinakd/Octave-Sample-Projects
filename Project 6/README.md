# Commodity Price Analysis & Forecasting

## 📊 Project Overview
This project implements a price analysis and forecasting system for commodity prices (gold, oil, etc.). The system reads historical price data, calculates moving averages, fits polynomial models, generates forecasts, and creates professional visualizations.

## 🎯 Features
- CSV file reading for historical price data
- 7-day moving average calculation
- 3rd-degree polynomial fitting on the last 30 days of data
- 5-day price forecasting
- Comprehensive visualization including historical prices, moving average, fitted curve, and forecast
- High-resolution PNG export (300 DPI)
- Summary statistics output to console

## 🛠️ Requirements
- **Octave** (version 4.0 or higher) or **MATLAB** (R2016b or higher)
- No additional toolboxes required

## 📁 File Structure
```
├── analyze_price.m          # Main analysis script
├── predict_future.m         # Forecasting function
├── commodity_price.csv      # Input data file
└── price_analysis_forecast.png  # Generated output plot
```

## 🚀 Getting Started

### 1. Data Preparation
Create a CSV file named `commodity_price.csv` with two columns:
- Column 1: Day number (1, 2, 3, ...)
- Column 2: Price values

### 2. Run the Analysis
```matlab
analyze_price
```

### 3. View Results
- The plot will display automatically
- Summary statistics appear in the console
- The plot is saved as `price_analysis_forecast.png`

## 📈 Visualization Components
- **Blue Line**: Actual historical prices
- **Red Line**: 7-day moving average
- **Green Line**: Fitted 3rd-degree polynomial (last 30 days)
- **Magenta Dashed Line**: 5-day forecast with markers

## 📝 Notes
- The script automatically handles variable data lengths
- Forecast accuracy depends on data quality and market conditions
- The polynomial model works best for short-term predictions
- For production use, consider more sophisticated models (ARIMA, LSTM, etc.)
