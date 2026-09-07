## EDA code
# Placeholders: store the dataset as `dat`, variable_1 as `x`, variable_2 as `y`

library(packages_needed)
# All of the underneath codes are examples

# All the relevant plots should be shows for
# the client to review. **Do not** just write interpretations/descriptions; the client
# should be able to see the plots themselves. Plots should be inline in the chat window.

## Summary statistics table
# Produce a descriptive table for the response and every covariate (continuous and
# categorical). Do not hand-type means, SDs, or counts -- they must come from the output of the codes here.

# Codes for summary statistics

# We will use the R code to plot the scatterplot, saved to a PNG file:

# Continuous X

plot(x, y, xlab = "x_variable_name", ylab = "y_variable_name",
     main = "The scatter plot between x_variable_name and y_variable_name") # Or any other plots
cor(dat$x, dat$y)

# Note that `x` and `y` are placeholders that can be substituted by any continuous covariate
# the client provided (as `dat$x`, `dat$y`, ...).
# Replace the label for the x-axis by the name of the covariate used; replace the label
# for the y-axis by the name of the response variable used; replace the title of the
# plot by "The scatter plot between x_variable_name and y_variable_name".
# Plot the scatter plot for **ALL** continuous covariates versus the single response variable
# (one PNG file per covariate -- give each a distinct filename). Also record the correlation.
# Display each PNG inline with the Read tool immediately after generating it. Do not
# redraw these points with a charting library.

## Categorical X
# We will use the R code to plot the boxplot of the response by group, saved to a PNG file:

boxplot(dat$y ~ dat$x,
        xlab = "x_variable_name", ylab = "y_variable_name",
        main = "The boxplot of y_variable_name by x_variable_name") # Or any other plots

# Note that `x` is a placeholder that can be substituted by any categorical covariate
# the client provided 
# Replace the label for the x-axis by the name of the covariate used; replace the label
# for the y-axis by the name of the response variable used; replace the title of the
# plot by "The boxplot of y_variable_name by x_variable_name".
# Plot the boxplot for **ALL** categorical covariates versus the single response variable
# (one PNG file per covariate -- give each a distinct filename). Display each PNG inline
# as in the continuous case.

# Any other plots
# ...