# Stata commands for random effects adjustment: the reffadjust package

The `reffadjust` package provides postestimation commands to perform adjustment of random effects estimates.

The `reffadjust` commands are:

- `reffadjustsim`: simulating from the distribution of random effect variances and covariances
- `reffadjust4nlcom`: regression coefficient formula to pass to `nlcom`.

Since multilevel models including random effects, such as those implemented in `MLwiN` and `mixed`/`xtmixed`, return estimates of the variances and covariances of the random effects and the corresponding variances and covariances of these estimates we can use these to estimate adjusted coefficients.

The approach is described in more detail in Macdonald-Wallis et al. (2012) and Palmer et al. (2014).

## Installation

To install, issue in Stata (in versions 13 and above) using the **github** package, first install the **github** package:
```stata
net install github, from("https://haghish.github.io/github/")
```
then run
```stata
github install remlapmot/reffadjust
```

Alternatively use `net install` directly as follows
```stata
net install reffadjust, from("https://raw.github.com/remlapmot/reffadjust/master/")
```

## Acknowledgements

Thanks to Gemma Clayton for helpful comments.

## References

- Macdonald-Wallis C, Lawlor DA, Palmer TM, Tilling K. 2012. Multivariate multilevel spline models for parallel growth processes: application to weight and mean arterial pressure in pregnancy. Statistics in Medicine, 31, 26, 3147-3164. <https://doi.org/10.1002/sim.5385>
- Palmer TM, Macdonald-Wallis CM, Lawlor DA, Tilling K. Estimating adjusted associations between random effects from multilevel models: the reffadjust package. Stata Journal, 14, 1, 119-140. <https://www.stata-journal.com/article.html?article=st0327>
