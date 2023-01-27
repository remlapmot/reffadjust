* 2023-01-25 reffadjustsim cscript

cscript reffadjustsim adofiles reffadjustsim

// Examples 1 & 2 assume the path to the MLwiN executable is set in global MLwiN_path; see runmlwin

if c(os) == "Windows" global MLwiN_path "C:\\Program Files\\MLwiN v3.06\\mlwin.exe"

if "$MLwiN_path" != "" {
// Example 1: Two level continuous response model (see page 59 of the MLwiN User Manual)
* read in data
use https://www.bristol.ac.uk/cmm/media/runmlwin/tutorial, clear

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
runmlwin normexam cons standlrt, level1(student: cons) ///
    level2(school: cons standlrt) batch mcmc(on) initsprevious seed(121211)
mcmcsum, getchains
reffadjustsim cons standlrt, eqn(RP2) mcmcsum

// Example 2: Multivariate response model (see page 214 of the MLwiN User Manual)
* read in data
use https://www.bristol.ac.uk/cmm/media/runmlwin/gcsemv1, clear

* fit model using MLwiN via runmlwin
runmlwin (written cons female, eq(1)) (csework cons female, eq(2)), ///
    level1(student: (cons, eq(1)) (cons, eq(2))) ///
    level2(school: (cons, eq(1)) (cons, eq(2))) batch

* report coefficient as median with 2.5 and 97.5 percentiles
reffadjustsim cons_1 cons_2, eqn(RP2) seed(12345)

* report coefficient as mean with Wald-type confidence interval
reffadjustsim cons_1 cons_2, eqn(RP2) seed(12345) waldtype

* compare with delta-method confidence interval (first refit model)
runmlwin (written cons female, eq(1)) (csework cons female, eq(2)), ///
    level1(student: (cons, eq(1)) (cons, eq(2))) ///
    level2(school: (cons, eq(1)) (cons, eq(2))) batch
reffadjust4nlcom cons_1 cons_2, eqn(RP2)
nlcom `r(beta_cons_2)'

* compare with Bayesian posterior distribution
runmlwin (written cons female, eq(1)) (csework cons female, eq(2)), ///
    level1(student: (cons, eq(1)) (cons, eq(2))) ///
    level2(school: (cons, eq(1)) (cons, eq(2))) batch mcmc(on) initsprevious seed(121211)
mcmcsum, getchains
reffadjustsim cons_1 cons_2, eqn(RP2) mcmcsum
}

// Example 3: based on xtmixed helpfile
webuse nlswork, clear
version 12: xtmixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns) var
version 12: reffadjustsim _cons tenure, eqn(idcode) seed(12345)
version 13: mixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns)
reffadjustsim _cons tenure, eqn(idcode) seed(12345)
mixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns)
reffadjustsim _cons tenure, eqn(idcode) seed(12345)

// Example 4: based on xtmelogit helpfile
webuse bangladesh, clear
version 12: xtmelogit c_use urban age child* || district: urban, cov(uns) var
version 12: reffadjustsim _cons urban, eqn(district) seed(12345)
webuse bangladesh, clear
version 13: meqrlogit c_use urban age child* || district: urban, cov(uns)
reffadjustsim _cons urban, eqn(district) seed(12345)
webuse bangladesh, clear
meqrlogit c_use urban age child* || district: urban, cov(uns)
reffadjustsim _cons urban, eqn(district) seed(12345)

// Example 5: based on xtmepoisson helpfile
webuse epilepsy, clear
version 12: xtmepoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) var intpoints(9)
version 12: reffadjustsim _cons visit, eqn(subject) seed(12345)
version 13: meqrpoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) intpoints(9)
reffadjustsim _cons visit, eqn(subject) seed(12345)
meqrpoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) intpoints(9)
reffadjustsim _cons visit, eqn(subject) seed(12345)

// Example 6: repeated group variable
webuse nlswork, clear
version 12: xtmixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns) var
version 12: reffadjustsim tenure union, eqn(idcode) sub(1) seed(12345)
version 12: reffadjustsim race _cons, eqn(idcode) sub(2) seed(12345)
version 13: mixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns)
reffadjustsim tenure union, eqn(idcode) sub(1) seed(12345)
reffadjustsim race _cons, eqn(idcode) sub(2) seed(12345)
mixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns)
reffadjustsim tenure union, eqn(idcode) sub(1) seed(12345)
reffadjustsim race _cons, eqn(idcode) sub(2) seed(12345)
