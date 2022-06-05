# An Honor or a Curse? Effect of Winning Awards on the Evaluation of Movies’ Quality

The code is written in Python 3.9.7 and all of its dependencies can be installed by running the following in the terminal (with the requirements.txt file included in this repository):
```
pip install -r requirements.txt
```

### Introduction to the research
In this project, I would like to test whether an increase in status affects the evaluation of quality following the announcement of the award. I am using the difference-in-difference (DD) approach to compare changes in movie ratings over time between movies that won the award and the control movies that were nominated for the same award.


### Findings:
- An increase in status causes a sharper decrease in the movie's rating following the announcement of the award
  - As shown in Table 1, the ratings of award-winning movies after the winner is announced are on average 0.655 points (out of 10) lower than their nominated-only movies
  - The results are statistically significant (i.e. p-value < 0.01) 

  Table 1. Effect of Winning an Award on the rating before and after the award announcement
  ![Screenshot 2022-05-23 at 9 37 37 PM](https://user-images.githubusercontent.com/89876546/169937301-e6c9d9dd-7dc5-43c6-9b5b-bc87860776ff.png)

- When there is an increase in the percentage point of the review number, winning movies are predicted to have a lower rating
  - As shown in Table 2, a percentage point increase in the no. of reviews is associated with a lower rating for winning movies, not the nominated only movies

  Table 2. Effect of winning an Award on selected variables after the award announcement
  ![Screenshot 2022-05-23 at 9 40 36 PM](https://user-images.githubusercontent.com/89876546/169937639-4c72cbb1-0009-4f23-b240-b1c373f66fd1.png)

### Relevance to the RQ:
- The findings answer the research questions: getting an Oscars award leads to a decrease in the winning movie's rating after the award announcement. The reason for a shaper decrease in ratings may be due to the popularity of winnig movies, which attract more auidences of diverse tastes. The findings are in line with the existing studies on the dark side of attaining high organizational status.

### Details to replicate the findings:
1. Data collection 
- The code for scraping IMDB links and reviews for all movies can be found in [crawler.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/crawler.ipynb) . Running the code will produce [reviews.csv](https://uchicagoedu-my.sharepoint.com/:x:/g/personal/hazelchui_uchicago_edu/Eb0jEbeHjmZOsIdAMiBb_rcBjPIAtlaBR8F_QuQt6_bMDw?e=9cW7k1).

2. Data cleaning
- The code for cleaning (formatting movie names, handling missing data, constructing pre/post period, counting review number, and merging) the scraped data can be found in [data_cleaning.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/data_cleaning.ipynb). Running the code will produce [final_decomp_2.csv](https://uchicagoedu-my.sharepoint.com/:x:/g/personal/hazelchui_uchicago_edu/EYHkT9HcPmVChhTDk3ov4RYBvDRUCoiRVqtHV6-8kRkMxQ?e=NmpWrs).

3. Regression analysis 
- Running the [regression.ipynb](https://github.com/macs30200-s22/replication-materials-hazelchc/blob/main/regression.ipynb) will generate the regression table as shown above.

### How to cite the replication materials 
Chui, H., An Honor or a Curse? Effect of Winning Awards on the Evaluation of Movies’ Quality, (2022), GitHub repository, https://github.com/macs30200-s22/replication-materials-hazelchc.git
