#' @title Bin Numeric Variables
#'
#' @description This function bins all numeric variables in a data frame into a specified number of 
#' bins.
#'
#' @details Internal function. Not meant for out-of-package use. The function identifies all numeric
#' columns in the provided data frame and applies a binning process to each numeric column. The 
#' binning process divides the range of each numeric column into a specified number of bins and 
#' assigns each value to one of these bins.
#'
#' @param this_data Required. A data frame containing the data to be binned.
#' @param num_bins Required. The number of bins to use for binning the numeric variables.
#'
#' @return A data frame with the numeric variables binned into the specified number of bins.
#'
#' @examples
#' \dontrun{
#' # No examples provided
#' }
#' 
int_bin_numeric_variables = function(this_data = NULL, 
                                     num_bins = NULL){
  
  #identify all numeric columns in the data frame
  numeric_columns = sapply(this_data, is.numeric)
  
  #define the binning function
  bin_column = function(column, num_bins){
    
    #get the range of the column
    range_min = min(column, na.rm = TRUE)
    range_max = max(column, na.rm = TRUE)
    
    #create the bins
    binned_column = cut(column, 
                        breaks = seq(range_min, range_max, length.out = num_bins + 1), 
                        labels = FALSE, 
                        include.lowest = TRUE)
    return(binned_column)
  }
  
  #apply the binning function to each numeric column
  this_data[numeric_columns] <- lapply(this_data[numeric_columns], bin_column, num_bins = num_bins)
  
  return(this_data)
}
