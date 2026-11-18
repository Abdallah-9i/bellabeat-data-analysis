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


-- 2. Sleep Tracking Consistency

-- Calculate sleep tracking rate for each user
SELECT
    a.id,
    COUNT(*) AS activity_days,
    COUNT(s.sleepday) AS sleep_days,
    ROUND(
        COUNT(s.sleepday) * 100.0 / COUNT(*), 2
    ) AS sleep_tracking_rate_pct
FROM public.daily_activity AS a
LEFT JOIN public.sleep AS s
    ON a.id = s.id
    AND a.activitydate = s.sleepday
GROUP BY a.id
ORDER BY sleep_tracking_rate_pct DESC;


-- Compare activity across sleep tracking groups
WITH user_tracking AS (
    SELECT
        a.id,
        COUNT(*) AS activity_days,
        COUNT(s.sleepday) AS sleep_days,
        AVG(a.totalsteps) AS avg_daily_steps
    FROM public.daily_activity AS a
    LEFT JOIN public.sleep AS s
        ON a.id = s.id
        AND a.activitydate = s.sleepday
    GROUP BY a.id
),
tracking_groups AS (
    SELECT
        *,
        CASE
            WHEN sleep_days = 0 THEN 'No Sleep Records'
            WHEN sleep_days = activity_days THEN 'Complete Coverage'
            ELSE 'Partial Coverage'
        END AS tracking_group
    FROM user_tracking
)
SELECT
    tracking_group,
    COUNT(*) AS total_users,
    ROUND(AVG(avg_daily_steps), 2) AS avg_daily_steps
FROM tracking_groups
GROUP BY tracking_group
ORDER BY total_users DESC;


-- Sleep tracking coverage by day of week
SELECT
    TRIM(TO_CHAR(a.activitydate, 'Day')) AS day_of_week,
    COUNT(*) AS activity_records,
    COUNT(s.sleepday) AS matched_sleep_records,
    ROUND(
        COUNT(s.sleepday) * 100.0 / COUNT(*), 2
    ) AS sleep_tracking_rate_pct
FROM public.daily_activity AS a
LEFT JOIN public.sleep AS s
    ON a.id = s.id
    AND a.activitydate = s.sleepday
GROUP BY
    EXTRACT(ISODOW FROM a.activitydate),
    TRIM(TO_CHAR(a.activitydate, 'Day'))
ORDER BY
    EXTRACT(ISODOW FROM a.activitydate);

