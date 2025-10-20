#' @title Create Deprecated Function
#' 
#' @description Create deprecated function wrapper.
#' 
#' @details Internal function, create deprecated function wrapper.
#' 
#' @param old_name Character string of deprecated function name
#' @param new_name Character string of replacement function name  
#' @param package_name Character string of package name
#' @param when Character string indicating version when deprecation started
#' 
#' @return Function that calls new function with deprecation warning
#' 
#' @examples
#' \dontrun{
#' # No examples provided
#' }
#' 
create_deprecated_function = function(old_name, 
                                      new_name, 
                                      package_name, 
                                      when = "2.0.0") {
  function(...) {
    warning(sprintf(
      "\nFunction '%s()' was deprecated in %s v%s.\n%s\n%s\n",
      old_name,
      package_name, 
      when,
      sprintf("Please use '%s()' instead.", new_name),
      sprintf("See ?%s for documentation.", new_name)
    ), call. = FALSE)
    
    #get the new function from the package namespace
    new_func <- get(new_name, envir = asNamespace(package_name))
    new_func(...)
  }
}

#define all deprecated function mappings
deprecated_functions <- list(
  lundtax_predict_sub = "classify_samples",
  predict_LundTax2023 = "classify_samples",
  get_sample_metrics = "get_subtype_metrics"
)

#create all deprecated functions programmatically
for (old_name in names(deprecated_functions)) {
  new_name <- deprecated_functions[[old_name]]
  assign(old_name, create_deprecated_function(old_name, new_name, "LundTaxR"))
}

#' @title Deprecated: Use classify_samples() instead
#' @description This function has been deprecated in favor of \code{\link{classify_samples}}.
#' @param ... All arguments are passed to \code{\link{classify_samples}}
#' @export
lundtax_predict_sub <- get("lundtax_predict_sub")

#' @title Deprecated: Use classify_samples() instead
#' @description This function has been deprecated in favor of \code{\link{classify_samples}}.
#' @param ... All arguments are passed to \code{\link{classify_samples}}
#' @export
predict_LundTax2023 <- get("predict_LundTax2023")

#' @title Deprecated: Use get_subtype_metrics() instead
#' @description This function has been deprecated in favor of \code{\link{get_subtype_metrics}}.
#' @param ... All arguments are passed to \code{\link{get_subtype_metrics}}
#' @export
get_sample_metrics <- get("get_sample_metrics")
