#' Create deprecated function wrapper
#' @param old_name Character string of deprecated function name
#' @param new_name Character string of replacement function name  
#' @param package_name Character string of package name
#' @param when Character string indicating version when deprecation started
#' @return Function that calls new function with deprecation warning
create_deprecated_function <- function(old_name, new_name, package_name, when = "2.0.0") {
  function(...) {
    warning(sprintf(
      "\nFunction '%s()' was deprecated in %s v%s.\n%s\n%s\n",
      old_name,
      package_name, 
      when,
      sprintf("Please use '%s()' instead.", new_name),
      sprintf("See ?%s for documentation.", new_name)
    ), call. = FALSE)
    
    # Get the new function from the package namespace
    new_func <- get(new_name, envir = asNamespace(package_name))
    new_func(...)
  }
}

# Define all deprecated function mappings
deprecated_functions <- list(
  lundtax_predict_sub = "classify_samples",
  predict_LundTax2023 = "classify_samples"
)

# Create all deprecated functions programmatically
for (old_name in names(deprecated_functions)) {
  new_name <- deprecated_functions[[old_name]]
  assign(old_name, create_deprecated_function(old_name, new_name, "LundTaxR"))
}

#' @title Deprecated: Use classify_samples() instead
#' @description \lifecycle{deprecated}
#' This function has been deprecated in favor of \code{\link{classify_samples}}.
#' @param ... All arguments are passed to \code{\link{classify_samples}}
#' @export
lundtax_predict_sub <- get("lundtax_predict_sub")
