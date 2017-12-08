


#' @title pct_freq
#' @description Create percentage table and shows the result in a markdown format
#' @details This function takes a vector as input and creates their frequency and distribution. 
#' There are two columns output from this pct function. First column "count" shows number of occurrences of a string or a number
#' Second variable "Percentage" shows the percentage frequency of this number.
#' @author Arun Ranganathan \email{aranganathan@unomaha.edu}
#' @export pct_freq
#' @param x is a vector of numbers or characters. This could take a column as well as a vector.
#' @return table in a kable format using knitr package
#' @examples
#' a<-rbind(sample(c(1:10),20, replace = T))
#' pct(a)

pct_freq <- function(x) {
  tbl <- table(x)
  tbl_pct <- cbind(tbl, round(prop.table(tbl) * 100, 2))
  colnames(tbl_pct) <- c('Count', 'Percentage')
  knitr::kable(tbl_pct)
}
