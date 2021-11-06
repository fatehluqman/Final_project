# Final_project


*Datasets were collected from https://www.basketball-reference.com/ & https://stathead.com/basketball/
*The datasets were copied into csv files, and initial data cleaning was done in excel before importing into Pandas. 
*First dataset is season_stats, which consists of a set of stats for all teams between the years of 2020-1990. These are historical stats from last season 2020-21 and do not include the current season 2021-22.
A position column has been added to this dataset with a value of 1 added to the team that won the championship for that year. All other teasm were given a value of 0. This dataset will be used to train and test the machine learning model.
* The second dataset is cy_stats, which consist of the same stats from season_stats dataset, but is for the current season 2021-22. Once the ML model has been trained and tested on the season_stats dataset, the model will be applied to the cy_stats to determine the team which will win the champion for teh current season.
* Both datasets consist of the following columns: 
	Position: 1 for champions team for each year, 0 for non winners.
	Season: (yyyy-yy: 2020-21) 
	Tm: Team name as 3 letter city
	G: games
	W: Wins
	L: Losses
	W/L%: Win pct
	MOV: Margin of victory
	SOS: Strength of schedule
	SRS: Simple Rating System
	Pace: Possessions per 48 min
	ORtg: Offensive rating
	DRtg: Defensive rating
	Team eFG%,TS%,TOV%,ORB%,FT/FGA: 5 columns with team advance stats
	opp_eFG%,opp_TS%,opp_TOV%,opp_ORB%,opp_FT/FGA: 5 columns with opps advance stats

*Database is deployed using Postgres version 11.  A database was created in Postgress called nba_champs.
*database.ipynb file loads the two datasets season_stats and cy_stats into individual panda data frames. 
*With pandas we continue to clean the data frames including dropping unnecessary columns and updating column names to remove special characters
*Finally in the database.ipynb a connection is built with the Postgres nba_champs database and the two datasets are loaded into individual tables.
*A separate config.py file will be needed with the db_password variable the password for the database.








