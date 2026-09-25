-- Travel Booking Analytics & Demand Intelligence
-- Run after importing travel_booking_data_cleaned.csv into travel_analytics.travel_bookings.
-- Source: https://posit-academy.quarto.pub/data-gallery/academy-datasets/hotel-cancelations/index.html

USE travel_analytics;

-- 1. Core project KPIs
SELECT
    COUNT(*) AS total_bookings,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct,
    ROUND(AVG(adr), 2) AS average_adr,
    ROUND(AVG(stays_in_weekend_nights + stays_in_week_nights), 2) AS average_stay_nights
FROM travel_bookings;

-- 2. Monthly arrival demand and pricing indicators
SELECT
    DATE_FORMAT(STR_TO_DATE(arrival_date, '%Y-%m-%d'), '%Y-%m') AS arrival_month,
    COUNT(*) AS bookings,
    ROUND(AVG(adr), 2) AS average_adr,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct
FROM travel_bookings
GROUP BY arrival_month
ORDER BY arrival_month;

-- 3. Market segment booking volume and cancellation rate
SELECT
    market_segment,
    COUNT(*) AS bookings,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct
FROM travel_bookings
GROUP BY market_segment
ORDER BY cancellation_rate_pct DESC;

-- 4. Hotel type comparison
SELECT
    hotel,
    COUNT(*) AS bookings,
    ROUND(AVG(adr), 2) AS average_adr,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct
FROM travel_bookings
GROUP BY hotel
ORDER BY bookings DESC;

-- 5. Cancellation rate by booking lead time
SELECT
    CASE
        WHEN lead_time <= 7 THEN '0-7 days'
        WHEN lead_time <= 30 THEN '8-30 days'
        WHEN lead_time <= 90 THEN '31-90 days'
        WHEN lead_time <= 180 THEN '91-180 days'
        ELSE '181+ days'
    END AS lead_time_group,
    COUNT(*) AS bookings,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct
FROM travel_bookings
GROUP BY
    CASE
        WHEN lead_time <= 7 THEN '0-7 days'
        WHEN lead_time <= 30 THEN '8-30 days'
        WHEN lead_time <= 90 THEN '31-90 days'
        WHEN lead_time <= 180 THEN '91-180 days'
        ELSE '181+ days'
    END
ORDER BY MIN(lead_time);

-- 6. New versus repeat guest bookings
SELECT
    CASE WHEN is_repeated_guest = 1 THEN 'Repeat guest' ELSE 'New guest' END AS guest_type,
    COUNT(*) AS bookings,
    ROUND(AVG(is_canceled) * 100, 1) AS cancellation_rate_pct
FROM travel_bookings
GROUP BY is_repeated_guest
ORDER BY is_repeated_guest;
