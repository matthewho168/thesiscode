// https://betanalpha.github.io/assets/case_studies/identifying_mixture_models.html

// The input data is a vector 'x' of length 'N'.
data {
  int<lower=0> N;
  vector[N] x;
}

// The parameters accepted by the model.
parameters {
  real mu1;
  real mu2;
  real<lower=0> sigma1;
  real<lower=0> sigma2;
  real<lower=0, upper=1> p1;
}

// The model to be estimated.
model {
  mu1 ~ normal(0, sqrt(10));
  mu2 ~ normal(0, sqrt(10));
  sigma1 ~ gamma(1,1);
  sigma2 ~ gamma(1,1);
  p1 ~ beta(1,1);
  for (k in 1:N) {
    target += log_mix(p1, 
                      normal_lpdf(x[k] | mu1, sigma1),
                      normal_lpdf(x[k] | mu2, sigma2));
  }
}

