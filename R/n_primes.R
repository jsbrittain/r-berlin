get_n_primes <- function(n) {
  primes <- c()
  i <- 2
  while (length(primes) < n) {
    if (all(i %% primes != 0)) {
      primes <- c(primes, i)
    }
    i <- i + 1
  }
  return(primes)
}

