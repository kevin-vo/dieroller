#' @title Plot of object roll
#' @description Plots the relative frequencies of a series of rollss
#' @param x an object of class \code{"die"}
#' @export
#' @examples
#'  \dontrun{
#'  # create a die and roll it 100 times
#'  die1 <- die()
#'  roll1000 <- roll(die1, times = 1000)
#'
#'  plot(roll1000)
#'  }
plot.roll <- function(x) {
  freqs <- summary(x)$freqs$prop
  bp <- barplot(height = freqs, names.arg = x$sides, xlab = "sides of die", ylab = "relative frequencies")
  title(sprintf("Frequencies in a series of %s die rolls", x$total))
  text(x = bp, y = freqs, label = round(freqs, digits = 5), pos = 1, cex = 0.8, col = "red")
}
