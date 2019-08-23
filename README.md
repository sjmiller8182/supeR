# supeR

Useful R support functions

## File Descriptions

* **visual.R**: functions for generating visuals
  * Depends on tidyverse, corrplot, gridExtra, and gplots
  * Contains:
    * **basic.fit.plots**: Print Typical Regression Fit Plots
    * **heatmap.cor.lab**: Create Correlation Heatmap
* **data_munging.R**: functions for working with data
  * Depends on Hmisc
  * Contains:
    * **flattenCorrMatrix**: Flattens a correlation and p-value matrix
    * **get.dummies**: Creates dummy variables (columns) for given column
