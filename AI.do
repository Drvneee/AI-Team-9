********************AI********************************************
*******29/07/2020*****************************
cd "h:\Desktop\Irvine"
clear
capture log close
set more off
log using artficialint.log, replace

use AI.dta
****************************************************************************
browse
tab countryregion 
*keep countryregion confirmed deaths recovered
sort countryregion
drop if countryregion!="South Africa" 
sort observationdate
drop lastupdate

*******************************************Line Graphs*****
gen Day= _n
line confirmed recovered Day

*****************************************************************
****************Scatter Plot Active Cases**********************

gen activecases=confirmed-recovered
scatter activecases Day
scatter deaths activecases || lfit deaths activecases
regress deaths activecases

***********************************************
*******************Predicting a Quadratic Model*****************
*twoway qfit activecases Day


save SouthAfrica,replace