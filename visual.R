
require(gplots)
require(corrplot)
require(tidyverse)

# Heatmaps

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
