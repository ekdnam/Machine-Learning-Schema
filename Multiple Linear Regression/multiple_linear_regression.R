# install the required library if not installed before
install.packages("mlbench")

# This library is used to load inbuilt datasets, much like the sklearn.datasets library in Python

# load the library
library(mlbench)
# list contents of the library
library(help = 'mlbench')

# load the boston housing dataset
data("BostonHousing")
dim("BostonHousing")
head("BostonHousing")

# We can see tha the library has 14 cols, 13 independent variables, 1 dependent variable

# To split the dataset into training and test set we are going to use the library "caTools"
library(caTools)

# Split data from vector Y into two sets in predefined ratio while preserving relative ratios of different labels in Y. 
# Used to split the data used during classification into train and test subsets.
split = sample.split(BostonHousing$medv, SplitRatio = 0.8)

training_set = subset(BostonHousing, split == TRUE)
test_set = subset(BostonHousing, split == FALSE)


# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = medv ~ .,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)


RMSE = function(m, o){
  sqrt(mean((m - o)^2))
}

print(RMSE(test_set$medv, y_pred))

