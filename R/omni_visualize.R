#' Visualize the Causal Graph
#'
#' @description Creates a simple interactive-like plot of causal relationships among features.
#'
#' @param causal_graph Output from omni_causal()
#' @param max_nodes Maximum number of nodes to plot (default = 50)
#' @export
omni_visualize <- function(causal_graph, max_nodes = 50) {
    if (!inherits(causal_graph, "omni_causalGraph")) {
        stop("Input must be from omni_causal().")
    }

    adj <- causal_graph$adjacency
    features <- causal_graph$features
    n <- min(max_nodes, ncol(adj))

    edges <- which(adj[1:n, 1:n], arr.ind = TRUE)
    plot(1,
        type = "n", xlab = "", ylab = "",
        xlim = c(0, 1), ylim = c(0, 1), axes = FALSE,
        main = "OmniScopeR Causal Graph"
    )

    set.seed(42)
    pos <- data.frame(x = runif(n), y = runif(n))

    segments(pos$x[edges[, 1]], pos$y[edges[, 1]],
        pos$x[edges[, 2]], pos$y[edges[, 2]],
        col = "grey70"
    )

    points(pos$x, pos$y, pch = 21, bg = "skyblue", cex = 1.5)
    text(pos$x, pos$y, labels = features[1:n], cex = 0.7, pos = 3)
}
