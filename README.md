# Stata commands for random effects adjustment

The `reffadjust` package provides postestimation commands to perform adjustment of random effects estimates.

The `reffadjust` commands are:

- `reffadjustsim`: simulating from the distribution of random effect variances and covariances
- `reffadjust4nlcom`: regression coefficient formula to pass to `nlcom`.

Since multilevel models including random effects, such as those implemented in `MLwiN` and mixed/xtmixed, return estimates of the variances and covariances of the random effects and the corresponding variances and covariances of these estimates we can use these to estimate adjusted coefficients.

The approach is described in more detail in Macdonald-Wallis et al. (2012) and Palmer et al. (2014).

## Installation

To install, issue in Stata (in versions 13 and above):
```stata
net install reffadjust, from("https://raw.github.com/remlapmot/reffadjust/master/")
```

## References

- Macdonald-Wallis C, Lawlor DA, Palmer TM, Tilling K. 2012.  Multivariate multilevel spline models for parallel growth processes: application to weight and mean arterial pressure in pregnancy. Statistics in Medicine, 31, 3147-3164.
- Palmer TM, Macdonald-Wallis CM, Lawlor DA, Tilling K. Estimating adjusted associations between random effects from multilevel models: the reffadjust package. Stata Journal, 14, 1, 119-140. <https://www.stata-journal.com/article.html?article=st0327>

