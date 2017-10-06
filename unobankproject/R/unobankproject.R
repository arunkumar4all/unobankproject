#' @title bin_name
#' @description Create bin's in increments
#' @details Calculate the percentage of concordant and discordant pairs for a given logit model.
#' @author Arun Ranganathan \email{aranganathan@unomaha.edu}
#' @export bin_name
#' @param x Number
#' @return Bins
#' @examples
#' bin_name(100)


bin_name = function(x) {
  fico_increments <- 40
  low = 480 + (x - 1) * fico_increments
  high = low + fico_increments
  paste(low, high, sep = "-")
}


#' @title pct
#' @description Create pct's in a table
#' @details Calculate percentage/frequency.
#' @author Arun Ranganathan \email{aranganathan@unomaha.edu}
#' @export pct
#' @param x Number
#' @return table
#' @examples
#' a<-rbind(sample(c(1:10),20, replace = T))
#' pct(a)

pct <- function(x) {
  tbl <- table(x)
  tbl_pct <- cbind(tbl, round(prop.table(tbl) * 100, 2))
  colnames(tbl_pct) <- c('Count', 'Percentage')
  knitr::kable(tbl_pct)
}
