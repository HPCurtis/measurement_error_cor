# Bayesian measurement error models for correlation estimation

The following project is a direct python conversion of an R/WinBUGS based example of an advanced correlation measurement error model presented Behseta et al. (2009) and presented in said probabilistic programming language by Matzke et al.(2017) allowing for my production of this model in the more advanced and modern Stan probabilistic programming language (Carpenter et al. 2017) based of their open source code and using their simulated dataset provided at https://osf.io/mvz29/. 

## File structure
- README.md 
    - The file your reading right now.
- Hierachial_correlation_measurement_error.stan
    - Jupyter notebook containing the python code for the analsysis of the dataset. 
- stanfiles
    - measure_cor_error.stan: Stan file witht the code for the probalitic programme to generate measurement error model for correlation estiamtion udner measurement error.
- vis 
  - equations.png: PNG file of latex equatin for the measurement error model.
  - estimates.png: PNG file of model estimates and shrinkage due to proper measurment error control.
  - mu_trace_divergences.png: PNG file from the model presciption that generates divergeneces.
  - sigma_trace_divergences.png PNG file from the model presciption that generates divergeneces.
  - rho_ppc.png: PNG fro rho paramter that doesnt have divergences udner the model prescription.

## Stan
[Stan](https://mc-stan.org/) is the state-of-the-art platform for statistical modeling and high-performance statistical computation pioneering many of the modern probabilstic modelling methods and tools that this example demosntrates. These include non-centered parametrisations, LKJ priors and the Algorithms shouting at you when something goes wrong (specificaly here model divergences) (McElreath, 2020).  

## Measurement error model

![equations](vis/equations.png)

## Posterior predictive checks

![sigma_div](vis/sigma_trace_divergences.png)
![mu_div](vis/mu_trace_divergences.png)
![rho](vis/rho_ppc.png)
Fig 2: Postrior and trace plots for crtical model parameters

The plots for the sigma and mu parameter show the model under assumtions presenterd in teh equations above. Fitting this exact mdoel results in some divegences. An exercise for reader is to observe that increasing LKJ prior value $\geq$ 2 removes these divergences suggesting that with this data and compelxity of such a model some greater constraining of the parameters is needed for proper model fitting.

## Plot reproduction
![estimates](vis/estimates.png)
Fig 1.

# References

Behseta, S., Berdyyeva, T., Olson, C. R., & Kass, R. E. (2009). Bayesian correction for attenuation of correlation in multi-trial spike count data. Journal of neurophysiology, 101(4), 2186-2193.

Carpenter, B., Gelman, A., Hoffman, M. D., Lee, D., Goodrich, B., Betancourt, M., ... & Riddell, A. (2017). Stan: A probabilistic programming language. Journal of statistical software, 76.

Jeffreys, H. (1961). The theory of probability. OUP Oxford.

Matzke, D., Ly, A., Selker, R., Weeda, W. D., Scheibehenne, B., Lee, M. D., ... & Bouwmeester, S. (2017). Bayesian inference for correlations in the presence of measurement error and estimation uncertainty. Collabra: Psychology, 3(1).

McElreath, R. (2020). Statistical rethinking: A Bayesian course with examples in R and Stan.Boca Raton: CRC Press.