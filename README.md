# MechaCar Statistical Analysis
Module 15 challenge prepared by Hannah Wikum - March 2022

___
## Resources
Data Source: MechaCar_mpg.csv; Suspension_Coil.csv (both provided)

Software: R
___
## Overview
The purpose of this report is to summarize various statistical analyses performed in R on data from the MechaCar prototype for AutosRUs. In the first file, data was provided on vehicle length, weight, spoiler angle, ground clearance, AWD, and mpg for 50 different protoype MechaCars. I used that to build a multiple linear regression model to try to predict vehicle mpg. The second file containted data on PSI for suspension coils from various manufacturing lots. I used that data to create summary statistics (mean, median, variance, standard deviation) and ran a t-test to highlight lots that were not in compliance with design standards. Finally, I proposed ideas for an additional statistical test to compare MechaCar to the competition.

___
## Linear Regression to Predict MPG
The first deliverable for this challenge involved running multiple linear regresion on the 50 MechaCar prototypes to predict mpg from various design specifications (vehicle length, weight, spoiler angle, ground clearance, and AWD). I used the lm() function in R to run a multiple linear regression and a summary of the statistics. Below is an image of the results.

_Summary Statistics for Multiple Linear Regression_

![image](https://user-images.githubusercontent.com/93058069/160254790-9832926d-178a-49a8-b47e-d9956b9ed2f3.png)

Based on the summary statistics, both vehicle length and ground clearance were the most meaningful variables that provided a non-random amount of variance to the mpg values. The intercept also resulted in a statistically significant value that indicates it provides significant contribution to the model. (All three have extremely low Pr(>|t|) values, which predicts the likelihood that the coefficient is creating a random amount of variance to our multiple linear regression model.) Additionally, the slope of the linear model is not considered to be 0. When performing linear regressions, the null hypothesis is that the slope of the linear model is 0, which means that there is no significant linear relationship. The summary statistics on the multiple linear regression resulted in a p-value of 5.35e-11. That is much smaller than our statistically significant p-value of 0.05, which means there is such a small chance that the null hypothesis is correct that we can reject it and accept the alternate hypothesis that the slope is not equal to 0. Finally, the multiple r-squared is 0.7149, which means that 71.49% of the mpgs can be explained by the multiple linear regression model. The model is a good, but not perfect predictor of mpg.

## Summary Statistics on Suspension Coils
For the second deliverable of this challenge, I used data on suspension coils and R's summarize() and group_by() functions to view summary statistics. The Suspension_Coil.csv file contained data for vehicle ID, manufacturing lot, and the suspension coil's PSI. After importing and reading the csv file to R, I made two dataframes: the first showed mean, median, variance, and standard deviation for all of the data, while the second showed the same statistics but grouped by the three different manufacturing lots. Below are images of both dataframes with summary statistics for the total data and broken out by manufacturing lot.

_Total Summary DataFrame_

![image](https://user-images.githubusercontent.com/93058069/160254800-4d2254be-ea52-4d9a-a51f-c08fa37561b9.png)

_Lot Summary DataFrame_

![image](https://user-images.githubusercontent.com/93058069/160254803-2d8eea0b-cef4-4f27-9c8e-781ab7a039b7.png)

According to the MechaCar design specifications, the variance of the suspension coils must not exceed 100 pounds per square inch. The variance from all data (in the Total Summary DataFrame image above) is 62.29356 PSI, which is within the 100 PSI threshold. However, when you separate the data by manufacturing lot (as seen in the Lot Summary DataFrame image above), you can see that the first two lots are within the 100 PSI design specification, but manufacturing lot 3 is well above at 170.2861224.

## T-Tests on Suspension Coils
The third deliverable entailed using R's t.test() function to check if the mean of the suspension coil sample data is statistically different from the population mean of 1500 PSI. I performed two different t.tests: one on the PSI data for all manufacturing lots and a second that examined the results for each lot.

_Results of T-Test for All Lots_

![image](https://user-images.githubusercontent.com/93058069/160254811-51a6c8db-8853-4cdb-9631-1e41ac9a616e.png)

With a one-sided t-test, the null hypothesis is that there is no statistical difference between the mean of the sample data and mean of the population. The p-value from the t-test was 0.06028. That is above the typical signficance value of 0.05, so we cannot reject the null hypothesis. That means that there is no statistical difference between the mean of our test data and the population mean at 1500 PSI. 

Next, I used R's subset() function within the t-test to select PSI data for one lot at a time. Below is an image of teh results for lot 1.

_T-Test for Lot 1_

![image](https://user-images.githubusercontent.com/93058069/160254817-2e391517-00f4-41d6-9008-3d59f2f5f3cd.png)

The results for the t-test on lot 1 are very clear. The p-value was 1, which is so far above the normal signficance value of 0.05 that we can be very confident that the null hypothesis is true. If you go back to the the Lot Summary DataFrame image above, the mean for lot 1 was equal to 1500.00, which is equal to the given population mean as stated with the null hypothesis of a one-sided t-test.

_T-Test for Lot 2_

![image](https://user-images.githubusercontent.com/93058069/160254819-d6e1a81b-8ca9-4c97-81ff-f8b09c7927d2.png)

When repeating the subset of the t-test on lot 2, the p-value was 0.6072. That is high enough that we cannot reject the null hypothesis, so there is no statistical difference between the mean of the lot 2 PSI samples and the population mean.

_T-Test for Lot 3_

![image](https://user-images.githubusercontent.com/93058069/160254821-d7765efb-1122-494b-8f6d-14261101842d.png)

In deliverable 2, lot 3 is where we saw an unacceptably high PSI variance. The results of our t-test also differed from the total lot data and results for lots 1 and 2. The p-value for our t-test was 0.04168. That is significant because it is below 0.05, which gives us enough evidence to reject the null hypothesis. In this case, we accept the alternate hypothesis for a one-sided t-test which means that there **is** a statistical difference between the mean of the sample and the mean of the population.

## Study Design: MechaCar vs Competition
TO help AutoRUs benchmark MechaCar against competing vehicles, I would suggest doing a statistical study on crash safety ratings compared to vehicle weight. I would first identify a group of competing vehicles that are in the same class as MechaCar (i.e. medium passenger car) and then gather the vehicle weight and the overall crash test rating from the National Highway Traffic Safety Administration for each car. I would run a linear regression study on these data points for all cars within the class to see if it is possible to predict the crash safety rating from the vehicle weight. The null hypothesis for a linear regression would be that the slope of the linear model is 0 or that there is no significant linear relationship between vehicle weight and crash safety rating. The alternate hypothesis is that the slope of the linear model is not 0, so there is a linear relationship between the variables. This statistical study should not only reveal if there is correlation between vehicle weight and crash safety ratings, but will also reveal MechaCar's position on those two variables compared to the competition. It could also be interesting to do a second study using multiple linear regression on more variables (think number of airbags, number of advanced safety features, length/height of vehicle, etc.), in addition to vehicle weight to see which contributed the most to the model of predicting crash safety.
