
<p align="center">
<!-- <img width="530" height="300" src="https://user-images.githubusercontent.com/74840026/140004825-00753ac5-3e41-482a-800c-8b792967c14b.png"> -->                             <img width="586" alt="webpage front" src="https://user-images.githubusercontent.com/74840026/142775760-152411c2-ccab-4981-be8a-6e9a7d0cc7d8.png">
    
<h3 align="center">NBA Machine Learning Predictions</h3>

  <p align="center">
    Can we predict the winner of the 2022 NBA season using Machine Learning?
</p>
    
    
# NBA Predictions
- View the webpage here: [NBA Predictions](https://boyerjason700.github.io/Final_project/)

- Based on the statistics of NBA Champions from past seasons, can we predict the winner of the current NBA Season (2021-22) using the teams current stats?
- The use of statistics in sports has been evolving for years. For example, in NBA, a basic box score with minutes played, points, rebounds and a few other stats was the standard. But now we can go to NBA.com and not only see traditional stats but with improved technology, in-depth statistics are available down to individual players on different types of plays, or even for teams on how different lineup of players have performed. Other sites such as FiveThirtyEight have created their own unique rating systems for players and teams to gauge their performance.
- We know that winning a championship goes beyond the number of wins and losses a team has in the regular season. So, for our project we used data available from basketball-reference.com to look at different advance stats for NBA teams over the past 30 years to train and test 3 different machine learning (ML) models, to see if we could predict a champion for the current season. Using our ML models, we will also be able to see what statistics had the most important, when determining a champion.


# Project outline

## Google Slides
https://docs.google.com/presentation/d/1MUrz3K_A001egy00IPCu7woaqPJDwUf6frhGSojeR4M/edit?usp=sharing

### Database
- Data was scrapped from https://www.basketball-reference.com/ & https://stathead.com/basketball/, saved as .csv. (season_stats.csv, cy_stats.csv, cy_stats2.csv, cy_stats3.csv)
- Total of four tables, one for past years data(season_stats.csv) and three individuals tables for current year stats as we updated(cy_stats.csv, cy_stats2.csv, cy_stats3.csv)
- Datasets loaded into PostgreSQL database using python. (database_initial_load.ipynb)
- Updated datasets saved as csv, cleaned and loaded into database. (database_load_nov15.ipynb, database_load_nov27.ipynb)
- Column name changed inside database
- All 4 datasets consist of the same columns/features. This columns/features consisted of Win pct, Margin of victory, Pace, Offensive rating, Defensive rating plus five columns with team advance stats and another five with opponents advance stats
- A separate config.py file will be needed with the db_password variable the password for the database
### Machine Learning Models
- Data (season_stats.csv, cy_stats.csv) pulled from PostgreSQL, cleaned of non-value columns
- Data (season_stats.csv) trained through ML model, feature importance explored
- Features pruned
- Data (cy_stats.csv) passed through ML model to predict target – ‘Position’
### Tableau
- Datasets (season_stats.csv, cy_stats.csv, cy_stats2.csv) loaded into Tableau
- Storyboard created
- Storyboard saved to Tableau public
### Webpage
- Project description, data exploration, ML methods, Tableau storyboard, and model predictions displayed through webpage.
## Modules, Tools and Frameworks
- Jupyter Notebook
- Python
- Pandas
- sqlalchemy
- scikit-Learn
- matplotlib
- seaborn
- PostgreSQL
- Tableau
- HTML template [Nicepage](https://nicepage.com/)

# Machine Learning Model
### Preliminary data preprocessing
- Missing or null values were checked pre-database creation-none found
- Import from PostgreSQL and read into data frame
- Column’s ‘Season’ and ‘Name’ assigned to separate data frame for later use
- Columns of no value dropped from data frame
- Columns determined from feature exploration not needed dropped
- Feature names were set as variable for later use
- Data set split into train/test sets
- Data scaled to normalize
- Encoding was not used as all value-added data is numerical
### Preliminary feature engineering and selection
- A heatmap was created to visualize the relationships between features
![heatmap](https://user-images.githubusercontent.com/74840026/143719096-cf654501-97ea-4729-ad46-5854576b36b0.png)

- Histograms to view where the data points lie within the ranges
![Histograms](https://user-images.githubusercontent.com/74840026/143719020-bb53a9a1-626a-4a22-9d5d-e91a3203010a.png)

- Density plots to show the distribution of the data
![DPAFwLOGO](https://user-images.githubusercontent.com/74840026/143719111-7899449d-07bd-4ab8-a78d-7d3a3c5191ab.png)


## Logistic Regression
- Features were explored using coefficients, Recursive Feature Elimination (RFE) and Select from Model (SFM) methods for the Logistic Regression model.
- All three methods produced lower accuracy results then using all features
- All features used in model
- Model accuracy score: 0.9786
## Decision Tree
- Features were ranked using model.feature_importances_
- The bottom 11 features played no importance in the model outcome or accuracy
- Top 6 features used in model
- Model accuracy score: 0.9658
## Random Forest
- Features were ranked using model.feature_importances_
- Only top 3 features were consistent when running the model
- All features used to give model more data to train with
- Model accuracy score: 0.97
### How data was split into training and test sets
- Data was split using sk.learn train_test_split dependencies with the default 75/25 split
### Explain model choice, including limitations and benefits
- Supervised models were chosen due to the data having a label(‘Position’).
## Logistic Regression
- A logistic regression model analyzes the available data, and when presented with a new sample, mathematically determines its probability of belonging to a class. If the probability is above a certain cutoff point, the sample is assigned to that class. If the probability is less than the cutoff point, the sample is assigned to the other class.
	- Limitations
		- If the number of observations is lesser than the number of features, Logistic Regression should not be used, otherwise, it may lead to overfitting.
		- The major limitation of Logistic Regression is the assumption of linearity between the dependent variable and the independent variables.
	- Benefits
		- Logistic regression is easier to implement, interpret, and very efficient to train.
		- It makes no assumptions about distributions of classes in feature space.
		- It can easily extend to multiple classes (multinomial regression) and a natural probabilistic view of class predictions.
		- It is very fast at classifying unknown records.
## Decision Tree
- Decision trees are natural ways in which you can classify or label objects by asking a series of questions designed to zero in on the true answer. 
	- Limitations
		- A small change in the data can cause a large change in the structure of the decision tree causing instability.
		- For a Decision tree sometimes, calculation can go far more complex compared to other algorithms.
		- Decision tree often involves higher time to train the model.
		- Decision tree training is relatively expensive as the complexity and time has taken are more.
		- The Decision Tree algorithm is inadequate for applying regression and predicting continuous values.
	- Benefits
		- Compared to other algorithms decision trees requires less effort for data preparation during pre-processing.
		- A decision tree does not require normalization of data.
		- A decision tree does not require scaling of data as well.
		- Missing values in the data also do NOT affect the process of building a decision tree to any considerable extent.
		- A Decision tree model is very intuitive and easy to explain to technical teams as well as stakeholders.
## Random Forest
- Instead of having a single, complex tree like the ones created by decision trees, a random forest algorithm will sample the data and build several smaller, simpler decision trees. Each tree is simpler because it is built from a random subset of features. These simple trees are weak learners because they are created by randomly sampling the data and creating a decision tree for only that small portion of data. And since they are trained on a small piece of the original data, they are only slightly better than a random guess. However, many slightly better than average small decision trees can be combined to create a strong learner, which has much better decision-making power.
	- Limitations
		- Complexity: Random Forest creates a lot of trees (unlike only one tree in case of decision tree) and combines their outputs. By default, it creates 100 trees in Python sklearn library. To do so, this algorithm requires much more computational power and resources. On the other hand decision tree is simple and does not require so much computational resources.
		- Longer Training Period: Random Forest require much more time to train as compared to decision trees as it generates a lot of trees (instead of one tree in case of decision tree) and makes decision on most votes.
	- Benefits
		- Are robust against overfitting as all those weak learners are trained on different pieces of the data.
		- Can be used to rank the importance of input variables in a natural way.
		- Can handle thousands of input variables without variable deletion.
		- Are robust to outliers and nonlinear data.
		- Run efficiently on large datasets.
## Summary
- For a comparison of how our models stand up to reality, we used data from multiple sports betting odds sites.  
- At the current time, our model is predicting within the top three odds winners from both betting sites.

## Challenges and what could have been done different
### Challenges 
- Initially tried to scrap data from source, but had challenges with the way data was coming out. But source website had an option to copy to csv files, so used that option.
- We had challenge embedding the two tableau storyboard, which may have been due also to the webpage template we were using.  Support pages from tableau were not enough, but we were able to find code through other web sources that we were able to modify for to use on our webpage.
- Feature exploration - understanding which method to use to find feature importance for each model 
- Feature pruning - dropping features based on importance to find influence on model accuracy

### What would we do different next time
- Our past data went back 30 years, to 1990 but this is an area that we could have done differently. The NBA over the past 30 years has evolved the way the game is played, in large part due to use of statistics which emphasized different aspect of the game and al due to rule changes the NBA implemented. We potentially could have looked at the last decade where the game was similar. This potentially could have had impact on feature importance and predictions.
- Make a better plan for which models to use and find upfront the feature importance methods
- Refactor HTML to make responsive to different screen size/mobile
