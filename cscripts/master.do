* master do-file for running cscripts
* 2023-01-25

local path = subinstr("`c(pwd)'", "cscripts", "", 1)
cap noi adopath ++ "`path'"

cap noi log close _all
log using master.log, text replace name(master)

cscript master

cap noi ado describe reffadjust

local cscripts ///
    reffadjust4nlcom ///
    reffadjustsim

foreach dofile of local cscripts {
    log using `dofile'.log, text replace name(`dofile')
    do `dofile'
    log close `dofile'
}

log close _all

cap noi adopath - "`path'"
