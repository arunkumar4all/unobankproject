# These are a collection of useful functions in R
# done as a part of independent study at UNO

bin_name = function(x) {
  fico_increments <- 40
  low = 480 + (x - 1) * fico_increments
  high = low + fico_increments
  paste(low, high, sep = "-")
}


pct <- function(x) {
  tbl <- table(x)
  tbl_pct <- cbind(tbl, round(prop.table(tbl) * 100, 2))
  colnames(tbl_pct) <- c('Count', 'Percentage')
  knitr::kable(tbl_pct)
}
