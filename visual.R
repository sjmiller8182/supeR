
# This file contains functions for generating visuals.

# imports

require(gplots)
require(corrplot)
require(tidyverse)
require(gridExtra)

# functions

heatmap.cor.simp <- function(df, palette){
  df %>%
    keep(is.numeric) %>%
    drop_na() %>%
    cor %>%
    heatmap.2(col = palette,
              density.info = 'none', trace = 'none',
              dendrogram = c('both'), symm = F,
              symkey = T, symbreaks = T, scale = 'none',
              key = T)
}

#' Create Correlation Heatmap
#' 
#' @description
#' Creates a heatmap of correlation between all numeric
#' data features of a data.frame. Color set is diverging
#' and correlations are displayed to 2 decimal places.
#' NAs are auto dropped 
#' and non-numeric columns are auto excluded. Requires
#' tidyverse and corrplot.
#'
#' @param df Container: data.frame or tibble
#' 

heatmap.cor.lab <- function(df){
  df %>%
    keep(is.numeric) %>%
    drop_na() %>%
    cor %>%
    corrplot(addCoef.col = 'white',
             number.digits = 2,
             number.cex = 0.5,
             method = 'square')
}

#' Print Typical Regression Fit Plots
#' 
#' @description
#' Plots QQ plot of residuals, histogram of residuals,
#' residuals vs predicted values, and studentized 
#' residuals vs predicted values. Depends on tidyverse
#' and gridExtra packages being loaded.
#'
#' @param data The true values corresponding to the input.
#' @param model The predicted/fitted values of the model.
#' 

basic.fit.plots <- function(model) {
  
	# get predicted values
	Predicted <- model$fitted.values
	# get residuals
	Resid <- model$residuals
	# get studentized residuals
	RStudent <- rstudent(model = model)
        # build out a data container from the model
	fit.data = data.frame(
	  'Resid' = Resid,
	  'RStudent' = RStudent,
	  'Predicted' = Predicted
	)
	
	# create qqplot of residuals with reference line
	qqplot.resid <- fit.data %>% 
	  ggplot(aes(sample = Resid)) +
	  geom_qq() + geom_qq_line() +
	  labs(subtitle = 'QQ Plot of Residuals',
	       x = 'Theoretical Quantile',
	       y = 'Acutal Quantile')
	
	# create histogram of residuals
	hist.resid <- fit.data %>% 
	  ggplot(aes(x = Resid)) +
	  geom_histogram(bins = 15) + 
	  labs(subtitle = 'Histogram of Residuals',
	       x = 'Residuals',
	       y = 'Count')

	# create scatter plot of residuals vs
        # predicted values
	resid.vs.pred <- fit.data %>% 
	  ggplot(aes(x = Predicted, y = Resid)) +
	  geom_point() +
	  geom_abline(slope = 0) + 
	  labs(subtitle = 'Residuals vs Predictions',
	       x = 'Predicted Value',
	       y = 'Residual')

	# create scatter plot of studentized 
	# residuals vs predicted values
	rStud.vs.pred <- fit.data %>% 
	  ggplot(aes(x = Predicted, y = RStudent)) +
	  geom_point() +
	  geom_abline(slope = 0) + 
  	  geom_abline(slope = 0, intercept = -2) + 
  	  geom_abline(slope = 0, intercept = 2) + 
	  labs(subtitle = 'RStudent vs Predictions',
	       x = 'Predicted Value',
	       y = 'RStudent')
	
	# add all four plots to grid as
	# qqplot           histogram
	# resid vs pred    RStud vs pred
	grid.arrange(qqplot.resid,
		     hist.resid,
		     resid.vs.pred,
		     rStud.vs.pred, 
		     nrow = 2,
		     top = 'Fit Assessment Plots')
}
