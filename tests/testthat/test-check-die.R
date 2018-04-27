context("Check die arguments")

test_that("check_sides with ok vectors", {

  expect_true(check_sides(c('a', 'b', 'c', 'd', 'e', 'f')))
  expect_true(check_sides(c(1, 2, 3, 4, 5, 6)))
})


test_that("check_sides fails with invalid lengths", {

  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})


test_that("check_sides fails with invalid types", {

  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')),
               "\n'prob' must be a vector of length 6")
})


test_that("check_prob works with ok vectors", {

  expect_true(check_prob(c(0.5, 0.5, 0, 0, 0, 0)))
  expect_true(check_prob(c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)))
})


test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(1:5))
  expect_error(check_prob(1))
})


test_that("check_prob fails with invalid numbers", {

  expect_error(check_prob(0.333, 0.666, 0, 0, 0, 0))
  expect_error(check_prob(-0.5, 0.5, 1, 0, 0, 0))
  expect_error(check_prob(0.5, NA, 0.5, 0, 0, 0))
})

test_that("die is of class die", {
  expect_is(die(), "die")
})
