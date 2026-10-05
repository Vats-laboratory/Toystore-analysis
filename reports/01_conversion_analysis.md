# Conversion Analysis

## Objective

To understand what affects the conversion rate and leads to sale conversions from 
website sessions.

## Business Questions

1. What is the overall session-to-order conversion rate?
2. Which traffic sources have the highest conversion rates?
3. Which campaigns/content have the highest conversion rates?
4. Does conversion rate differ by device type?

## Insights

### Overall Conversion
- It was found that onlt 6.8% of the total website sessions lead to a order placement
- Percent of users who ordered something  out of total unique users who visited was 8.3%    
  indicating some users visited the site multiple times before making a purchase.

### Traffic Sources
- bsearch: Accounted for 62823 acquisitions(website_sessions),4519 conversions with	7.1932%
  conversion rate
- gsearch: Accounted for 316035 website_sessions,21333 conversions with 6.7502%
  conversion rate
- socialbook: Accounted for 10685 website_sessions,343 conversions with 3.2101%

### Campaigns and Content
- brand: Accounted for 41243 acquisitions(website_sessions), with 7.788%
  conversion rate
- nonbrand: Accounted for 337615 website_sessions with 6.7059%
  conversion rate
- desktop_targeted: Accounted for 5590 website_sessions with 5.1521%
  conversion rate
- pilot: Accounted for 5095 website_sessions with 1.0795%
  conversion rate



### Device Type
- Desktop accounted for 327,027 website      
  sessions (69.2% of total sessions), compared with 145,844 mobile sessions (30.8%).
- Desktop generated 27,805 conversions, 
  accounting for approximately 86.1% of all conversions, while mobile generated 4,508 conversions (13.9%).
- The desktop conversion rate was  
  approximately 8.50%, substantially higher than the mobile conversion rate of approximately 3.09%.
- Although mobile represented 30.8% of total 
  website sessions, it contributed only 13.9% of total conversions, indicating a substantial difference in conversion performance between the two device types.
- Desktop sessions converted at approximately 
  2.75× the rate of mobile sessions (8.50% vs. 3.09%).
- Overall, the dataset contains 472,871  
  website sessions and 32,313 conversions, giving an overall conversion rate of approximately 6.83%.

### Data Quality
- Dataset contains 472871 entries.
- 17.62% values are missing in columns utm_source,utm_campaign,  
  utm_content which accounts for 83328 rows
- These records were retained since they comprise of sizable data 
  and other features values of these rows are valuable for non utm_content,utm_campaign,utm_source analysis
- For acquisition source analysis these rows will be treated   
  separately.

## Statistical Analysis

### Traffic Source vs Conversion
- NUll Hypotheses: Traffic source and conversion rate is not associated.
- Alternate Hypothesis: Traffic source and conversion rate is associated.
- Significance level: 0.05
- Test: Chi-square test of independence
- Result: Chi2ContingencyResult(statistic=np.float64(232.73750897190575), pvalue=np.float64(2.8952899363727394e-51), dof=2, expected_freq=array([[ 58598.43818012,   4224.56181988],
       [294783.07960867,  21251.92039133],
       [  9966.48221121,    718.51778879]]))
- Conclusion: pvalue less than significance level hence reject Null hypothesis therefore Traffic source and conversion rates are associated.

### Device Type vs Conversion
- Null Hypotheses: Device type and conversion rates are not associated.
- Alternate Hypothesis: Device type and conversion rates are associated.
- Test: Chi-square test of independence
- Significance level: 0.05
- Result: Chi2ContingencyResult(statistic=np.float64(4638.433375968806), pvalue=np.float64(0.0), dof=1, expected_freq=array([[304680.05241599,  22346.94758401],
       [135877.94758401,   9966.05241599]]))
- Conclusion: Pvalue less than significance level hence rejecting null hypothesis therefore Device type and conversion rates are associated as well.
