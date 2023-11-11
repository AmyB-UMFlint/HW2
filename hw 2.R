df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
aggregate(df1$Sales, by=list(df1$State), FUN=sum)
library(dplyr)
(df1 %>% group_by(State) %>% summarise(sum_sales = sum)
head(df1)

World_cup <- read.csv("C:/Users/angel/OneDrive/Documents/DATA/WorldCupMatches.csv", header = TRUE)
head(World_cup)
# a - determine number of rows and columns 
dim(World_cup)
# b - use summary function to return statistics summary
summary(World_cup)
# c -Find out how many unique locations
unique_locations <- unique(World_cup$Stadium)
cat("(c) Number of unique World Cup locations: ", length(unique_locations), "\n")
# d - Find Average attendence
average_attendance <- mean(World_cup$Attendance, na.rm = TRUE)
cat("(d) Average attendance: ", round(average_attendance), "\n")
# e - Total Number of goals scored by home team
home_team_goals <- World_cup %>%
  group_by(Home.Team.Name) %>%
  summarise(Total_Goals_Scored = sum(Home.Team.Goals, na.rm = TRUE))
print(home_team_goals)
# f -Average number of attendees for each year
average_attendance_by_year <- World_cup %>%
  group_by(Year) %>%
  summarise(Average_Attendance = mean(Attendance, na.rm = TRUE))
print(average_attendance_by_year)

# Metabolite
metabolite <- read.csv("C:/Users/angel/OneDrive/Documents/DATA/metabolite.csv", header = TRUE)
head(metabolite)
# a Count the number of Alzheimer's patients
alzheimers_count <- sum(metabolite$Label == "Alzheimer")
cat("Number of Alzheimer's patients in the dataset: ", alzheimers_count, "\n")
# b determine number of missing values
missing_values <- colSums(is.na(metabolite))
cat("(b) Number of missing values for each column:\n")
print(missing_values)
# c - Replace missing dopamine
metabolite_no_missing_dopamine <- subset(metabolite, !is.na(Dopamine))
# c4-OH-Pro
median_c4_OH_Pro <- median(metabolite_no_missing_dopamine$c4_OH_Pro, na.rm = TRUE)
metabolite_no_missing_dopamine$c4_OH_Pro[is.na(metabolite_no_missing_dopamine$c4_OH_Pro)] <- median_c4_OH_Pro

# print updated df
print(metabolite_no_missing_dopamine)
