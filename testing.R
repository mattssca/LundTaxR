devtools::load_all("../LundTaxR/")

# Load your gene expression data (genes as rows, samples as columns)
# Expression data should be log2-transformed
data("sjodahl_2017")  # Example dataset

# Classify samples
sjodahl_classes = predict_LundTax2023(this_data = sjodahl_2017, 
                                   log_transform = FALSE, 
                                   adjust = TRUE, 
                                   impute = TRUE, 
                                   include_data = TRUE, 
                                   verbose = FALSE)

########################################################################

plot_subscore_violin(these_predictions = sjodahl_classes, 
                     this_subtype = "GU", 
                     plot_adjust = 2,
                     plot_trim = FALSE)


plot_subscore_violin(these_predictions = sjodahl_classes, 
                     this_subtype = "UroA", 
                     plot_adjust = 3,
                     plot_scale = "width",
                     plot_trim = TRUE, return_data = FALSE)

plot_data = plot_subscore_violin(these_predictions = sjodahl_classes, 
                                 this_subtype = "UroA", 
                                 return_data = TRUE)

########################################################################

plot_subscore_box(these_predictions = sjodahl_classes, 
                  this_subtype = "Uro")

plot_subscore_box(these_predictions = sjodahl_classes, 
                  this_subtype = "UroA")

plot_data = plot_subscore_box(these_predictions = sjodahl_classes, 
                              this_subtype = "Uro", 
                              return_data = TRUE)

########################################################################

plot_signatures_heatmap(these_predictions = sjodahl_classes, 
                        plot_title = "Signature Scores (Sjodahl 2017)",
                        return_scores = FALSE, 
                        plot_anno_legend = FALSE,
                        subtype_annotation = "5_class")

########################################################################

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "5_class", 
                  seg_plot = TRUE, 
                  seg_width = 1)

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "7_class", 
                  seg_plot = TRUE, 
                  seg_width = 1)

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "5_class")

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "5_class",
                  add_stat = TRUE,
                  this_subtype = "GU")

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "7_class",
                  title = "Sjodahl 2017 - Proliferation Score", out_path = "../")

ranked_proliferation = plot_ranked_score(these_predictions = sjodahl_classes, 
                                         this_score = "proliferation_score", 
                                         return_data = TRUE,
                                         subtype_class = "7_class")

head(ranked_proliferation)

########################################################################

plot_classification_heatmap(these_predictions = sjodahl_classes, 
                            subtype_annotation = "5_class",
                            plot_scores = FALSE,
                            plot_title = "Classification Results (Sjodahl 2017)", 
                            show_ann_legend = TRUE,
                            ann_height = 0.5)


########################################################################

#run general linear models
sjodahl_surv = get_survival(these_predictions = sjodahl_classes,
                            these_samples_metadata = sjodahl_2017_meta,
                            subtype_class = "5_class",
                            this_subtype = "Uro",
                            surv_time = "surv_css_time",
                            surv_event = "surv_css_event")

########################################################################

get_sample_order(expr_data = sjodahl_classes$data)

########################################################################

get_subtype_metrics(these_predictions = sjodahl_classes, 
                    this_metadata = sjodahl_2017_meta, 
                    this_metadata_variable = "surv_os_event", 
                    factor_level = 1)

get_subtype_metrics(these_predictions = sjodahl_classes, 
                    this_metadata = sjodahl_2017_meta, 
                    this_metadata_variable = "gender", 
                    factor_level = "Male")

########################################################################

some_samples = head(sjodahl_2017_meta$sample_id)
some_meta = head(sjodahl_2017_meta)

subsetted_data <- get_prediction_subset(these_predictions = sjodahl_classes, 
                                        these_sample_ids = some_samples)

subsetted_data <- get_prediction_subset(these_predictions = sjodahl_classes, 
                                        these_samples_metadata = some_meta,
                                        samples_rownames = FALSE)

########################################################################

#' #run general linear models
sjodahl_glm = get_glm(these_predictions = sjodahl_classes,
                      these_samples_metadata = sjodahl_2017_meta,
                      subtype_class = "5_class",
                      this_subtype = "Uro",
                      categorical_factor = "adj_chemo")

sjodahl_glm_new = get_glm(these_predictions = sjodahl_classes,
                      these_samples_metadata = sjodahl_2017_meta,
                      subtype_class = "5_class",
                      this_subtype = NULL,bin_scores = FALSE,
                      categorical_factor = "adj_chemo")

########################################################################

#hazard ratio                                      
plot_ratio_forest(these_predictions = sjodahl_classes,
                  these_samples_metadata = sjodahl_2017_meta,
                  stat_plot = "hazard_ratio",
                  bin_scores = TRUE, 
                  sig_color = "salmon",
                  col_bon = FALSE,
                  plot_subtitle = "n Samples: 267",
                  plot_title = "All 7 class samples",
                  subtype_class = "7_class", 
                  this_subtype = NULL,
                  return_data = FALSE,
                  plot_arrange = TRUE,
                  surv_time = "surv_css_time",
                  surv_event = "surv_css_event")
 
#odds ratio
plot_ratio_forest(these_predictions = sjodahl_classes,
                  these_samples_metadata = sjodahl_2017_meta,
                  stat_plot = "odds_ratio",
                  plot_title = "Uro - Adjuvant Chemo",
                  plot_subtitle = "n Samples: 121",
                  subtype_class = "5_class",
                  col_bon = TRUE,
                  return_data = FALSE, 
                  sig_color = "forestgreen",
                  this_subtype = "Uro",
                  categorical_factor = "adj_chemo",
                  predictor_columns = c("progression_score", 
                                        "proliferation_score", 
                                        "monocytic_lineage"))
#plot data
ratio_data = plot_ratio_forest(these_predictions = sjodahl_classes,
                  these_samples_metadata = sjodahl_2017_meta,
                  stat_plot = "odds_ratio",
                  subtype_class = "5_class",
                  col_bon = FALSE,
                  return_data = TRUE, 
                  this_subtype = "Uro",
                  categorical_factor = "adj_chemo")

########################################################################
library(cowplot)
#UroA
plot_subtype_forest(these_samples_metadata = sjodahl_2017_meta,
                    these_predictions = sjodahl_classes,
                    this_subtype = "UroA",
                    subtype_class = "7_class",
                    surv_event = "surv_css_event",
                    surv_time = "surv_css_time")

#all 5 class subtypes
plot_subtype_forest(these_samples_metadata = sjodahl_2017_meta,
                    these_predictions = sjodahl_classes,
                    this_subtype = NULL,
                    subtype_class = "5_class",
                    surv_event = "surv_css_event",
                    surv_time = "surv_css_time")

#return data
forest_data = plot_subtype_forest(these_samples_metadata = sjodahl_2017_meta,
                                  these_predictions = sjodahl_classes,
                                  subtype_class = "5_class",
                                  this_subtype = c("Uro", "GU", "BaSq", "Mes", "ScNE"),
                                  return_data = TRUE,
                                  surv_event = "surv_css_event",
                                  surv_time = "surv_css_time")

