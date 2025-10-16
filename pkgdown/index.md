<img src="man/figures/logo.png" align="right" style="max-height: 170px; max-width: 170px;" alt="LundTaxR logo" />

## Overview

The Lund Taxonomy is a single-sample molecular classification system that divides bladder cancer into distinct subtypes with different clinical behaviors and treatment responses. LundTaxR automates this classification process through:

- **Two-stage classification**: First classifies samples into 5 main subtypes (Uro, GU, BaSq, Mes, ScNE), then sub-classifies Uro samples into UroA, UroB, or UroC
- **Comprehensive molecular profiling**: Calculates signature scores for immune infiltration, stromal content, cell proliferation, and progression risk
- **Advanced visualizations**: Generates publication-ready heatmaps and plots
- **Robust data handling**: Supports multiple gene ID formats and includes missing data imputation

## Key Features

### 🎯 **Accurate Classification**
- Random Forest-based predictors trained on extensive bladder cancer datasets
- Confidence scores and prediction reliability metrics
- Single sample classification

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

# 1. Load your gene expression data (genes as rows, samples as columns)
data("sjodahl_2017") # Bundled dataset

# 2. Run Classifier
sjodahl_classes = classify_samples(this_data = sjodahl_2017, 
                                   log_transform = FALSE, 
                                   adjust = TRUE, 
                                   impute = TRUE, 
                                   include_data = TRUE)

```

## Advanced Usage
For a more comprehensive tutorial and usage examples, please refer to the vignettes.

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
vignette("getting_started_with_LundTaxR_fig_1", package = "LundTaxR")

# Browse all documentation
help(package = "LundTaxR")
```

## Example Workflows

### Basic Classification
```r
# Classify samples
my_predicted = classify_samples(this_data = expression_data)
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
