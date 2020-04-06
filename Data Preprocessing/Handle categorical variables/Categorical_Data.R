# Get dataset

data = read.csv('Data.csv')

# At first, we can see that there is some missing data
# We will fill these NA values by the mean of the columns

data$Age = ifelse(is.na(data$Age),
                ave(data$Age, FUN =  function(x) mean(x, na.rm = TRUE)),
                data$Age)

data$Salary = ifelse(is.na(data$Salary),
                  ave(data$Salary, FUN =  function(x) mean(x, na.rm = TRUE)),
                  data$Salary)

# Now we handle the categorical data

# Encoding the categorical data

# factor(x = character(), levels, labels = levels, exclude = NA, ordered = is.ordered(x), nmax = NA)
# params:
# 1. x: a vector of data
# 2. levels: optional vector of unique values that x might have taken
# 3. labels: optional character vector of labels for levels (in same order as levels after removing those in exclude), or character string of length 1
# 4. exclude: vector of values to be excluded when forming set of levels
# 5. ordered: logical flag to determine if the levels should be regarded as ordered (in order given)
# 6. nmax: an upper bound on number of levels

data$Country = factor(data$Country,
                      levels = c('France', 'Spain', 'Germany'),
                      labels = c(0, 1, 2))