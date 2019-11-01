# supeR

Useful R support functions

## File Descriptions

* **visual.R**: functions for generating visuals
  * Depends on tidyverse, corrplot, gridExtra, and gplots
  * Functions:
    * **basic.fit.plots**: Print Typical Regression Fit Plots
    * **heatmap.cor.lab**: Create Correlation Heatmap
* **data_munging.R**: functions for working with data
  * Depends on Hmisc
  * Functions:
    * **flattenCorrMatrix**: Flattens a correlation and p-value matrix
    * **get.dummies**: Creates dummy variables (columns) for given column
* **performance.R**: functions for assessing performance of models
  * No library dependance
  * Functions:
    * **PRESS**: Calculate PRESS Score
    * **PRESS.cv**: Calculates PRESS from `caret` CV model
    * **MSE**: Calculate MSE Score

## Run Tests

To run the tests for this package, call `run_tests.sh`.
All available tests will be run.
