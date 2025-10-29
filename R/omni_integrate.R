#' Integrate Multi-Omics Datasets
#'
#' @description Integrates multiple omics datasets (e.g., genomics, transcriptomics, metabolomics)
#' into a unified data frame using shared sample identifiers.
#'
#' @param ... Omics datasets as named data frames with matching sample IDs.
#' @return A list containing combined omics matrix and metadata.
#' @examples
#' integrated <- omni_integrate(transcriptomics = t_df, metabolomics = m_df)
#' @export
omni_integrate <- function(...) {
    omics_list <- list(...)
    common_samples <- Reduce(intersect, lapply(omics_list, rownames))
    aligned <- lapply(omics_list, function(df) df[common_samples, , drop = FALSE])
    combined <- do.call(cbind, aligned)
    structure(list(data = combined, samples = common_samples), class = "OmniScope")
}
