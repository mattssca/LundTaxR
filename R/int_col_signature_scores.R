#' Numeric signature score columns
#'
#' A character vector of column names for numeric signature scores used in LundTaxR.
#' @export
col_signature_score_num <- c(
  "proliferation_score", "progression_score", 
  "stromal141_up", "immune141_up", "b_cells", 
  "t_cells", "t_cells_cd8", "nk_cells", 
  "cytotoxicity_score", "neutrophils", 
  "monocytic_lineage", "macrophages", 
  "m2_macrophage", "myeloid_dendritic_cells", 
  "endothelial_cells", "fibroblasts", 
  "smooth_muscle", "molecular_grade_who_1999_score", 
  "molecular_grade_who_2022_score"
)

#' Character signature score columns
#'
#' A character vector of column names for categorical signature scores used in LundTaxR.
#' @export
col_signature_score_char <- c(
  "progression_risk", "molecular_grade_who_1999", "molecular_grade_who_2022"
)

#' Proportion signature score columns
#'
#' A character vector of column names for proportion signature scores used in LundTaxR.
#' @export
col_signature_score_prop <- c(
  "b_cells_proportion", "t_cells_proportion", 
  "t_cells_cd8_proportion", "nk_cells_proportion", 
  "cytotoxicity_score_proportion", "neutrophils_proportion", 
  "monocytic_lineage_proportion", "macrophages_proportion", 
  "m2_macrophage_proportion", "myeloid_dendritic_cells_proportion", 
  "endothelial_cells_proportion", "fibroblasts_proportion", 
  "smooth_muscle_proportion"
)

#' Formatted signature score names
#'
#' A named character vector mapping internal column names to formatted display names for signature scores.
#' @export
col_signature_score_formatted <- c(
  "proliferation_score" = "Proliferation Score",
  "molecular_grade_who_1999_score" = "Mol. grade (WHO1999)",
  "molecular_grade_who_2022_score" = "Mol. grade (WHO2022)",
  "progression_score" = "Progression Score",
  "immune141_up" = "Immune 141_UP",
  "b_cells" = "B Cells",
  "t_cells" = "T Cells",
  "t_cells_cd8" = "CD8+ T Cells",
  "nk_cells" = "NK Cells",
  "cytotoxicity_score" = "Cytotoxicity Score",
  "neutrophils" = "Neutrophils",
  "monocytic_lineage" = "Monocytic Lineage",
  "macrophages" = "Macrophages",
  "m2_macrophage" = "M2 Macrophages",
  "myeloid_dendritic_cells" = "Myeloid DCs",
  "stromal141_up" = "Stromal 141_UP",
  "endothelial_cells" = "Endothelial Cells",
  "fibroblasts" = "Fibroblasts",
  "smooth_muscle" = "Smooth Muscle"
)
