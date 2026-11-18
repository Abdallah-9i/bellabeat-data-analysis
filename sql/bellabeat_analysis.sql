-- Bellabeat Data Analysis
-- 1. Data Import Validation

-- Verify daily activity records and unique users
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT id) AS total_users
FROM public.daily_activity;

-- Verify sleep records and unique users
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT id) AS total_users
FROM public.sleep;