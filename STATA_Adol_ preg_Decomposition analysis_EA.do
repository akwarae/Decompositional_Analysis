*-------------------------------------------------------------------*
* KDHS Adolescent Pregnancy Decompositional Analysis
* Author: Dr. Elsie Akwara, PhD, MPH
* Date: May 3rd, 2024
* Description: Decompose changes in adolescent pregnancy (<19 years) 
*              using 2008, 2014, 2022 KDHS cleaned datasets.
*-------------------------------------------------------------------*

clear all
set more off

*--- Set working directory (change to your path) ---*
cd "your/working/directory/cleaned_data"

*----------------------*
* Load 2008 data
*----------------------*
import delimited using "kdhs_2008_clean.csv", clear

* Recode outcome variable to binary
gen adolescent_preg_2008 = adolescent_pregnancy
label variable adolescent_preg_2008 "Adolescent Pregnancy (2008)"

* Save 2008 data for merging later
tempfile data2008
save `data2008'

*----------------------*
* Load 2014 data
*----------------------*
import delimited using "kdhs_2014_clean.csv", clear

gen adolescent_preg_2014 = adolescent_pregnancy
label variable adolescent_preg_2014 "Adolescent Pregnancy (2014)"

* Save 2014 data for merging later
tempfile data2014
save `data2014'

*----------------------*
* Load 2022 data
*----------------------*
import delimited using "kdhs_2022_clean.csv", clear

gen adolescent_preg_2022 = adolescent_pregnancy
label variable adolescent_preg_2022 "Adolescent Pregnancy (2022)"

* Save 2022 data for merging later
tempfile data2022
save `data2022'

*------------------------------------------------------------------*
* Decomposition: Compare 2008 vs 2014
*------------------------------------------------------------------*

* Load 2014 data for analysis
use `data2014', clear

* Keep variables of interest
keep adolescent_preg_2014 education_level wealth_index residence region media_exposure marital_status employment_status

* Encode categorical variables to numeric for decomposition
encode education_level, gen(ed_level)
encode wealth_index, gen(wealth)
encode residence, gen(resid)
encode region, gen(reg)
encode media_exposure, gen(media)
encode marital_status, gen(marital)
encode employment_status, gen(emp)

* Logistic regression for 2014
logit adolescent_preg_2014 i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp

* Save estimates
estimates store model2014

* Load 2008 data
use `data2008', clear

* Keep and encode same vars
keep adolescent_preg_2008 education_level wealth_index residence region media_exposure marital_status employment_status

encode education_level, gen(ed_level)
encode wealth_index, gen(wealth)
encode residence, gen(resid)
encode region, gen(reg)
encode media_exposure, gen(media)
encode marital_status, gen(marital)
encode employment_status, gen(emp)

* Logistic regression for 2008
logit adolescent_preg_2008 i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp

* Save estimates
estimates store model2008

* Install mvdcmp if not installed (run once)
cap which mvdcmp
if _rc ssc install mvdcmp

* Run mvdcmp for decomposition (logit models, 2008 vs 2014)
mvdcmp adolescent_preg_2014 adolescent_preg_2008, ///
    indep(i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp) ///
    wlogit

*------------------------------------------------------------------*
* Decomposition: Compare 2014 vs 2022
*------------------------------------------------------------------*

* Repeat similar steps for 2014 vs 2022

* Load 2022 data
use `data2022', clear

keep adolescent_preg_2022 education_level wealth_index residence region media_exposure marital_status employment_status

encode education_level, gen(ed_level)
encode wealth_index, gen(wealth)
encode residence, gen(resid)
encode region, gen(reg)
encode media_exposure, gen(media)
encode marital_status, gen(marital)
encode employment_status, gen(emp)

logit adolescent_preg_2022 i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp
estimates store model2022

* Load 2014 data
use `data2014', clear

keep adolescent_preg_2014 education_level wealth_index residence region media_exposure marital_status employment_status

encode education_level, gen(ed_level)
encode wealth_index, gen(wealth)
encode residence, gen(resid)
encode region, gen(reg)
encode media_exposure, gen(media)
encode marital_status, gen(marital)
encode employment_status, gen(emp)

logit adolescent_preg_2014 i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp
estimates store model2014b

* Decompose 2014 vs 2022
mvdcmp adolescent_preg_2022 adolescent_preg_2014, ///
    indep(i.ed_level i.wealth i.resid i.reg i.media i.marital i.emp) ///
    wlogit

*------------------------------------------------------------------*
* Save output to log file
*------------------------------------------------------------------*
log using "../results/decomposition_log.smcl", replace
* (re-run decomposition commands here if needed)
log close

