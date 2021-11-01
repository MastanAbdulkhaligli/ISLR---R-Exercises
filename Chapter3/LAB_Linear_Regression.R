# Importing Libraries
library(MASS)
library(ISLR)
library(dplyr)

# Retrieving Boston data
data(Boston)

# Show Boston and load to Global Environment
fix(Boston)

# Show Boston column names
names(Boston)

#Plotting predictor and response variables
plot(Boston$lstat,Boston$medv)

# Fitting simple linear function with medv as a response(Y) and lstat as predictor(X)
lm.fit=lm(medv~lstat, data = Boston)
attach(Boston)
lm.fit = lm(medv~lstat)

# Detailed information, 
summary(lm.fit)

# Lets see correlation 
cor(Boston$lstat,Boston$medv)

# Lets explore which information stored in lm.fit
names(lm.fit)

# Obtaining confidence interval for the coefficient estimates
confint(lm.fit)

## INTERCEPT
## We are 95% confident that when LSTAT is 0, we expect  
## medv will be between 33.44 and 35.65

## Slope 
## We are 95% confident that when lstat increase 1 unit
## medv will decrease by between 0.87 and 1.02 

## predict function with confidence intervals

predict(lm.fit, data.frame(lstat=c(5,10,15)), interval = "confidence")

## Output explanation

## When lstat is 5 our prediction is 29.80359 and we are 95% confident that our 
## value will between 29 and 30.59



## predict function with prediction intervals
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval = "prediction")


plot(lstat,medv)
abline(lm.fit)

abline(lm.fit,lwd=3,pch =20,col="red")


## Dividing plot region into 4
par(mfrow(c(2,2)))
plot(lm.fit)

## Plotting residuals
plot(predict(lm.fit),residuals(lm.fit))
plot(predict(lm.fit),rstudent(lm.fit))

## Leverage statistics
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))


## ******    MULTIPLE LINEAR REGRESSION   ******

## Syntax of multiple linear regression    lm(y~x1+x2+x3)
lm.fit=lm(medv~lstat + age, data=Boston)
summary(lm.fit)

## Boston data set contains 13 variables, it is hard to wrtite all 
## X variables, shortcut is like that:
lm.fit= lm(medv~.,data=Boston)
summary(lm.fit)


library(car)
vif(lm.fit)

# Regression using all predictors except age because age has high p-value
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)


## ******    Interaction Terms   ******
summary(lm(medv~lstat*age,data=Boston))



## ******    Non-linear Transformation of the Predictors   ******

# performing regression of med onto lstat and lstat^2
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)


#  The anova function performs a hypothesis test is comparing the two models.
#  Null hyp -> two models fit data equally well
#  Alt  hyp -> full model is superior
#  Here F-statistics is 135 and associated p-value is virtually 0.
#  This provides very clear evidence that the model containing the predictors lstat
#  and lstat^2 is far superior to the model only contains the predictor lstat

lm.fit= lm(medv~lstat)
anova(lm.fit,lm.fit2)

par(mfrow=c(2,2))
plot(lm.fit2)

# Producing a fifth-order polynomial fit

lm.fit5 = lm(medv~poly(lstat,5))
summary(lm.fit5)


## ******    Qualitative Predictors   ******
fix(Carseats)
names(Carseats)
(Carseats$ShelveLoc)

# Given a qualitative variable such as Shelveloc, R generate dummy variables automatically.
lm.fit = lm(Sales~. + Income: Advertising + Price: Age, data = Carseats)
summary(lm.fit)

# The contrasts() function returns dummy variables
attach(Carseats)
contrasts(ShelveLoc)


## ******    Writing Functions   ******
LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded")
}

LoadLibraries()




