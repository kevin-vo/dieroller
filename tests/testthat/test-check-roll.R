context("Check roll")

test_that("valid roll arguments", {
  expect_true(check_times(1))
  expect_true(check_times(5000000))
})

test_that("invalid roll arguments", {
  expect_error(check_times(0), "\nargument 'times' must be a positive integer")
  expect_error(check_times(-1), "\nargument 'times' must be a positive integer")
  expect_error(check_times("hello"), "\nargument 'times' must be a positive integer")
})

test_that("object of class 'rolls'", {
  fair_die <- die()
  set.seed(123)
  fair50 <- roll(fair_die, times = 50)
  expect_is(fair50, "roll")
})

test_that("rolls work correctly", {
  fair_die <- die()
  set.seed(123)
  fair_50 <- roll(fair_die, times = 50)
  expect_equal(names(fair_50), c("rolls", "sides", "prob", "total"))
  expect_equal(fair_50$sides, c(1, 2, 3, 4, 5, 6))
  expect_equal(fair_50$prob, c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))
  expect_equal(fair_50$total, 50)
})

test_that("summary works correctly", {
  set.seed(123)
  fair_die <- die()
  fair_50rolls <- roll(fair_die, times = 50)
  fair50_sum <- summary(fair_50rolls)
  expect_equal(class(fair50_sum), "summary.roll")
  expect_equal(names(fair50_sum), "freqs")
})

test_that("extraction, replacement methods", {
  set.seed(123)
  fair_die <- die()
  fair500 <- roll(fair_die, times = 500)
  expect_equal(fair500[500], 6)
  fair500[500] <- 1
  expect_equal(fair500[500], 1)


})
