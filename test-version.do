log close _all
log using test-version.log, text replace
di c(version), c(userversion), c(stata_version)

version 13
di c(version), c(userversion), c(stata_version)

version 17: di c(version), c(userversion), c(stata_version)

version 13, user
di c(version), c(userversion), c(stata_version)

version 14.0
di c(version), c(userversion), c(stata_version)

cap noi prog drop mytestprog
program mytestprog
di c(version), c(userversion), c(stata_version)
version 13
di c(version), c(userversion), c(stata_version)

version 13, user
di c(version), c(userversion), c(stata_version)

version 17: di c(version), c(userversion), c(stata_version)

di c(version), c(userversion), c(stata_version)

version 14.0
di c(version), c(userversion), c(stata_version)
end

version 17

mytestprog

mytestprog2
log cl
