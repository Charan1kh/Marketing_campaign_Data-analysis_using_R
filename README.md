# Marketing_campaign_Data-analysis_using_R
_Marketing campaign data of 2,240 customers of Maven Marketing, including customer profiles, product preferences, campaign successes/failures, and channel performance. This data set is from maven analytics(data playground) - (Source: Jack Daoud, via Kaggle)_

## Project Overview
### 1. Data Loading and Cleaning
Reading the Data: The dataset is read from a CSV file.
Cleaning Income Data: The Income column is converted from character format (with special characters like $ and ,) to numeric format for accurate analysis.
Handling Missing Values: All rows with missing values are removed to ensure data integrity.
### 2. Outlier Identification and Visualization
Identifying Outliers: Outliers in various columns (e.g., NumWebVisitsMonth, NumStorePurchases, MntGoldProds, etc.) are identified to detect anomalies.
Plotting Outliers: Each identified outlier is visualized using plots to understand their distribution and impact on the dataset.
### 3. Data Aggregation
Creating New Features: New columns are created for total amounts spent (TotalMntSpent), total accepted campaigns (TotalAcceptedCmp), and total purchases (TotalNumPurchases).
Total Amount Spent: Sum of all product expenditures.
Total Accepted Campaigns: Sum of all accepted marketing campaigns.
Total Purchases: Sum of all types of purchases (deals, web, catalog, store).
### 4. Aggregated Analysis by Categories
By Education: Data is aggregated by Education to analyze income, total money spent, total purchases, and total accepted campaigns.
By Marital Status: Data is aggregated by Marital_Status to understand spending and campaign acceptance patterns.
By Country: Data is aggregated by Country to observe differences in consumer behavior across different regions.
### 5. Visualizing Campaign Success
By Marital Status: The success of marketing campaigns is visualized by Marital_Status using bar charts.
By Education: The effectiveness of campaigns is shown by Education level.
By Country: The success rate of campaigns is compared across different countries.
### 6. Product Performance Analysis
By Marital Status: The performance of different products (e.g., wines, fruits, meat products, etc.) is visualized by Marital_Status.
By Education: Product performance is compared across different education levels.
By Country: The sales of various products are analyzed by country.
## Conclusion
This project showcases how to effectively clean, analyze, and visualize data to uncover insights and patterns. The use of R and its libraries enables a comprehensive analysis of consumer behavior and marketing effectiveness.
