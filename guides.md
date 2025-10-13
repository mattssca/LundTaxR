# R Package Overhaul Implementation Plan: LundTax2023Classifier → LundTaxR

## Overview
This document outlines the complete process for overhauling the LundTax2023Classifier package, including renaming to LundTaxR, function deprecation management, and comprehensive documentation updates.

## 1. Repository and Package Renaming

### Step 1: Create Archive of Current Version
```bash
# Clone current repo for archival purposes
git clone https://github.com/LundBladderCancerGroup/LundTaxonomy2023Classifier.git LundTaxonomy2023Classifier-archive
```

### Step 2: Rename Repository on GitHub
1. Navigate to repository settings on GitHub
2. Change repository name to "LundTaxR" 
3. GitHub will automatically create redirects from old URLs

### Step 3: Update Local Repository
```bash
# Update remote URL
git remote set-url origin https://github.com/LundBladderCancerGroup/LundTaxR.git
```

### Step 4: Update Package DESCRIPTION File
```r
# Update the following fields in DESCRIPTION:
Package: LundTaxR
Title: Predictor of Lund Taxonomy molecular subtypes from gene-expression data
Version: 2.0.0
# Keep all other fields (Authors@R, Description, etc.) unchanged
```

## 2. Function Deprecation Management

### Recommended Approach: Centralized Deprecation System

Create a single file to handle all deprecated functions using a helper function approach:

**Create: R/deprecated_functions.R**
```r
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
  lundtax_calc_sigscore = "calculate_signatures"
  # Add additional mappings as needed
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

#' @title Deprecated: Use calculate_signatures() instead  
#' @description \lifecycle{deprecated}
#' This function has been deprecated in favor of \code{\link{calculate_signatures}}.
#' @param ... All arguments are passed to \code{\link{calculate_signatures}}
#' @export
lundtax_calc_sigscore <- get("lundtax_calc_sigscore")
```

### Update DESCRIPTION for Deprecation Support
```r
# Add to Suggests section:
Suggests: 
    lifecycle
```

## 3. Version Management

### Update Version Information
```r
# In DESCRIPTION file:
Version: 2.0.0
```

### Create NEWS.md File
```markdown
# LundTaxR 2.0.0

## Major Changes
* Package renamed from LundTax2023Classifier to LundTaxR
* Function names updated for consistency and clarity
* Comprehensive vignettes and documentation overhaul
* Enhanced README with detailed usage examples

## Function Changes (Backward Compatible)
| Old Function Name | New Function Name | Status |
|-------------------|-------------------|--------|
| `lundtax_predict_sub()` | `classify_samples()` | Deprecated in v2.0.0 |
| `lundtax_calc_sigscore()` | `calculate_signatures()` | Deprecated in v2.0.0 |

## Backward Compatibility  
* All old function names maintained with deprecation warnings
* Existing code will continue to work with informative messages about new function names
* Deprecation warnings include migration guidance

## Breaking Changes
* Package name change requires updating installation commands
* Future versions (3.0.0+) will remove deprecated function names entirely

# LundTax2023Classifier 1.1.4
* Last version under original package name
* All previous functionality maintained
```

## 4. Documentation Updates

### README.md Requirements
- Installation instructions for both old and new package names
- Migration guide from old function names
- Comprehensive usage examples
- Clear description of classification methodology
- Citation information

### Vignette Requirements  
- Detailed workflow examples
- Performance benchmarking
- Biological interpretation guides
- Integration with other bioinformatics tools
- Troubleshooting common issues

## 5. Implementation Checklist

### Immediate Tasks
- [ ] Update DESCRIPTION file (package name and version)
- [ ] Create deprecated_functions.R with centralized deprecation system
- [ ] Add lifecycle to Suggests in DESCRIPTION
- [ ] Create comprehensive NEWS.md
- [ ] Update NAMESPACE to export deprecated functions

### Documentation Tasks
- [ ] Write detailed README.md with migration guide
- [ ] Create thorough vignettes covering all major use cases
- [ ] Update all function documentation
- [ ] Add examples using new function names
- [ ] Include performance benchmarks

### Testing and Validation
- [ ] Run `R CMD check .` to validate package structure
- [ ] Test deprecated functions show appropriate warnings
- [ ] Verify all new function names work correctly
- [ ] Test installation from GitHub with new name

### Release Tasks
- [ ] Git commit all changes
- [ ] Create git tag: `git tag -a v2.0.0 -m "Release LundTaxR v2.0.0"`
- [ ] Push changes and tags: `git push origin main --tags`
- [ ] Update GitHub repository description
- [ ] Create GitHub release with changelog

## 6. Future Version Planning

### Deprecation Timeline
- **v2.0.0**: Introduce deprecation warnings for old function names
- **v2.1.0**: Increase warning prominence, add to package startup message
- **v3.0.0**: Remove deprecated functions entirely

### Maintenance Strategy
- Maintain old repository as archive with clear redirect messaging
- Monitor usage of deprecated functions through warnings
- Provide migration support for major users
- Regular updates to documentation and examples

## Current Package Information (Reference)
- **Current Name**: LundTax2023Classifier
- **Current Version**: 1.1.4
- **Authors**: Elena Aramendía, Pontus Eriksson, Adam Mattsson
- **Purpose**: Random Forest rule-based single-sample predictor for Lund Taxonomy molecular subtypes (5 main classes + 3 Uro subclasses)

---

*This plan ensures a smooth transition while maintaining backward compatibility and providing clear guidance for users migrating to the new package structure.*