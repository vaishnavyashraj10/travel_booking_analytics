# Travel Booking Analytics & Demand Intelligence

## Project overview

This portfolio project examines booking demand, cancellations, pricing indicators, and guest behavior for a **fictional travel-booking company**. It uses a real public hotel-booking dataset as a proxy for booking operations. The records are not from the fictional company or from any named travel company.

![Travel Booking Analytics dashboard preview](dashboard_preview.png)

## Dataset

The source is the [Hotel Booking Demand dataset in the Posit Academy Data Gallery](https://posit-academy.quarto.pub/data-gallery/academy-datasets/hotel-cancelations/index.html). It contains bookings due to arrive from July 2015 through August 2017. Customer and property identifiers were removed from the source dataset.

The supplied CSV contained **119,389 rows and 29 columns**. The cleaned project file contains **87,395 rows**.

## Cleaning

- Removed **31,994 exact duplicate rows**, keeping the first occurrence of each row.
- Filled the four missing `children` values with 0.
- Kept missing `country`, `agent`, and `company` values blank because they can be unknown or not applicable.
- Set the single negative `adr` value to blank so it does not affect pricing averages.
- Converted `arrival_date` and `reservation_status_date` to ISO date format (`YYYY-MM-DD`).
- Preserved zero-night stays and source categories such as `Undefined`.

## Tools and analysis

- **Python / pandas in Google Colab:** data inspection, cleaning, monthly summaries, and charts.
- **MySQL Workbench:** KPI, monthly demand, cancellation, market segment, hotel type, lead-time, and repeat-guest queries.
- **Excel:** KPI dashboard with monthly booking demand and cancellation by lead-time and market segment charts.

SQL queries are in [`travel_booking_analysis.sql`](travel_booking_analysis.sql).

## Key findings

- The cleaned data contains **87,395 bookings** and a **27.5% cancellation rate**.
- Average ADR is **106.28** and average stay length is **3.63 nights**. ADR is a daily-rate measure, not total booking revenue.
- Monthly demand peaked at **4,575 bookings in May 2017**. The dataset begins in July 2015, so the first calendar year is partial.
- **Online TA** had the most bookings (**51,618**) and a **35.3% cancellation rate**. This is an observed association; the dataset does not explain the cause.
- Cancellation rates rose across the lead-time groups, from **8.4%** for bookings made 0–7 days ahead to **39.7%** for bookings made 181 or more days ahead.
- Repeat-guest bookings had a **7.6% cancellation rate**, compared with **28.3%** for new-guest bookings.
- City Hotel bookings had a **30.0% cancellation rate** and average ADR of **110.89**. Resort Hotel bookings had a **23.5% cancellation rate** and average ADR of **99.03**.

## Files

- [`travel_booking_data_cleaned.csv`](travel_booking_data_cleaned.csv) — cleaned booking-level data.
- [`travel_booking_analytics_dashboard.xlsx`](travel_booking_analytics_dashboard.xlsx) — Excel dashboard and supporting analysis summaries.
- [`dashboard_preview.png`](dashboard_preview.png) — image preview of the dashboard charts.
- [`travel_booking_analysis.sql`](travel_booking_analysis.sql) — reusable MySQL analysis queries.

## Limitations

This is hotel booking data framed as a travel-company analytics case. It does not include flight bookings, customer identities, payments, or complete company revenue. The business scenario is fictional, and results should not be presented as internal findings from an actual travel platform. The source contains anonymized hotel and guest records, so relationships found here are descriptive, not causal.
