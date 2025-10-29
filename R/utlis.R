#' Clean Omics Data
#'
#' @description Basic function to impute missing values and scale data.
#' @param df Data frame
#' @return Cleaned data frame
#' @export
clean_omics_data <- function(df) {
    df[is.na(df)] <- mean(df, na.rm = TRUE)
    df <- scale(df)
    as.data.frame(df)
}
