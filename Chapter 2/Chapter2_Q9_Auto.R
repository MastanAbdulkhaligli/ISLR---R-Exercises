# ISLR and dplyr Library
library(ISLR)
library(dplyr)

# Importing College data
data(Auto)

# Show dataset (We can edit it)
fix(Auto)
view(Auto)

# Origin column is qualitative and encoded lets decode it
#Lets see how many Countries is encoded
table(Auto$origin)

# 1 stands for USA, 2 -- Europe, 3 -- Japon lets decode it and save it in same column (Origin)
Auto$origin = factor(Auto$origin, labels = c("USA","Europe","Japon"))
fix(Auto)

# Range of each quantitave predictor
range_mpg = range(Auto$mpg)
range_cylinders = range(Auto$cylinders)
range_displacements = range(Auto$displacement)
range_horsepower = range(Auto$horsepower)
range_weights = range(Auto$weight)
range_acceleration = range(Auto$acceleration)
range_year = range(Auto$year)

# or just use 
# Auto %>% summarise_if(is.numeric, range)

# Mean and standard deviation of each quantitative predictor
# We convert Origin column to apply is.numeric
Auto %>% summarise_if(is.numeric, sd)
Auto %>% summarise_if(is.numeric, mean)

# Removing the 10th through 85th observations from Auto
# "Through" is always inclusive
Removing_auto = Auto[-10:-84,]

# Range, mean, and standard deviation of each predictor in the Removing_auto
range_subset = Removing_auto %>% summarise_if(is.numeric, range)
mean_subset = Removing_auto %>% summarise_if(is.numeric, mean)
sd_subset = Removing_auto %>% summarise_if(is.numeric, sd)

# Using the full data set, investigation of the predictors graphically

# Lets explore correlation between Acceleration and mpg
plot(Auto$acceleration,Auto$mpg,xlab="Acceleration",ylab="Miles per gallon")
cor(Auto$acceleration,Auto$mpg)    #0.4

# Lets explore weight and acceleration relationship
plot(Auto$weight,Auto$acceleration,xlab="Weight",ylab="Acceleration")
cor(Auto$weight,Auto$acceleration)   #-0.41 it is normal if weights more then acceleration is harder

# Lets see which predictors are useful in predicting mpg
plot(Auto,Auto$mpg)

# We see that 5th column (Weight) is useful 
cor(Auto$mpg,Auto$weight)






