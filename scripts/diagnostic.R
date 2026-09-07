## Diagnostic

# This section contains the R code that verifies each assumption.

# All the relevant plots should be shows for
# the client to review. **Do not** just write interpretations/descriptions; the client
# should be able to see the plots themselves. Plots should be inline in the chat window.

## - Assumption 3
# e.g. for linear regression, store input data set as `dat`, then store the covariates
# as `x1`, `x2`, ..., and response as `y`, then fit the model linearly
fit <- lm(y ~ x1 + x2 + ..., data = dat)
# Check for multicollinearity
vif_values <- car::vif(fit)
vif_values
# All of the values should be less than 10.
all(vif_values <= 10)

## - Assumption 4

# Code for the fourth assumption



## - Assumption 5

# Code for the fifth assumption