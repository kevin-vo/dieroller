% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/die.R
\name{die}
\alias{die}
\alias{is.die}
\title{Die}
\usage{
die(sides = c(1, 2, 3, 4, 5, 6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))

is.die(x)
}
\arguments{
\item{sides}{vector of die sides}

\item{prob}{vector of side probabilities}

\item{x}{an R object}
}
\value{
an object of class \code{"die"}
}
\description{
Creates an object of class \code{"die"}
}
\examples{
# default
die1 <- die()

# another die
die2 <- die(c('one', 'two', 'three', 'four', 'five', 'six'))

# loaded die
loaded <- die(prob = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.5))

}
\seealso{
\code{\link{roll}}
}
