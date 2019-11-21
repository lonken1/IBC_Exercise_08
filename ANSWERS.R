# Clear Working Directory
rm(list=ls())

# PROBLEM 1

# Load data from basketball game
data <- read.table("UWvMSU_1-22-13.txt", header = T)

# Creating two dataframes which will have the cummulative score over time
time <- c(0)
score <- c(0)
gamescoreuw <- data.frame(time,score,stringsAsFactors = F)
gamescoremsu <- data.frame(time,score,stringsAsFactors = F)

# Counters for the cummulative score of both teams
uwscore <- 0
msuscore <- 0

# THE for loop. It adds to cummulative score depending on the team.
# It then creates a vector for both UW and MSU containing the time of the score and the current score of that team.
# Finally, rbind combines the vector just created with the dataframe that has the cummulative score over time.

for (i in 1:nrow(data)){
  if (data[i,'team']=='UW'){
    uwscore <- uwscore+data[i,'score']
    uwtimescore <- c(data[i,'time'],uwscore)
    msutimescore <- c(data[i,'time'],msuscore)
    gamescoreuw <- rbind(gamescoreuw,uwtimescore)
    gamescoremsu <- rbind(gamescoremsu,msutimescore)
  }
  else {
    msuscore <- msuscore+data[i,'score']
    uwtimescore <- c(data[i,'time'],uwscore)
    msutimescore <- c(data[i,'time'],msuscore)
    gamescoremsu <- rbind(gamescoremsu,msutimescore)
    gamescoreuw <- rbind(gamescoreuw,uwtimescore)
  }
  
}

plot(x=gamescoremsu$time,y=gamescoremsu$score,type='l',xlab = "Time",ylab = "Score")
lines(x=gamescoreuw$time,y=gamescoreuw$score)
