


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
#' pct_freq(a)

pct_freq <- function(x) {
  tbl <- table(x)
  tbl_pct <- cbind(tbl, round(prop.table(tbl) * 100, 2))
  colnames(tbl_pct) <- c('Count', 'Percentage')
  knitr::kable(tbl_pct)
}




#' @title vif_glmrepeat
#' @description Variable reduction method using VIF threshold
#' @details This function takes dataset, dependent variable, and threhold. 
#' Variance inflation factor is calculated using general linear model
#' Removes highest VIF variable and run glm again until we reach threshold 
#' Make sure to send clean data before running this function
#' @author Arun Ranganathan \email{aranganathan@unomaha.edu}
#' @export vif_glmrepeat
#' @param  dataset, 
#' @param  dependent_variable 
#' @param  VIF_threshold
#' @return variables that are below VIF threshold
#' @examples
#' glmrepeat(german_credit, german_credit$Creditability, 2)



vif_glmrepeat <- function(dataset,depvariable, threshold){
  
  # dataset <- train_data_binned[,iv_var_pred]
  # depvariable <- train_data_binned$co_cnt
  count <- 0
  
  repeat{ # repeat function again until  break event
    count <- count + 1
    print(count)
    if (count > 50) {break}
    vif_result <- as.data.frame(vif(glm(depvariable~., data = dataset,  family = binomial(link = logit)))) %>% dplyr::add_rownames() # calculate ViF from created model
    if
    ((if(nrow(as.data.frame(vif_result[vif_result[,2] > threshold,])) !=0) { # if-condition to count number of rows having VIF > threshold. If there is any variable having VIF >5, TRUE statement will find and eliminate the largest VIF variable. IF the statement is false, return a number/ notification to match with break condition.
      maxvif <- as.character(vif_result[vif_result[,2] == max(vif_result[,2]),][,1]) # find name of variable having largest VIF
      
      # count the number of variables in a cluster and if the count is 1 put it in a data frame called cluster var
      
      new_result <- dataset[,which(colnames(dataset) != maxvif)] # eliminate the largest VIF from  dataset and create a new dataset
      dataset <- new_result # replace new dataset to orginal dataset
      print(vif_result)
    }
    else{print(3)}) == 3) # 3 is used as a condition to match with if-statement only when making break event 
    {break}
  }
  
  # append vif_result data frame with cluster var data frame
  
  print(vif_result)
  
}