# ISLR and MASS Library
library(ISLR)
library(MASS)

# Importing and showing
data(Boston)
fix(Boston)

# Dimension of data
dim(Boston)

# Displaying all combination of plot
plot(Boston)
view(Boston)

# Getting insights from data
table(Boston$chas)

# Are any of the predictors associated with per capita crime rate?
plot(Boston,Boston$crim)
plot(Boston$age,Boston$crim)

plot(crim ~ age, data = Boston, log = "xy")