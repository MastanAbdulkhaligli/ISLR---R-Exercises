# Another way of reading College dataset 
# College <- read.csv("https://uclspp.github.io/datasets/data/College.csv")

# ISLR Library
library(ISLR)

# Importing College data
data(College)

# Show dataset (We can edit it)
fix(College)

# Show dataset on the right tabs (We can not edit it)
view(College)

# Showing Summary statistics about dataset
summary(College)

# Producing scatterplot matrix of first ten columns
pairs(College[,1:10])

# Side by side boxplots
plot(College$Outstate ~College$Private)

# Creating matrix with shape of (777,1)  row size of Elite is  # of Rows in College and filling it with "No"
Elite=rep("No",nrow(College))

# Showing Elite
view(Elite)

# First we fill Elite with "No" then change it with "Yes" 
Elite[College$Top10perc >50]=" Yes"
view(Elite)

# We convert column from numeric to factor
Elite = as.factor(Elite)

#Merging Elite with College and overwrite it into College  
College = data.frame(College,Elite)
view(College)

# To see how many Elite universities are there (YEs: 78, NO: 699)
summary(College)

# Boxplot of Outstate versus Elite
plot(College$Outstate~College$Elite)

# Divide screen into 4 subscreens
par(mfrow=c(2,2))

# Histogram of numeric variables
hist(College$Accept)
hist(College$Grad.Rate)
hist(College$Enroll)
hist(College$Top25perc)

# university with the most students in the top 10% of class
Elite_university_number_1 = row.names(College)[which.max(College$Top10perc)] 

# Lets define Acceptance rate 
rate_of_accept = College$Accept / College$Apps

# University which has max and lower acceptance rate
# For max
max_acceptance_rate = row.names(College)[which.max(rate_of_accept)]
#For min
min_acceptance_rate = row.names(College)[which.min(rate_of_accept)]

# Lets see university who has maximum acceptance rate is same with lower Top10perc 
print(Elite_university_number_1 == row.names(College)[which.min(College$Top10perc)])

# Now lets check graduation rate of "Princeton University" and "Emporia State University"
College["Princeton University","Grad.Rate"] # 99

College["Emporia State University","Grad.Rate"] # 50

# Of course if i study in Princeton i will do my best for diploma :D










