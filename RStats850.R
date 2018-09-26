# Biology 850 Workshop on Basic statistical Analyses
# Jon Sweetman, Sept26,2018 jon.sweetman@ndsu.edu

# Libraries - space to call libraries used in this script
library(tidyverse) #includes ggplot2 and more..

setwd("/temp_data/tutorial-850")

# we will use some simple example data 
sitedata <- read.csv("sitedata.csv")  # read data

## Calculating sumary statistics - example
x <- rnorm(50)  # creates a vector of 50 normally distributed observations
mean(x)   # calculates the mean of x
sd(x)     # calculates the standard deviation of x
var(x)    # calculates the variance of x
median(x) # calculates the median calue of x

quantile (x) # obtains the quantiles for x

# what about shen we have missing values? (NA)
y <- c(11,-3,NA,56,5,NA,12) #here we create a vector with NA values
mean(y)   # we get a NA returned when we use this function
mean(y,na.rm=T)  # add the na.rm argument
summary(y) #produces a summary of descriptive variables for y

#if you haven't read in the sitedata.csv file above, you should do so
summary(sitedata)  #provides a summary of the whole data frame

## Conducting t-tests
pop1 <- rnorm(30, mean=3, sd=2)  #create a vector of 30 normally distributed observations with mean~3, sd~2
pop2 <- rnorm(30, mean=10, sd=5) #create a vector of 30 normally distributed observations with mean~10, sd~5
pop_ttest <- t.test(pop1, pop2)  #calculates a two sample t-test
pop_ttest

## example of nonparametric version - Wilcoxon test
pop_wilcoxtest <- wilcox.test(pop1, pop2)
pop_wilcoxtest

## Correlation

# a simple correlation
cor(sitedata$Temp,sitedata$pH, use="complete.obs")

## Correlation matrix from a data frame

# remove non-numeric coloms using dplyr 
sitedata_numeric <-select(sitedata, -Site)
# correlation matrix for a data frame 
cor(sitedata_numeric, use = "complete.obs")

# Linear Regression
lm(Temp ~ pH, data=sitedata)

# Save the model output as an object
lm_sites <- lm(Temp ~ pH, data=sitedata)
# output the summary information for the regression
summary(lm_sites)

# plots for evaluating your regression
plot(lm_sites)

# set graphic window to show 4 plots (2x2 layout) 
par(mfrow=c(2,2))
# replot lm_sites
plot(lm_sites)

## Multiple Regression
lm_sites2 <- lm(Temp ~ pH + rain_mm, data=sitedata)
summary(lm_sites2)





