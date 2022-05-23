set more off
clear all
cd "/Users/hazelchui/Desktop/UChicago/Perspectives"

import delimited using final_decomp_2, delimiter(comma)  bindquote(strict) case(preserve) clear
//graph bar rating , over(winner, sort(1) descending relabel(1 "Nominated-only" 2 "Winner")) over(period, relabel(1 "Before" 2 "After"))
	
drop if year ==2020

** Graph making
// 30-day period
drop if between >30
drop if between <-30

collapse (mean) rating, by(between winner)
line rating between if winner == 0 || ///
line rating between if winner == 1, xline(0) ///
legend(label(1 Nominated-only) label(2 Winner)) ///
xtitle("Time before/since winner is announced (in days)") ///
xlabel(#10)

** Regression
* summary stats
sort period winner
by period winner: summarize rating 

* histogram
histogram rating, frequency 

collapse (count)rating, by(period winner)
/*p	w	rating
0	0	26361
0	1	6454
1	0	9891
1	1	4304*/

* correlation matrix
asdoc sum rating winner review_perc_change
asdoc pwcorr rating winner review_perc_change, star(all), append save

* did reg 
gen winnerxperiod = winner*period
reg rating winner period i.year
outreg2 using reg_results.doc
reg rating winner period winnerxperiod
outreg2 using reg_results.doc
* marginsplot
reg rating period##winner
margins period#winner
marginsplot, plot(,label( "Nominated-only" "Winner")) ///
ytitle("Predicted average rating") ///
title("Adjusted predictions of period x winner with 95% Cls ") ///
ylabel(6.5(0.25) 8.0)
//reghdfe rating winner period winnerxperiod, absorb(year)

* explain rating when period == 1
drop if winner == 0
gen winnerxdiff = winner*diff_excl_1
reg rating winnerxdiff winner diff_excl_1
reg diff_excl_1 winner


**********************************************************
// group by 10 days 
gen day_10 = .
replace day_10 = 0 if announcement_day == 1
replace day_10 = 1 if 10>= between &  between >=1
replace day_10 = 2 if 20>= between &  between>= 11
replace day_10 = 3 if 30>= between &  between>= 21
replace day_10 = -1 if -1 >= between &  between>= -10
replace day_10 = -2 if -11 >= between &  between>= -20
replace day_10 = -3 if -21 >= between &  between>= -30

// for making graphs
gen periods = .
replace periods = 0 if announcement_day == 1
replace periods = 1 if post_1 == 1
replace periods = 2 if post_2 == 1
replace periods = 3 if post_3 == 1
replace periods = -1 if pre_1 == 1
replace periods = -2 if pre_2 == 1
replace periods = -3 if pre_3 == 1



** Alternative command
//diff rating, t(winner) p(period) 

** decomposition 
reg winner review_perc_change diff_incl_sd_1
predict resid_winner, residuals
reg winner review_perc_change diff_excl_perc_1
predict resid_winner_2, residuals
//export delimited using decomp_resid_2.csv, replace

* Regression
gen review_did = fit_review * period
gen diff_did = fit_diff * period
gen beta_resid_did = beta_resid * period
reghdfe rating winner period review_did diff_did beta_resid_did, absorb(year)
reghdfe rating winner period winnerxperiod, absorb(year)

summarize fit_review  fit_diff beta_resid


**** mediation analysis
drop if period == 0
reg rating winner
//outreg2 using reg_results_2.doc, replace
reg winner review_perc_change
outreg2 using reg_results_2.doc
reg rating  winner review_perc_change
outreg2 using reg_results_2.doc

reg review_perc_change winner
outreg2 using reg_results_2.doc, replace
reg rating winner##c.review_perc_change 
outreg2 using reg_results_2.doc


sgmediation2 rating, iv(winner) mv(review_perc_change) 
outreg2 using reg_results_2.doc

bootstrap r(ind_eff), reps(1000): sgmediation2 rating, iv(winner) mv(review_perc_change)
estat bootstrap, percentile
reg rating winner diff_excl_1

sort period winner
by period winner: summarize diff_excl_1 



