# Final_project

Datasets for https://www.basketball-reference.com/ & https://stathead.com/basketball/

Champions dataset- from 1947 to 2021
	Year: (yyyy: 2021) does not match up with seasons  for example 2021 champ is for 2020-21 season
	Lg: for ex: NBA, ABA – dont need can drop
	Champion: full team name(city + nickname: Milwaukee Bucks) does not match up with abbrev city 3 letter for example MIL
	Runner-up: dont need can drop
	Final MVP: dont need can drop
	Points: dont need can drop
	Rebounds: dont need can drop
	Assists: dont need can drop
	Win Share: dont need can drop

Stats dataset- by team from 1989-90 to 2020-21(not including current season) 24 columns
	Rk: Ranking
Season: (yyyy-yy: 2020-21) does not match Year from champions- will need to adj.
Tm: Team name as 3 letter city, does not match Champion, and also have *- will need to adj.
Lg for ex: NBA, ABA – dont need can drop
G: total games
W: Wins
L: Losses
W/L%: Win pct
MOV: Margin of victory
SOS: strength of schedule
SRS:
Pace: possessions per 48 min
ORtg: Offensive rating
DRtg: Defensive rating
Team eFG%,TS%,TOV%,ORB%,FT/FGA: 5 columns with team advance stats
opp_eFG%,opp_TS%,opp_TOV%,opp_ORB%,opp_FT/FGA: 5 columns with opps advance stats

CY_stats: Stats for 2021-22 season(2022)- same data as Stats dataset.  Will need to update as through 11/2 less then 10 games of data for current season.


*team_name: Need to create a dummy table to reconcile team name and champion to be able to join Champions & stats tables
	teamname: full team name(city + nickname: Milwaukee Bucks)
abbr: 3 letter city: MIL

*champ_stats dataset: Join between Champions and Stats that combines each years Champions with their stats from that season

--Data from Joined datasets between Champions and Stats used to train and test ML model? And then apply to CY_stats to determine Team that will win?




Definition of Stats:
Rk -- Rank
Tm -- * - indicates playoff team
Lg -- League
G -- Games
W -- Wins
L -- Losses
W/L% -- Win-Loss Percentage
Miscellaneous
MOV -- Margin of Victory
SOS -- Strength of Schedule; a rating of strength of schedule. The rating is denominated in points above/below average, where zero is average.
SRS -- Simple Rating System; a team rating that takes into account average point differential and strength of schedule. The rating is denominated in points above/below average, where zero is average.
Pace -- Pace Factor: An estimate of possessions per 48 minutes
ORtg -- Offensive Rating
An estimate of points produced (players) or scored (teams) per 100 possessions
DRtg -- Defensive Rating
An estimate of points allowed per 100 possessions
Team
eFG%
Effective Field Goal Percentage
This statistic adjusts for the fact that a 3-point field goal is worth one more point than a 2-point field goal.
TS% -- True Shooting Percentage
A measure of shooting efficiency that takes into account 2-point field goals, 3-point field goals, and free throws.
TOV% -- Turnover Percentage
An estimate of turnovers committed per 100 plays.
ORB% -- Offensive Rebound Percentage
An estimate of the percentage of available offensive rebounds a player grabbed while they were on the floor.
FT/FGA -- Free Throws Per Field Goal Attempt
Opponent
eFG% -- Opponent Effective Field Goal Percentage
TS% -- Opponent True Shooting Percentage
TOV% -- Opponent Turnover Percentage
ORB% -- Opponent Offensive Rebound Percentage
FT/FGA -- Opponent Free Throws Per Field Goal Attempt

