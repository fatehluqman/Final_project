Deliverable One files:
- database.ipynb : initial cleaning and load into PostgreSQL
- LogReg_Model_11.10.21 : import from PostgreSQL into ML model
- schena.sql : PostgreSQL table setup
- nba_champ ERD.png : database tables
- season_stats.csv : past season dataset
- cy_stats.csv : current year dataset


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

# Exploring the data


<p align="center">
	Win/Lose Percentage over 32 seasons
	<img src="https://user-images.githubusercontent.com/74840026/140628566-156afa7d-fe93-462f-8eee-aa7cdd1c1bea.png"
</p>

<p align="center">
	Total Margin of victory over 32 seasons
	<img src="https://user-images.githubusercontent.com/74840026/140628561-7d3d06c9-2627-43e7-b4d9-c401a75c17bd.png"
</p>

<p align="center">
	Total Possessions per 48 minutes over 32 seasons
	<img src="https://user-images.githubusercontent.com/74840026/140628563-a086c17e-2a50-4103-93e2-b4106cee1236.png"
</p>

<p align="center">
	Three main features in dataset comparison
	<img src="https://user-images.githubusercontent.com/74840026/140628568-1e720484-9acd-4022-9c9c-7ee4001f947c.png"
</p>
