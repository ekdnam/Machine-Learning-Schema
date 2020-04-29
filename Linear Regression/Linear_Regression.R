data = read.csv("housing.csv")

# Getting required data fields, population and households from the data set
population = data$population

households = data$households

#The "lm()" function creates a linear regression model

#The lm() function is as follows
#   lm(formula, data, subset, weights, na.action,
#     method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
#     singular.ok = TRUE, contrasts = NULL, offset, .)

# formula is of the form response ~ cause

# data is the dataframe from where the response and cause variables are going to be taken.
# else from the environment

# subset: optional vector specifying subset of observations to be used

#na.action: function which specifies what to do if na values present

#method: method to be used for fitting. currently only method = "qr"

regressor = lm(formula = households ~ population)

# predict function returns dataframe containing model predicitions
# predict() has only one parameter, the object which used as prediction model

y_pred = predict(regressor)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = population, y = households),
             colour = 'red') +
  geom_line(aes(x = population, y = predict(regressor, newdata = data)),
            colour = 'blue') +
  ggtitle('Income vs House Value') +
  xlab('Median Income') +
  ylab('Median House Value')

ggsave(
  filename = "predict.png",
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = NA,
  height = NA,
  units = c("in", "cm", "mm"),
  dpi = 300,
  limitsize = TRUE,
  #...
)
