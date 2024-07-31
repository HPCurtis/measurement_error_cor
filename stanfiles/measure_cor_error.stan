data {
// Stan version of "Bayesian Inference for Correlations in the Presence of Measurement Error 
// and Estimation Uncertainty" WinBugs model

int<lower = 1> n; // Number of observations
int<lower = 1> J; // Number of groups

// Wide format data array containing 
// theta and beta observed values. This allows for vectorisation
// for more efficent sampling
array[n] vector[J] y;
array[n] vector[J] epsilon;

// Prior values must be integer as that is how ther specified in python
// to use real number these would need changing
int sigma_mu_theta;
int sigma_mu_beta;
int sigma_sigma_theta;
int sigma_sigma_beta;
int cor_val;
}
parameters {
  vector[J] mu;
  vector<lower = 0>[J] sigma;   
  array[n] vector[J] z;
  cholesky_factor_corr[J] rho;
}

transformed parameters {
// Non-centered parameterisation
array[n] vector[J] eta;
matrix[J, J] L = diag_pre_multiply(sigma, rho);
for (i in 1:n){
  eta[i,] = mu + L * z[i,];
    }
}

model{

//Priors
// Hyperpriors
mu ~ normal(0, sigma_mu_theta);
sigma ~ normal(0, sigma_sigma_theta);
rho ~ lkj_corr_cholesky(cor_val);

for(i in 1:n) {
    z[i,] ~ std_normal();
}

// likelihood
for (i in 1:n){
y[i,] ~ normal(eta[i,], epsilon[i, ]);  
}

}
generated quantities {
// Reassemble correlation matrix after cholesky decomposition.
  corr_matrix[J] rho_u = rho * rho';
}