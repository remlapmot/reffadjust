cap noi log cl _all
log using mytest.log, text replace

use https://www.bristol.ac.uk/cmm/media/runmlwin/tutorial, clear

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath("/Applications/MLwiN/mlnscript")

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(/Applications/MLwiN/mlnscript)

// set trace on
// cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(/Applications/MLwiN/mlnscript)
// set trace off

global MLwiN_path /Applications/MLwiN/mlnscript
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt)

global MLwiN_path "/Applications/MLwiN/mlnscript"
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt)

global MLwiNScript_path /Applications/MLwiN/mlnscript
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt)

global MLwiNScript_path "/Applications/MLwiN/mlnscript"
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt)

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinpath(/Applications/MLwiN/mlnscript)

set trace on
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinpath("/Applications/MLwiN/mlnscript")
set trace off

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(/Applications/MLwiN/mlnscript) batch

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons) mlwinscriptpath(/Applications/MLwiN/mlnscript)

log close
