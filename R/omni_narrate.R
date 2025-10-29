#' Auto-Generate a Narrative Summary
#'
#' @description Produces a simple text-based report of causal and importance results.
#'
#' @param omni_data Integrated omics data (OmniScope)
#' @param causal_graph OmniCausalGraph object
#' @param importance_table Output from OmniExplain()
#' @param output_file File path to save report (optional)
#' @export
omni_narrate <- function(omni_data, causal_graph, importance_table, output_file = NULL) {
    summary_text <- paste0(
        "OmniScopeR Report\n",
        "=================\n",
        "Samples: ", length(omni_data$samples), "\n",
        "Features: ", ncol(omni_data$data), "\n\n",
        "Top Important Features:\n",
        paste(head(importance_table$Feature, 10), collapse = ", "), "\n\n",
        "Causal Graph Density: ",
        round(sum(causal_graph$adjacency) / length(causal_graph$adjacency), 3), "\n"
    )

    if (!is.null(output_file)) writeLines(summary_text, con = output_file)
    cat(summary_text)
}
