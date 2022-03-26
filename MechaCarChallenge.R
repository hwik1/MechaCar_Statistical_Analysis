#Deliverable 1

library(dplyr) #load the dplyr package

mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) #read the csv

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table) #perform a multiple linear regression

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table)) #generate the summary statistics

# Deliverable 2
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) #read the csv

total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) #create a total summary dataframe

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create a lot summary dataframe to show statistics by manufacturing lot

#Deliverable 3
t.test(suspension_table$PSI,mu=1500) #use the t.test() function to determine if the PSI across all lots is statistically different from the pop mean

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot == "Lot1"),mu=1500) #repeat the t.test on each manufacturing lot (this is for Lot1)

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot == "Lot2"),mu=1500) #repeat the t.test on each manufacturing lot (this is for Lot2)

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot == "Lot3"),mu=1500) #repeat the t.test on each manufacturing lot (this is for Lot3)
