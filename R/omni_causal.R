#' Construct a Simplified Causal Graph
#'
#' @description Builds a lightweight correlation-based causal-like graph among omics features.
#'
#' @param omni_data Output from OmniIntegrate()
#' @param threshold Numeric correlation threshold (default = 0.7)
#' @return A list with adjacency matrix and feature names.
#' @export
omni_causal <- function(omni_data, threshold = 0.7) {
    if (!inherits(omni_data, "OmniScope")) {
        stop("Input must be an OmniScope object from OmniIntegrate().")
    }

    corr_mat <- cor(omni_data$data, use = "pairwise.complete.obs")
    adj <- abs(corr_mat) > threshold
    diag(adj) <- FALSE
    structure(list(adjacency = adj, features = colnames(omni_data$data)),
        class = "omni_causalGraph"
    )
}
