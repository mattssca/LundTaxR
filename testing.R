library(LundTaxR)
devtools::load_all("../LundTaxR/")

# Load your gene expression data (genes as rows, samples as columns)
# Expression data should be log2-transformed
data("sjodahl_2017")  # Example dataset

# Classify samples
sjodahl_classes = classify_samples(this_data = sjodahl_2017, 
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
                     plot_adjust = 5,
                     plot_trim = TRUE)

########################################################################

plot_subscore_box(these_predictions = sjodahl_classes, 
                     this_subtype = "GU", 
                  plot_title = "GU Pred, Scores (Sjodahl 2017)")

plot_subscore_box(these_predictions = sjodahl_classes, 
                  this_subtype = "UroA", 
                  plot_title = "UroA Pred, Scores (Sjodahl 2017)")

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
                  seg_width = 2,
                  add_stat = TRUE, 
                  title = "Sjodahl 2017 - Proliferation Score")

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "5_class", 
                  title = "Sjodahl 2017 - Proliferation Score")

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "7_class",
                  this_subtype = "UroA",  
                  title = "Sjodahl 2017 - Proliferation Score")

plot_ranked_score(these_predictions = sjodahl_classes, 
                  this_score = "proliferation_score", 
                  subtype_class = "7_class",
                  title = "Sjodahl 2017 - Proliferation Score")

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

