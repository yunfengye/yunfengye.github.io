# Simulate 1,000 observations from the simple model logit(pi_i) = beta_0 + b_i for i = 1, ..., n
#   individuals, where b_i ~ N(0, sigma^2). Thus, the model is simply an intercept plus a random effect.
#   The two parameters that need to be estimated are beta_0 and sigma.

################################################################################
# Simulate data

  n <- 1000  # Number of binomial observations
  beta0 <- 1
  sigma <- 2
  individual <- 1:n  # Indicates observation number
  numb.trials <- 10  # n_i - be careful with notation
  trials <- rep(x = numb.trials, times = n)

  # Simulate the response Y
  set.seed(8182)
  b <- rnorm(n = n, mean = 0, sd = sigma)
  pi.i <- plogis(beta0 + b)
  y <- rbinom(n = n, size = numb.trials, prob = pi.i)

  #Export data
  setwd(dir = "C:\\chris\\unl\\Dropbox\\NEW\\STAT_computing\\Integrate")
  set1 <- data.frame(y, trials, individual)
  write.table(x = set1, file = "glmm_data.txt", row.names = FALSE, quote = FALSE)


################################################################################
