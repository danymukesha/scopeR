#' Explain Feature Importance
#'
#' @description Estimates basic feature importance using variance or correlation with phenotype.
#'
#' @param omni_data Integrated omics data (OmniScope object)
#' @param phenotype Numeric or factor vector
#' @return A data frame of feature importance scores
#' @export
omni_explain <- function(omni_data, phenotype) {
    if (!inherits(omni_data, "OmniScope")) {
        stop("Input must be an OmniScope object.")
    }

    scores <- sapply(omni_data$data, function(f) {
        abs(cor(f, phenotype, use = "pairwise.complete.obs"))
    })

    imp <- data.frame(Feature = names(scores), Importance = scores)
    imp <- imp[order(-imp$Importance), ]
    rownames(imp) <- NULL
    imp
}
