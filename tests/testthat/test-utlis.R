library(testthat)
test_that("OmniIntegrate works correctly", {
    df1 <- data.frame(a = rnorm(5), b = rnorm(5))
    df2 <- data.frame(c = rnorm(5), d = rnorm(5))
    rownames(df1) <- rownames(df2) <- paste0("S", 1:5)
    result <- omni_integrate(df1, df2)
    expect_true(inherits(result, "OmniScope"))
    expect_equal(nrow(result$data), 5)
})
