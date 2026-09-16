--Session level conversion dataset
--Objective: To encode 1 for website session id which lead to a customer placing an order
--Grain: website_session_id
--Conversion definition: If a row from website sessions table matches a row in orders
--based on website_session_id then it will be considered converted and encoded as 1 else
--not converted and encoded as 0

SELECT
w.website_session_id,
w.user_id,
w.created_at,
w.utm_source,
w.utm_campaign,
w.utm_content,
w.device_type,
w.is_repeat_session,
CASE WHEN EXISTS(SELECT 1 FROM `mavins.orders` o WHERE w.website_session_id = o.website_session_id) THEN 1 ELSE 0 END as converted
FROM `mavins.website_sessions` w;

--original table count
SELECT
COUNT(*)
FROM `mavins.website_sessions`;

-- Creating a reusable working table for the session-level dataset
create table mavins.temp_website_sessions as 
 SELECT
w.website_session_id,
w.user_id,
w.created_at,
w.utm_source,
w.utm_campaign,
w.utm_content,
w.device_type,
w.is_repeat_session,
CASE WHEN EXISTS(SELECT 1 FROM `mavins.orders` o WHERE w.website_session_id = o.website_session_id) THEN 1 ELSE 0 END as converted
FROM `mavins.website_sessions` w;

-- Validation : Check that session IDs are unique and row count is preserved
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT website_session_id) AS unique_sessions
FROM mavins.temp_website_sessions;



--checking distribution of converted vs not converted
SELECT
converted,COUNT(*)
FROM mavins.temp_website_sessions
GROUP BY converted;

--Finding conversion rate
SELECT
AVG(converted)
FROM mavins.temp_website_sessions;

--which campaigns had the highest conversion rates?
SELECT
utm_campaign,COUNT(*) total_sessions,ROUND(AVG(converted)*100,4) conversion_rate
FROM `mavins.temp_website_sessions`
GROUP BY utm_campaign
ORDER BY conversion_rate DESC;


--Which acquisition sources have the highest conversion rates?
--Finding conversion rates of utm_sources
SELECT
utm_source,COUNT(*) total_sessions,SUM(converted)converted_,ROUND(SUM(converted)/COUNT(*)*100,4) conversion_rate
FROM `mavins.temp_website_sessions`
GROUP BY utm_source
ORDER BY conversion_rate DESC;

--which content had the highest conversion rates?

SELECT
utm_content,ROUND(AVG(converted)*100,4) conversion_rate
FROM `mavins.temp_website_sessions`
GROUP BY utm_content
ORDER BY conversion_rate DESC;

--How many users out of the total that visited the website actually purchased something.
SELECT
(SELECT
COUNT(DISTINCT(user_id))
FROM mavins.temp_website_sessions
WHERE converted = 1)/COUNT(DISTINCT(user_id))*100
FROM mavins.temp_website_sessions;
