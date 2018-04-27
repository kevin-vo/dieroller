
<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.

-   `die()` creates a coin object (of class `"die"`)
-   `roll()` tosses a coin object, producing a `"roll"` object.
-   `plot()` method for a `"roll"` object to plot frequencies of a series of rolls.
-   `summary()` method for a `"roll"` object.

Motivation
----------

This package has been developed to illustrate some of the concepts behind the creation of an R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "dieroller" (without vignettes)
devtools::install_github("kevin-vo/dieroller")

# install "dieroller" (with vignettes)
devtools::install_github("kevin-vo/dieroller", build_vignettes = TRUE)
```

Usage
-----

``` r
library(dieroller)

# default die
die1 <- die()
die1
#> object "die"
#> 
#>   sides      prob
#> 1     1 0.1666667
#> 2     2 0.1666667
#> 3     3 0.1666667
#> 4     4 0.1666667
#> 5     5 0.1666667
#> 6     6 0.1666667

# 1 roll of die1
roll(die1)
#> object "roll"
#> 
#> $rolls
#> 1

# 10 rolls of die1
roll10 <- roll(die1, times = 10)
roll10
#> object "roll"
#> 
#> $rolls
#> 6 1 4 1 6 6 5 2 6 3

# summary
summary(roll10)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     2  0.2
#> 2    2     1  0.1
#> 3    3     1  0.1
#> 4    4     1  0.1
#> 5    5     1  0.1
#> 6    6     4  0.4


# 100 rolls
roll100 <- roll(die1, times = 100)

# summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    17 0.17
#> 2    2    18 0.18
#> 3    3    15 0.15
#> 4    4    16 0.16
#> 5    5    19 0.19
#> 6    6    15 0.15
```
