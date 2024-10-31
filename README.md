# Financial Data Visualization App

## Overview

This Flutter application visualizes financial data, specifically earnings and revenue information for various tickers. Users can interact with the charts to view detailed financial transcripts for specific data points. The application utilizes the `fl_chart` library for rendering beautiful and interactive line charts.

## Features

- **Interactive Charts**: Display estimated and actual earnings and revenue as line charts.
- **Data Point Interaction**: Users can tap on data points to view detailed information.
- **Dynamic Data Loading**: Fetches financial data based on the ticker provided by the user.

## Technologies Used

- **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Dart**: Programming language used for Flutter development.
- **fl_chart**: A library for creating beautiful charts in Flutter.
- **Provider**: A state management solution for Flutter applications.

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
2. **Navigate to the project directory:**
   cd your-repo-name
3. **Install the dependencies:**
   flutter pub get
## Usage
1. **Run the app on your device or emulator**:

      flutter run

2. **Enter a Ticker: Upon launching, enter the desired ticker symbol to fetch the financial data.**

3. **View Charts: Explore the interactive charts displaying estimated and actual earnings and revenue.**

4. **Interact with Data Points: Tap on any data point to view detailed financial transcripts related to that specific quarter.**


## Code Structure

**lib/:** Contains the main code of the application.

**controllers/:** Contains controllers for managing data logic.

**models/:** Data models representing financial data.

**provider/:** State management classes for fetching and holding data.

**views/:** UI components and pages, including SearchResultsPage that displays the charts.

## Demo Video
[Watch the demo video here](https://github.com/user-attachments/assets/0f6b8f6e-302b-4c9d-9638-b4cdf204a777)
