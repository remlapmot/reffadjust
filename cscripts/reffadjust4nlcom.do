* 2023-01-25 Examples from reffadjust4nlcom helpfile

cscript reffadjust4nlcom adofiles reffadjust4nlcom

about

// Examples 1 & 2 assume the path to the MLwiN executable is set in global MLwiN_path; see runmlwin

if c(os) == "Windows" global MLwiN_path "C:\\Program Files\\MLwiN v3.09\\mlwin.exe"
if c(os) == "MacOSX" global MLwiN_path "/Applications/MLwiN/mlnscript" // requires runmlwin_mcmcdiagnostics.arm64 renamed to runmlwin_mcmcdiagnostics.plugin and manual installation of the files from https://ideas.repec.org/c/boc/bocode/s457335.html

if "$MLwiN_path" != "" {
// Example 1: Two level continuous response model (see page 59 of the MLwiN User Manual)
* read in data
use https://www.bristol.ac.uk/cmm/media/runmlwin/tutorial, clear

* fit model using MLwiN via runmlwin
runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

* report coefficient and delta-method confidence interval
reffadjust4nlcom cons standlrt, eqn(RP2)
nlcom `r(beta_standlrt)'

* compare reporting coefficient as median with 2.5 & 97.5 percentiles
// reffadjustsim cons standlrt, eqn(RP2) seed(12345)

* compare reporting coefficient as mean & Wald-type confidence interval
* Warning: mean and Wald-type confidence are inaccurate in this example
// reffadjustsim cons standlrt, eqn(RP2) seed(12345) waldtype

* to view just the coefficient or string expression for the coefficient
reffadjust4nlcom cons standlrt, eqn(RP2)
display `r(beta_standlrt)'
mata st_macroexpand("`r(beta_standlrt)'")

* compare with Bayesian posterior distribution
sort school student
runmlwin normexam cons standlrt, level1(student: cons) ///
    level2(school: cons standlrt) batch mcmc(on) initsprevious ///
    seed(121211)
mcmcsum, getchains
reffadjust4nlcom cons standlrt, eqn(RP2) mcmcsum
gen beta_standlrt = `r(beta_standlrt)'
mcmcsum beta_standlrt, variables

// Example 2: Multivariate response model (see page 214 of the MLwiN User Manual)
* read in data
use https://www.bristol.ac.uk/cmm/media/runmlwin/gcsemv1, clear

* fit model using MLwiN via runmlwin
runmlwin (written cons female, eq(1)) ///
    (csework cons female, eq(2)), ///
    level1(student: (cons, eq(1)) (cons, eq(2))) level2(school: (cons, eq(1)) (cons, eq(2))) batch

* report coefficient and delta-method confidence interval
reffadjust4nlcom cons_1 cons_2, eqn(RP2)
nlcom `r(beta_cons_2)'

* compare reporting coefficient as median with 2.5 and 97.5 percentiles
// reffadjustsim cons_1 cons_2, eqn(RP2) seed(12345)

* compare reporting coefficient as mean with Wald-type confidence interval
// reffadjustsim cons_1 cons_2, eqn(RP2) seed(12345) waldtype

* to view just the coefficient or string expression for the coefficient
reffadjust4nlcom cons_1 cons_2, eqn(RP2)
display `r(beta_cons_2)'
mata st_macroexpand("`r(beta_cons_2)'")

* compare with Bayesian posterior distribution
sort school student
runmlwin (written cons female, eq(1)) (csework cons female, eq(2)), ///
    level1(student: (cons, eq(1)) (cons, eq(2))) ///
    level2(school: (cons, eq(1)) (cons, eq(2))) batch mcmc(on) initsprevious seed(121211)
mcmcsum, getchains
reffadjust4nlcom cons_1 cons_2, eqn(RP2) mcmcsum
gen beta_cons_2 = `r(beta_cons_2)'
mcmcsum beta_cons_2, variables
}

// Example 3: based on xtmixed helpfile
webuse nlswork, clear
version 12: xtmixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns) var
version 12: reffadjust4nlcom _cons tenure, eqn(idcode)
nlcom `r(beta_tenure)'
version 13: mixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns)
reffadjust4nlcom _cons tenure, eqn(idcode)
nlcom `r(beta_tenure)'
mixed ln_w grade age c.age#c.age ttl_exp tenure c.tenure#c.tenure || idcode: tenure, cov(uns)
reffadjust4nlcom _cons tenure, eqn(idcode)
nlcom `r(beta_tenure)'

// Example 4: based on xtmelogit helpfile
webuse bangladesh, clear
version 12: xtmelogit c_use urban age child* || district: urban, cov(uns) var
version 12: reffadjust4nlcom _cons urban, eqn(district)
nlcom `r(beta_urban)'
version 13: meqrlogit c_use urban age child* || district: urban, cov(uns)
reffadjust4nlcom _cons urban, eqn(district)
nlcom `r(beta_urban)'
meqrlogit c_use urban age child* || district: urban, cov(uns)
reffadjust4nlcom _cons urban, eqn(district)
nlcom `r(beta_urban)'

// Example 5: based on xtmepoisson helpfile
webuse epilepsy, clear
version 12: xtmepoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) var intpoints(9)
version 12: reffadjust4nlcom _cons visit, eqn(subject)
nlcom `r(beta_visit)'
version 13: meqrpoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) intpoints(9)
reffadjust4nlcom _cons visit, eqn(subject)
nlcom `r(beta_visit)'
meqrpoisson seizures treat lbas lbas_trt lage visit || subject: visit, cov(uns) intpoints(9)
reffadjust4nlcom _cons visit, eqn(subject)
nlcom `r(beta_visit)'

// Example 6: repeated group variable
webuse nlswork, clear
version 12: xtmixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns) var
version 12: reffadjust4nlcom tenure union, eqn(idcode) sub(1)
nlcom `r(beta_union)'
version 12: reffadjust4nlcom race _cons, eqn(idcode) sub(2)
nlcom `r(beta__cons)'
version 13: mixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns)
reffadjust4nlcom tenure union, eqn(idcode) sub(1)
nlcom `r(beta_union)'
reffadjust4nlcom race _cons, eqn(idcode) sub(2)
nlcom `r(beta__cons)'
mixed ln_w grade age || idcode: tenure union, cov(uns) || idcode: race, cov(uns)
reffadjust4nlcom tenure union, eqn(idcode) sub(1)
nlcom `r(beta_union)'
reffadjust4nlcom race _cons, eqn(idcode) sub(2)
nlcom `r(beta__cons)'
