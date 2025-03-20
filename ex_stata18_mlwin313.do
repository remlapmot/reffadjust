 **Example 1: Two level continuous response model (see page 59 of the MLwiN User Manual)

* read in data
use http://www.bristol.ac.uk/cmm/media/runmlwin/tutorial, clear

* Identify the location of MLwiN
global MLwiN_path C:\Program Files\MLwiN v3.13\mlwin.exe

* fit model using MLwiN via runmlwin
runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

* report coefficient as median with 2.5 & 97.5 percentiles
reffadjustsim cons standlrt, eqn(RP2) seed(12345)

* report coefficient as mean & Wald-type confidence interval
* Warning: mean and Wald-type confidence are inaccurate in this example
reffadjustsim cons standlrt, eqn(RP2) seed(12345) waldtype

* compare with delta-method confidence interval (first refit model)
runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch
reffadjust4nlcom cons standlrt, eqn(RP2)
nlcom `r(beta_standlrt)'

* compare with Bayesian posterior distribution
runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch mcmc(on) initsprevious seed(121211)
mcmcsum, getchains
reffadjustsim cons standlrt, eqn(RP2) mcmcsum


