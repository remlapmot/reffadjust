cap noi log cl _all
log using mytest.log, text replace

use https://www.bristol.ac.uk/cmm/media/runmlwin/tutorial, clear

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(C:/Program Files/MLwiN v3.07/mlnscript.exe) batch

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(C:/Program Files/MLwiN v3.07/mlnscript.exe) batch

// set trace on
// cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(/Applications/MLwiN/mlnscript)
// set trace off

global MLwiN_path C:/Program Files/MLwiN v3.07/mlnscript.exe
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

global MLwiN_path "C:/Program Files/MLwiN v3.07/mlnscript.exe"
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

global MLwiNScript_path C:/Program Files/MLwiN v3.07/mlnscript.exe
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

global MLwiNScript_path "C:/Program Files/MLwiN v3.07/mlnscript.exe"
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) batch

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinpath(C:/Program Files/MLwiN v3.07/mlnscript.exe) batch

// set trace on
cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinpath("C:/Program Files/MLwiN v3.07/mlnscript.exe") batch
// set trace off

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons standlrt) mlwinscriptpath(C:/Program Files/MLwiN v3.07/mlnscript.exe) batch

cap noi runmlwin normexam cons standlrt, level1(student: cons) level2(school: cons) mlwinscriptpath(C:/Program Files/MLwiN v3.07/mlnscript.exe) batch

log close
