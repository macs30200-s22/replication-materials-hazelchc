# Week 4: Collected data and initial findings

RQ:How does an increase in status affect the evaluation of quality?

Initial finding:
- An increase in status causes a decrease in the movie's average rating following the announcement of the award
  - The results are marginally significant

DIFFERENCE-IN-DIFFERENCES ESTIMATION RESULTS
Number of observations in the DIFF-IN-DIFF: 116
            Before         After    
   Control: 29             29          58
   Treated: 29             29          58
            58             58
--------------------------------------------------------
 Outcome var.   | rating  | S. Err. |   |t|   |  P>|t|
----------------+---------+---------+---------+---------
Before          |         |         |         | 
   Control      | 7.667   |         |         | 
   Treated      | 7.954   |         |         | 
   Diff (T-C)   | 0.287   | 0.260   | 1.10    | 0.272
After           |         |         |         | 
   Control      | 7.846   |         |         | 
   Treated      | 7.405   |         |         | 
   Diff (T-C)   | -0.442  | 0.260   | 1.70    | 0.092*
                |         |         |         | 
Diff-in-Diff    | -0.729  | 0.368   | 1.98    | 0.050*
--------------------------------------------------------
R-square:    0.04
* Means and Standard Errors are estimated by linear regression
**Inference: *** p<0.01; ** p<0.05; * p<0.1


Relevance to the RQ:
- The initial finding answers the first research question: getting an Oscars award leads to a decrease in the winning movie's average rating after the award announcement. This finding is in line with the existing studies on the dark side of the organizational status.

Details to replicate the findings:


