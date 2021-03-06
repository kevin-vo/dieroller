#' @title Roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#' @examples
#' die1 <- die()
#'
#' # roll a die 10 times
#' roll10 <- roll(die1, times = 10)
#'
#' # add 5 more rolls
#' roll15 <- roll10 + 5
roll <- function(die, times = 1) {
  check_times(times)
  rolls <- rolls(die, times = times)
  make_roll(die, rolls)
}


# private function to check vector of 'times'
check_times <- function(times) {
  if (times <= 0 | !is.numeric(times)) {
    stop("\nargument 'times' must be a positive integer")
  } else {
    TRUE
  }
}


# private function
rolls <- function(x, times = 1) {
  sample(x$sides, size = times, replace = TRUE, prob = x$prob)
}


#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param die object of class die
#' @param rolls object of class rolls
#' @keywords internal
make_roll <- function(die, rolls) {
  res <- list(
    rolls = rolls,
    sides = die$sides,
    prob = die$prob,
    total = length(rolls))
  class(res) <- "roll"
  res
}



#' @export
print.roll <- function(x, ...) {
  cat('object "roll"\n\n')
  cat('$rolls\n')
  cat(x$rolls, "\n")
  invisible(x)
}


#' @export
summary.roll <- function(object, ...) {
  proportions <- c(
    sum(object$rolls == object$sides[1]) / object$total,
    sum(object$rolls == object$sides[2]) / object$total,
    sum(object$rolls == object$sides[3]) / object$total,
    sum(object$rolls == object$sides[4]) / object$total,
    sum(object$rolls == object$sides[5]) / object$total,
    sum(object$rolls == object$sides[6]) / object$total
  )

  counts <- c(
    sum(object$rolls == object$sides[1]),
    sum(object$rolls == object$sides[2]),
    sum(object$rolls == object$sides[3]),
    sum(object$rolls == object$sides[4]),
    sum(object$rolls == object$sides[5]),
    sum(object$rolls == object$sides[6])
  )
  freqs <- data.frame(
    side = object$sides,
    count = counts,
    prop = proportions)
  obj <- list(freqs = freqs)
  class(obj) <- "summary.roll"
  obj
}


#' @export
print.summary.roll <- function(x, ...) {
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}


#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != x$sides[1] &
      value != x$sides[2] &
      value != x$sides[3] &
      value != x$sides[4] &
      value != x$sides[5] &
      value != x$sides[6]) {
    stop(sprintf('\nreplacing value must be %s, %s, %s, %s, %s, or  %s',
                 x$sides[1],
                 x$sides[2],
                 x$sides[3],
                 x$sides[4],
                 x$sides[5],
                 x$sides[6]))
  }
  if (i > x$total) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  make_roll(die(sides = x$sides, prob = x$prob), x$rolls)
}


#' @export
"[.roll" <- function(x, i) {
  x$rolls[i]
}


#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increament")
  }
  d <- die(sides = obj$sides, prob = obj$prob)
  more_rolls <- rolls(d, times = incr)
  make_roll(d, c(obj$rolls, more_rolls))
}


#' @rdname roll
#' @param x an R object
#' @export
is.roll <- function(x) {
  inherits(x, "roll")
}


#' @rdname roll
#' @export
as.roll <- function(x) {
  x_die <- die(unique(x))
  make_roll(x_die, x)
}
