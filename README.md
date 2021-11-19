Deliverable One files:



<p align="center">
<img width="530" height="300" src="https://user-images.githubusercontent.com/74840026/140004825-00753ac5-3e41-482a-800c-8b792967c14b.png">                                                                  
<h3 align="center">NBA Machine Learning Predictions</h3>

  <p align="center">
    Can we predict the winner of the 2022 NBA season using Machine Learning?
</p>
    
    
# Final_project

* Based on the statistics of NBA Champions from past seasons, can we predict the winner of the current NBA Season (2021-22) using the teams current stats?
* We chose this subject because of our interest in sports and in particular NBA.  Additionally, the use of statistics in sports has been evolving for years. For example, a basic box score with minutes played, points, rebounds and a few other stats was the standard, but now with improved technology performance can be broken down to individual players on individuals plays, which can show which kind of plays and where on the court a player has the most success scoring.
Even though our analysis will not go this deep, winning a championship goes beyond the number of wins and losses a team has in the regular season. So we wanted to use a set of advance stats to see if we could predict a winner.

* Datasets were collected from https://www.basketball-reference.com/ & https://stathead.com/basketball/
* The datasets were copied into csv files, and initial data cleaning was done in excel before importing into Pandas. 
* First dataset is season_stats, which consists of a set of regualr season stats for all teams between the years of 2020-1990. These are historical stats from last season 2020-21 and do not include the current season 2021-22.
	* A position column has been added to this dataset with a value of 1 added to the team that won the championship for that year. All other teasm were given a value of 0. This dataset will be used to train and test the machine learning model.
* The second dataset is cy_stats, which consist of the same stats from season_stats dataset, but is for the current season 2021-22. Once the ML model has been trained and tested on the season_stats dataset, the model will be applied to the cy_stats to determine the team which will win the champion for teh current season.
* Both datasets consist of the following columns: 
	* Position: 1 for champions team for each year, 0 for non winners.
	* Season: (yyyy-yy: 2020-21) 
	* Tm: Team name as 3 letter city
	* G: games
	* W: Wins
	* L: Losses
	* W/L%: Win pct
	* MOV: Margin of victory
	* SOS: Strength of schedule
	* SRS: Simple Rating System
	* Pace: Possessions per 48 min
	* ORtg: Offensive rating
	* DRtg: Defensive rating
	* Team eFG%,TS%,TOV%,ORB%,FT/FGA: 5 columns with team advance stats
	* opp_eFG%,opp_TS%,opp_TOV%,opp_ORB%,opp_FT/FGA: 5 columns with opps advance stats

* Database is deployed using Postgres version 11.  A database was created in Postgress called nba_champs.
* database.ipynb file loads the two datasets season_stats and cy_stats into individual panda data frames. 
* With pandas we continue to clean the data frames including dropping unnecessary columns and updating column names to remove special characters
* Finally in the database.ipynb a connection is built with the Postgres nba_champs database and the two datasets are loaded into individual tables.
* A separate config.py file will be needed with the db_password variable the password for the database.

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
## Logistic Regression
- Features were explored using coefficients, Recursive Feature Elimination (RFE) and Select from Model (SFM) methods for the Logistic Regression model.
- All three methods produced lower accuracy results then using all features
- All features used in model
## Decision Tree
- Features were ranked using model.feature_importances_
- The bottom 11 features played no importance in the model outcome or accuracy
- Top 6 features used in model
## Random Forest
- Features were ranked using model.feature_importances_
- Only top 3 features were consistent when running the model
- Top 3 features used in model
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



