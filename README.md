# LundTaxR

<img src="man/figures/logo.png" align="right" height="280" alt="LundTaxR logo" />

<!-- R Package Badges -->
![R](https://img.shields.io/badge/R-%E2%89%A54.0.0-blue)
![License](https://img.shields.io/badge/license-GPL%20(%E2%89%A5%202)-blue)
![Version](https://img.shields.io/badge/version-2.0.0-blue)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen)

<!-- Domain Badges -->
![Bioinformatics](https://img.shields.io/badge/domain-bioinformatics-purple)
![Cancer Research](https://img.shields.io/badge/application-cancer%20research-red)
![Classification](https://img.shields.io/badge/method-machine%20learning-orange)



> **Robust molecular subtyping of bladder cancer using the Lund Taxonomy classification system**

LundTaxR implements a comprehensive Random Forest-based classifier for molecular subtyping of bladder cancer samples using gene expression data. The package provides a two-stage classification system based on the established Lund Taxonomy, enabling precise molecular characterization.

## Overview

The Lund Taxonomy is a molecular classification system that divides bladder cancer into distinct subtypes with different clinical behaviors and treatment responses. LundTaxR automates this classification process through:

- **Two-stage classification**: First classifies samples into 5 main subtypes (Uro, GU, BaSq, Mes, ScNE), then sub-classifies Uro samples into UroA, UroB, or UroC
- **Comprehensive molecular profiling**: Calculates signature scores for immune infiltration, stromal content, cell proliferation, and progression risk
- **Advanced visualizations**: Generates publication-ready heatmaps and plots
- **Robust data handling**: Supports multiple gene ID formats and includes missing data imputation

## Key Features

### 🎯 **Accurate Classification**
- Random Forest-based predictors trained on extensive bladder cancer datasets
- Confidence scores and prediction reliability metrics

### 📊 **Molecular Signatures**
- Immune infiltration scores (CD8+ T cells, NK cells, macrophages)
- Stromal content assessment
- Cell proliferation and progression risk markers

### 📈 **Visualization Tools**
- Classification result heatmaps
- Signature score distributions
- Subtype comparison plots
- Survival analysis visualizations

### 🔧 **User-Friendly**
- Simple single-function classification
- Comprehensive documentation and tutorials
- Flexible input formats
- Integration with standard R workflows

## Installation

### From GitHub (Recommended)
```r
# Install devtools if you haven't already
if (!require(devtools)) install.packages("devtools")

# Install LundTaxR
devtools::install_github("mattssca/LundTaxR")
```

### System Requirements
- R ≥ 4.0.0
- Required packages will be installed automatically

## Quick Start

```r
library(LundTaxR)

# Load your gene expression data (genes as rows, samples as columns)
# Expression data should be log2-transformed
data("sjodahl_2017")  # Example dataset

# Classify samples
sjodahl_classes = classify_samples(this_data = sjodahl_2017, 
                                   log_transform = FALSE, 
                                   adjust = TRUE, 
                                   impute = TRUE, 
                                   include_data = TRUE)

```

## Classification System

### Main Subtypes (5-class)
- **Uro** (Urothelial-like): Resembles normal urothelium
- **GU** (Genomically Unstable): High mutation burden
- **BaSq** (Basal/Squamous): Aggressive
- **Mes** (Mesenchymal): Stromal-rich
- **ScNE** (Small cell/Neuroendocrine): Rare, very aggressive subtype

### Uro Subclasses (7-class)
- **UroA**: Papillary-like features
- **UroB**: Mixed characteristics  
- **UroC**: Progression-prone subset

## Documentation

- **Package Documentation**: Access help files with `?function_name`
- **Vignettes**: Comprehensive tutorials and examples

```r
# View main tutorial
vignette("tutorial", package = "LundTaxR")

# Browse all documentation
help(package = "LundTaxR")
```

## Example Workflows

### Basic Classification
```r
# Classify samples
my_predicted = classify_samples(this_data = expression_data)
```

### Advanced Analysis
```r
# Calculate signature scores
signatures <- classify_samples(expression_data, results_5c)

# Generate comprehensive heatmap
plot_hm_signatures(
  predictions = results_5c,
  signatures = signatures,
  expression_data = expression_data
)

# Signature Heatmap

# Survival analysis (if clinical data available)

# Forest Plot

# Plot Subtype Scores

# Plot Ranked Scores

# Get Sample Order

# Get Sample Metrics

# Subset Predictions

```

## Citation

If you use LundTaxR in your research, please cite:

```
Mattsson A, Aramendía E, Eriksson P, et al. (2024). 
LundTaxR: Molecular subtyping of bladder cancer using the Lund Taxonomy. 
R package version 2.0.0.
```

## Contributing

We welcome contributions!
- Reporting bugs
- Suggesting enhancements  
- Submitting pull requests

## Support

- **Issues**: [GitHub Issues](https://github.com/mattssca/LundTaxR/issues)
- **Email**: adam.mattsson@med.lu.se
- **Documentation**: Package help files and vignettes

## License

This project is licensed under the GPL (≥ 2) License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Lund Bladder Cancer Group
- Contributors to the original Lund Taxonomy classification system
- The R community for excellent bioinformatics tools

---

**Developed by the Lund Bladder Cancer Group** 🇸🇪
