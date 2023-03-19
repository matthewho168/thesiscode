// The input data is a vector 'x' of length 'N', and a vector 'y' of length 'N' with output 0 or 1.
data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0,upper=1> y[N];
}

// The parameters accepted by the model.
parameters {
  real alpha;
  real beta;
}

// The model to be estimated. 
model {
  y ~ bernoulli_logit(alpha + x * beta);
}

