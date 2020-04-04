# Import dataset

data = read.csv('AirQualityUCI.csv')


data$X = ifelse(is.na(data$X),
                ave(data$X, FUN =  function(x) mean(x, na.rm = TRUE)),
                data$X)

# The missing values are in the column X. We select this column by data$X
# 
# ifelse:
#   
#   - ifelse() has params (test, yes, no), it returns a value with same shape as test
# - 'test' contains the testing conditions, is.na means the value is not available (Note: In R, impossible values, like the result after division by zero, are represented by NaN)
# 
# - yes: What to do if the testing condition is true? Here we replace the is.na values with the mean of the column X.
# The ave() is function used to calculate the mean. Params: The data, and the function to actually calculate the mean. In the mean function, na.rm means to remove the na values from calculation.
# 
# - no: What to do if the testing condition is false? Here we keep the values same.
