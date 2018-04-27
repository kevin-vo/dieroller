#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of side probabilities
#' @return an object of class \code{"die"}
#' @seealso \code{\link{roll}}
#' @export
#' @examples
#' # default
#' die1 <- die()
#'
#' # another die
#' die2 <- die(c('one', 'two', 'three', 'four', 'five', 'six'))
#'
#' # loaded die
#' loaded <- die(prob = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.5))
#'
die <- function(sides = c(1, 2, 3, 4, 5, 6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)) {
  check_sides(sides)
  check_prob(prob)

  object <- list(
    sides = sides,
    prob = prob)
  class(object) <- "die"
  object
}


# private function to check vector of sides
check_sides <- function(sides) {
  if (length(sides) != 6) {
    stop("\n'prob' must be a vector of length 6")
  }
  if (!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }
  TRUE
}


# private function to check vector of probabilities
check_prob <- function(prob) {
  if (length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }
  if (any(is.na(prob))) {
    stop("\n'prob' cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1) {
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}



#' @export
print.die <- function(x, ...) {
  cat('object "die"\n\n')
  df <- data.frame(sides = x$sides, prob = x$prob)
  print(df)

}


#' @rdname die
#' @param x an R object
#' @export
is.die <- function(x) {
  is(x, "die")
}
