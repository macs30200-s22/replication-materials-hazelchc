# How does an increase in status affect the evaluation of quality?

The code is written in Python 3.9.7 and all of its dependencies can be installed by running the following in the terminal (with the requirements.txt file included in this repository):
```
pip install -r requirements.txt
```

### Introduction to the research
In this project, I would like to test whether an increase in status affects the evaluation of quality following the announcement of the award. I am using the difference-in-difference (DD) approach to compare changes in movie ratings over time between movies that won the award and the control movies that were nominated for the same award.


### Initial finding:
- An increase in status causes a decrease in the movie's average rating following the announcement of the award
  - As shown in the table, the ratings of award-winning movies after the winner is announced are on average 0.728 points (out of 10) lower than their nominated pairs
  - The results are marginally significant (i.e. p-value = 0.050) 

![initial finding](https://user-images.githubusercontent.com/89876546/165201939-c1ac8b81-0674-4733-a4bc-a496ddc9de69.png)


### Relevance to the RQ:
- The initial finding answers the first research question: getting an Oscars award leads to a decrease in the winning movie's average rating after the award announcement. This finding is in line with the existing studies on the dark side of attaining high organizational status. This raises the question of why, and I would further explore it.

### Details to replicate the findings:
1. Data collection 
- The code for scraping IMDB links and reviews for all movies can be found in [crawler.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/crawler.ipynb) . Running the code will produce [reviews.csv](https://uchicagoedu-my.sharepoint.com/:x:/g/personal/hazelchui_uchicago_edu/Eb0jEbeHjmZOsIdAMiBb_rcBjPIAtlaBR8F_QuQt6_bMDw?e=9cW7k1).

2. Data cleaning
- The code for cleaning (formatting movie names, handling missing data, constructing pre/post period, calculating average rating, counting review number, and merging) the scraped data can be found in [data_cleaning.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/data_cleaning.ipynb). Running the code will produce [final_data_2010_2019.csv](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/final_data_2010_2019.csv).

3. Regression analysis 
- Running the [regression.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/regression.ipynb) will generate the regression table as shown above.

### How to cite the replication materials 
Chui, H., Effects of status increase on the evaluation of quality, (2022), GitHub repository, https://github.com/macs30200-s22/replication-materials-hazelchc.git
