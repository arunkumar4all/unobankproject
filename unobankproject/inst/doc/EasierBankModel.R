## ----setup, include=FALSE------------------------------------------------
library(ggplot2)
library(knitr)
library(kableExtra)


opts_chunk$set(
  fig.path = 'figure/graphics-',
  cache.path = 'cache/graphics-',
  fig.align = 'center',
  external = TRUE,
  echo = TRUE,
  warning = FALSE,
  fig.pos = 'H'
  )
output <- opts_knit$get("rmarkdown.pandoc.to")
if (output=="html") opts_chunk$set(out.width = '400px', dpi=100) else
  opts_chunk$set(out.width='.6\\linewidth')

options(knitr.table.format = "latex")

## ---- eval=FALSE---------------------------------------------------------
#  
#  pct_freq <- function(x) {
#    tbl <- table(x)
#    tbl_pct <- cbind(tbl, round(prop.table(tbl) * 100, 2))
#    colnames(tbl_pct) <- c('Count', 'Percentage')
#    knitr::kable(tbl_pct)
#  }
#  

## ------------------------------------------------------------------------

a<-rbind(sample(c(1:10),20, replace = T))
pct_freq(a)


