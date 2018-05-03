
#Notes about what we want. For Injuries by geography ---  rate of injury? Can we find partiipation rates by sport?  

#All over time, if possible
#bar chart of total injuries -- 
#line graph with injuries by quarter by sport.
#line graph with injuries by gender and sport -- specifically, baseball, basketball, soccer, lacrosse cheer.
#concussions by sport over time /  concussions as a percentage of all injuries 
#overall cost/average cost for sports 
#basball arm injuries over time
#Concussions in hockey 
#lower extremity injuries in Football - 
#hockey, soccer, football, lax -- by gender over time 
#cardiac arrest and death by sport over time 

library(tidyverse)
library(zoo)
library(zipcode)

#here we create variables and read in  each table Julia created. And we make it so the columns except for the total charge column are in a standard format.
BASEBALL_IPALL_10 <- read_csv("BASEBALL_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
#we're also adding a column called sport for sorting/grouping purposes
BASEBALL_IPALL_10["sport"]<-"baseball"
#Forces the prindiag column to be a character, een though it's all numbers. Because sometimes the column has numbers and letters.
BASEBALL_IPALL_9 <- read_csv("BASEBALL_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASEBALL_IPALL_9["sport"]<-"baseball"

BASEBALL_OPALL_10 <- read_csv("BASEBALL_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASEBALL_OPALL_10["sport"]<-"baseball"
BASEBALL_OPALL_9 <- read_csv("BASEBALL_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASEBALL_OPALL_9["sport"]<-"baseball"

BASKETBALL_IPALL_10 <- read_csv("BASKETBALL_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASKETBALL_IPALL_10["sport"]<-"basketball"

BASKETBALL_IPALL_9 <- read_csv("BASKETBALL_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASKETBALL_IPALL_9["sport"]<-"basketball"

BASKETBALL_OPALL_10 <- read_csv("BASKETBALL_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASKETBALL_OPALL_10["sport"]<-"basketball"

BASKETBALL_OPALL_9 <- read_csv("BASKETBALL_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
BASKETBALL_OPALL_9["sport"]<-"basketball"

CHEER_OPALL_10 <- read_csv("CHEER_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
CHEER_OPALL_10["sport"]<-"cheer"

CHEER_OPALL_9 <- read_csv("CHEER_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
CHEER_OPALL_9["sport"]<-"cheer" 

CHEER_IPALL_9 <- read_csv("CHEER_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
CHEER_IPALL_9["sport"]<-"cheer" 

CHEER_IPALL_10<- read_csv("CHEERLEADING_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
CHEER_IPALL_10["sport"]<-"cheer" 

FOOTBALL_IPALL_10 <- read_csv("FOOTBALL_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
FOOTBALL_IPALL_10["sport"]<-"football" 

FOOTBALL_IPALL_9 <- read_csv("FOOTBALL_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
FOOTBALL_IPALL_9["sport"]<-"football" 

FOOTBALL_OPALL_9 <- read_csv("FOOTBALL_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
FOOTBALL_OPALL_9["sport"]<-"football" 

FOOTBALL_OPALL_10 <- read_csv("FOOTBALL_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
FOOTBALL_OPALL_10["sport"]<-"football" 

GYMNASTICS_OPALL_10 <- read_csv("GYMNASTICS_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
GYMNASTICS_OPALL_10["sport"]<-"gymnastics" 

GYMNASTICS_OPALL_9 <- read_csv("GYMNASTICS_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
GYMNASTICS_OPALL_9["sport"]<-"gymnastics" 

GYMNASTICS_IPALL_9 <- read_csv("GYMNASTICS_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
GYMNASTICS_IPALL_9["sport"]<-"gymnastics" 

ICEHOCKEY_IPALL_10 <- read_csv("ICEHOCKEY_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
ICEHOCKEY_IPALL_10["sport"]<-"hockey" 

ICEHOCKEY_IPALL_9 <- read_csv("ICEHOCKEY_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
ICEHOCKEY_IPALL_9["sport"]<-"hockey" 

ICEHOCKEY_OPALL_10 <- read_csv("ICEHOCKEY_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
ICEHOCKEY_OPALL_10["sport"]<-"hockey" 

ICEHOCKEY_OPALL_9 <- read_csv("ICEHOCKEY_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
ICEHOCKEY_OPALL_9["sport"]<-"hockey" 

LAXFH_IPALL_9 <- read_csv("LAXFH_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
LAXFH_IPALL_9["sport"]<-"lax/fieldhockey" 

LAXFH_OPALL_10 <- read_csv("LAXFH_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
LAXFH_OPALL_10["sport"]<-"lax/fieldhockey" 

LAXFH_OPALL_9 <- read_csv("LAXFH_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
LAXFH_OPALL_9["sport"]<-"lax/fieldhockey" 

SOCCER_OPALL_10 <- read_csv("SOCCER_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
SOCCER_OPALL_10["sport"]<-"soccer" 

SOCCER_OPALL_9 <- read_csv("SOCCER_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
SOCCER_OPALL_9["sport"]<-"soccer" 

SOCCER_IPALL_10 <- read_csv("SOCCER_IPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
SOCCER_IPALL_10["sport"]<-"soccer" 

SOCCER_IPALL_9 <- read_csv("SOCCER_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
SOCCER_IPALL_9["sport"]<-"soccer" 

TRACK_IPALL_9 <- read_csv("TRACK_IPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
TRACK_IPALL_9["sport"]<-"track" 

TRACK_OPALL_10 <- read_csv("TRACK_OPALL_10.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
TRACK_OPALL_10["sport"]<-"track" 

TRACK_OPALL_9 <- read_csv("TRACK_OPALL_9.csv", col_types = cols(
  TOT_CHG = col_number(),
  .default = "c")
)
TRACK_OPALL_9["sport"]<-"track" 
#now it's time to join the two tables. 

#this is sthe sample that above rows are built on. 
#x <- read_csv("file.csv", col_types = cols(
#  A = col_double(),
#  B = col_logical(),
#  C = col_factor()))


ipall_all <- bind_rows(BASEBALL_IPALL_10, BASEBALL_IPALL_9, BASKETBALL_IPALL_10, BASKETBALL_IPALL_9, CHEER_IPALL_10, CHEER_IPALL_9, FOOTBALL_IPALL_10, FOOTBALL_IPALL_9, GYMNASTICS_IPALL_9, ICEHOCKEY_IPALL_10, ICEHOCKEY_IPALL_9, LAXFH_IPALL_9, SOCCER_IPALL_10, SOCCER_IPALL_9, TRACK_IPALL_9)

opall_all <- bind_rows( BASEBALL_OPALL_10, BASEBALL_OPALL_9, BASKETBALL_OPALL_10, BASKETBALL_OPALL_9, CHEER_OPALL_10, CHEER_OPALL_9, FOOTBALL_OPALL_9, FOOTBALL_OPALL_10, GYMNASTICS_OPALL_10, GYMNASTICS_OPALL_9, ICEHOCKEY_OPALL_10, ICEHOCKEY_OPALL_9, LAXFH_OPALL_10, LAXFH_OPALL_9, SOCCER_OPALL_10, SOCCER_OPALL_9, TRACK_OPALL_10, TRACK_OPALL_9)



#Now we are just looking at all IP injuries and grouping them by city and sport.
ip_zip_sport <- ipall_all_with_zips %>%
  group_by(city, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
  ip_zip_sport[1:10,]
  #now we're looking at all OP injuries and grouping them by city and sport 
op_zip_sport <- opall_all_with_zips %>%
  group_by( sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
  op_zip_sport[1:10,]


  #total chg ip for each sport by gender
ip_cost_sport_gender <- ipall_all_with_zips %>%
  group_by(sport, SEX) %>%
  summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
  arrange(desc(total_cost ))
ip_cost_sport_gender[1:10,]
#total chg ip for each sport by gender
ip_cost_sport <- ipall_all_with_zips %>%
  group_by(sport) %>%
  summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
  arrange(desc(total_cost ))
ip_cost_sport[1:10,]

#total chg op for each sport by gender
op_cost_sport_gender <- opall_all_with_zips %>%
  group_by(sport, SEX) %>%
  summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
  arrange(desc(total_cost ))
op_cost_sport_gender[1:10,]
#total chg op for each sport
op_cost_sport <- opall_all_with_zips %>%
  group_by(sport) %>%
  summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
  arrange(desc(total_cost ))
op_cost_sport[1:10,]



  
op_cost_sport <- opall_all_with_zips %>%
  group_by(sport) %>%
  summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
  arrange(desc(total_cost ))
op_cost_sport[1:10,]

# sorts inpatient table by sex and sport 
ip_all_gender <- ipall_all %>%
  group_by(SEX, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 

op_all_gender <- opall_all %>%
  group_by(SEX, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
op_all_gender[1:10,]

#need to make graph **
ggplot(data=op_all_gender, aes(x=, y=count, group=sport)) +
  geom_line(aes(color=sport))+
  geom_point(aes(color=sport)) +
  scale_x_yearqtr(format="%YQ%q", n=5) +
  xlab("Quarter") +
  ylab("Number of injuries") +
  ggtitle("IP Year by quarter")



#sorts the op table by sports and gender
op_all_gender <- opall_all %>%
  group_by(SEX, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(sport)) 


#concussions, city, anklesprains, count of injuries by sport, by sex, by race 


#sorts and counts the 
op_year <- opall_all %>%
  group_by(YEAR, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(YEAR)) 

op_age_check <- opall_all %>%
  group_by(AGE_GROUP, YEAR, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(YEAR)) 

#creates a fancy line plot. It gives each sport a different color
ggplot(data=op_year, aes(x=YEAR, y=count, group=sport)) +
  geom_line(aes(color=sport))+
  geom_point(aes(color=sport)) 
  

ip_year <- ipall_all %>%
  group_by(YEAR, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(YEAR)) 


#ok so year made a wonky graph. So now we're trying to zero in on quarter data.
#so, here we are converting the year and quarter field into one. 
ipall_all$NewDate <- as.yearqtr(paste(ipall_all$YEAR, ipall_all$QTR, sep = ' Q'))
#now we are using the library(zoo) to make them a yearqtr type...this should help us graph
yearqtr(ipall_all$NewDate)
#making sure it's a yearqtr field 
class(ipall_all$NewDate)
#and now we try and count and groupbefore we graph. 
ip_year_qtr<- ipall_all %>%
  group_by(NewDate, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(NewDate)) 

#now we graph. Looks funny but looks right. 
ggplot(data=ip_year_qtr, aes(x=NewDate, y=count, group=sport)) +
  geom_line(aes(color=sport))+
  geom_point(aes(color=sport)) +
  scale_x_yearqtr(format="%YQ%q", n=5) +
  xlab("Quarter") +
  ylab("Number of injuries") +
  ggtitle("IP Year by quarter")

#now let's do the same for the opall table
opall_all$NewDate <- as.yearqtr(paste(opall_all$YEAR, opall_all$QTR, sep = ' Q'))
#now we are using the library(zoo) to make them a yearqtr type...this should help us graph
yearqtr(opall_all$NewDate)
#making sure it's a yearqtr field 
class(opall_all$NewDate)
#and now we try and count and groupbefore we graph. 
op_year_qtr<- opall_all %>%
  group_by(NewDate, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(NewDate)) 

#now we graph. 



opall_test <- data.frame(opall_all_test)

#To find out how many patients sustained concussions in each sport, we need to search through a variety of columns to find those injuries. So I did the best I could to devise a query that searches through all the columns and returns a case where a concussion is sustained. The ICD 9 and 10 codes for concussions are included. Then I summarized by gender and sport. And then summarized and arranged by count. 
concussions_op_all <- opall_all %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(sport, SEX) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
  concussions_op_all[1:10,]
  
#we will also break concussions down by geography.
  concussions_op_all_geography <- opall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(SAS_COUNTY) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
  concussions_op_all_geography[1:10,]
  
  #we will also break concussions down by geography.
  concussions_ip_all_geography <- ipall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(SAS_COUNTY) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
  concussions_ip_all_geography[1:10,]
  
#now let's look at concussions by race 
  concussions_op_all_race <- opall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(RACE, SAS_COUNTY) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
  concussions_op_all_race[1:10,]
  
  #we will also break concussions down by race
concussions_ip_all_race <- ipall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(RACE) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
  concussions_ip_all_race[1:10,]
  
  
  #we will also break concussions down by race
  concussions_op_all_race <- opall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(RACE, sport) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
  concussions_op_all_race[1:10,]
  
  
  #summarizing all inkuries OP by race
all_op_injuries_by_race <- opall_all_with_zips %>%
    group_by(RACE) %>%
    summarise(injuries_count = n()) %>%
    arrange(desc(injuries_count))
    all_op_injuries_by_race[1:10,]
  
  #summarizing all inkuries OP by race
  all_ip_injuries_by_race <- ipall_all_with_zips %>%
    group_by(RACE) %>%
    summarise(injuries_count = n()) %>%
    arrange(desc(injuries_count))
  all_ip_injuries_by_race[1:10,]    
    
  #identifies all injuries by sport and sex.
  all_op_injuries_by_sport_gender <- opall_all_with_zips %>%
    group_by(sport, SEX) %>%
    summarise(injuries_count = n()) %>%
    arrange(desc(injuries_count))
 write_csv(all_op_injuries_by_sport_gender, "all_op_injuries_by_sport_gender.csv")
  
  #summarizing all inkuries OP by race
  all_ip_injuries_by_sport_gender <- ipall_all_with_zips %>%
    group_by(sport, SEX) %>%
    summarise(injuries_count = n()) %>%
    arrange(desc(injuries_count))
  write_csv(all_ip_injuries_by_sport_gender, "all_ip_injuries_by_sport_gender.csv")
  
    
  ggplot(concussions_op_all, aes(sport,SEX, concussions_count)) +
    geom_bar(aes(fill = variable), position = "dodge", stat="identity")
  
#same thing going on here that I did above
concussions_ip_all <- ipall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(SEX) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))

concussions_ip_all[1:10,]

#adds in column for ipall
concussions_ip_all["ip_op"]<-"ip" 
#adds a new column that labels the injuries as op
concussions_op_all["ip_op"]<-"op" 

all_concussions <- bind_rows( concussions_ip_all, concussions_op_all)

#this counts all people treated for inkuries and groups by sex
sport_count <- opall_all %>%
  group_by(PRINDIAG, sport, SEX) %>%
  summarise(total_sports_injuries_count = n()) %>%
  arrange(desc(total_sports_injuries_count))

#now that we've done concussions, we want to examine some additional injuries. 
op_ankle_sprains <- opall_all %>%
  filter(grepl("S934|8450", PRINDIAG) | grepl("S934|8450", DIAG1) | grepl("S934|8450", DIAG2) | grepl("S934|8450", DIAG3) | grepl("S934|8450", DIAG4) | grepl("S934|8450", DIAG5) | grepl("S934|8450", DIAG6) | grepl("S934|8450", DIAG7) | grepl("S934|8450", DIAG8)| grepl("S934|8450", DIAG9)| grepl("S934|8450", DIAG10)| grepl("S934|8450", DIAG11)| grepl("S934|8450", DIAG12)| grepl("S934|8450", DIAG13)| grepl("S934|8450", DIAG14)| grepl("S934|8450", DIAG15)| grepl("S934|8450", DIAG16)| grepl("S934|8450", DIAG17)| grepl("S934|8450", DIAG18)| grepl("S934|8450", DIAG19)| grepl("S934|8450", DIAG21)| grepl("S934|8450", DIAG22)| grepl("S934|8450", DIAG23)| grepl("S934|8450", DIAG24)| grepl("S934|8450", DIAG25)| grepl("S934|8450", DIAG26)| grepl("S934|8450", DIAG27)| grepl("S934|8450", DIAG28)) %>%
  group_by(sport, SEX, YEAR) %>%
  summarise(ankle_sprain_count = n()) %>%
  arrange(desc(ankle_sprain_count))

ggplot(data=op_ankle_sprains, aes(x=sport, y=ankle_sprain_count,)) +
  geom_bar(stat="identity") +
  ggtitle("ankle_sprain_count")



ip_ankle_sprains[1:12,]

#ip ankle sprains
ip_ankle_sprains <- ipall_all %>%
  filter(grepl("S934|8450", PRINDIAG) | grepl("S934|8450", DIAG1) | grepl("S934|8450", DIAG2) | grepl("S934|8450", DIAG3) | grepl("S934|8450", DIAG4) | grepl("S934|8450", DIAG5) | grepl("S934|8450", DIAG6) | grepl("S934|8450", DIAG7) | grepl("S934|8450", DIAG8)| grepl("S934|8450", DIAG9)| grepl("S934|8450", DIAG10)| grepl("S934|8450", DIAG11)| grepl("S934|8450", DIAG12)| grepl("S934|8450", DIAG13)| grepl("S934|8450", DIAG14)| grepl("S934|8450", DIAG15)| grepl("S934|8450", DIAG16)| grepl("S934|8450", DIAG17)| grepl("S934|8450", DIAG18)| grepl("S934|8450", DIAG19)| grepl("S934|8450", DIAG21)| grepl("S934|8450", DIAG22)| grepl("S934|8450", DIAG23)| grepl("S934|8450", DIAG24)| grepl("S934|8450", DIAG25)| grepl("S934|8450", DIAG26)| grepl("S934|8450", DIAG27)| grepl("S934|8450", DIAG28)) %>%
  group_by(sport, SEX, YEAR) %>%
  summarise(ankle_sprain_count = n()) %>%
  arrange(desc(ankle_sprain_count))

#add and name a column for ip and op
op_ankle_sprains["ip_op"]<-"op" 
ip_ankle_sprains["ip_op"]<-"ip" 

#thorax injuries

op_thorax_injury <- opall_all %>%
  filter(grepl("9221|S20", PRINDIAG) | grepl("9221|S20", DIAG1) | grepl("9221|S20", DIAG2) | grepl("9221|S20", DIAG3) | grepl("9221|S20", DIAG4) | grepl("9221|S20", DIAG5) | grepl("9221|S20", DIAG6) | grepl("9221|S20", DIAG7) | grepl("9221|S20", DIAG8)| grepl("9221|S20", DIAG9)| grepl("9221|S20", DIAG10)| grepl("9221|S20", DIAG11)| grepl("9221|S20", DIAG12)| grepl("9221|S20", DIAG13)| grepl("9221|S20", DIAG14)| grepl("9221|S20", DIAG15)| grepl("9221|S20", DIAG16)| grepl("9221|S20", DIAG17)| grepl("9221|S20", DIAG18)| grepl("9221|S20", DIAG19)| grepl("9221|S20", DIAG21)| grepl("9221|S20", DIAG22)| grepl("9221|S20", DIAG23)| grepl("9221|S20", DIAG24)| grepl("9221|S20", DIAG25)| grepl("9221|S20", DIAG26)| grepl("9221|S20", DIAG27)| grepl("9221|S20", DIAG28)) %>%
  group_by(sport, SEX) %>%
  summarise(thorax_injury_count = n()) %>%
  arrange(desc(thorax_injury_count))

ip_thorax_injury <- ipall_all %>%
  filter(grepl("9221|S20", PRINDIAG) | grepl("9221|S20", DIAG1) | grepl("9221|S20", DIAG2) | grepl("9221|S20", DIAG3) | grepl("9221|S20", DIAG4) | grepl("9221|S20", DIAG5) | grepl("9221|S20", DIAG6) | grepl("9221|S20", DIAG7) | grepl("9221|S20", DIAG8)| grepl("9221|S20", DIAG9)| grepl("9221|S20", DIAG10)| grepl("9221|S20", DIAG11)| grepl("9221|S20", DIAG12)| grepl("9221|S20", DIAG13)| grepl("9221|S20", DIAG14)| grepl("9221|S20", DIAG15)| grepl("9221|S20", DIAG16)| grepl("9221|S20", DIAG17)| grepl("9221|S20", DIAG18)| grepl("9221|S20", DIAG19)| grepl("9221|S20", DIAG21)| grepl("9221|S20", DIAG22)| grepl("9221|S20", DIAG23)| grepl("9221|S20", DIAG24)| grepl("9221|S20", DIAG25)| grepl("9221|S20", DIAG26)| grepl("9221|S20", DIAG27)| grepl("9221|S20", DIAG28)) %>%
  group_by(sport, SEX) %>%
  summarise(thorax_injury_count  = n()) %>%
  arrange(desc(thorax_injury_count ))

op_thorax_injury[1:12,] 
ip_thorax_injury[1:12,] 


#knee and leg sprains with corresponding icd9 and 10 codes 

ip_knee_leg_sprains <- ipall_all %>%
  filter(grepl("S83|S86|8449", PRINDIAG) | grepl("S83|S86|8449", DIAG1) | grepl("S83|S86|8449", DIAG2) | grepl("S83|S86|8449", DIAG3) | grepl("S83|S86|8449", DIAG4) | grepl("S83|S86|8449", DIAG5) | grepl("S83|S86|8449", DIAG6) | grepl("S83|S86|8449", DIAG7) | grepl("S83|S86|8449", DIAG8)| grepl("S83|S86|8449", DIAG9)| grepl("S83|S86|8449", DIAG10)| grepl("S83|S86|8449", DIAG11)| grepl("S83|S86|8449", DIAG12)| grepl("S83|S86|8449", DIAG13)| grepl("S83|S86|8449", DIAG14)| grepl("S83|S86|8449", DIAG15)| grepl("S83|S86|8449", DIAG16)| grepl("S83|S86|8449", DIAG17)| grepl("S83|S86|8449", DIAG18)| grepl("S83|S86|8449", DIAG19)| grepl("S83|S86|8449", DIAG21)| grepl("S83|S86|8449", DIAG22)| grepl("S83|S86|8449", DIAG23)| grepl("S83|S86|8449", DIAG24)| grepl("S83|S86|8449", DIAG25)| grepl("S83|S86|8449", DIAG26)| grepl("S83|S86|8449", DIAG27)| grepl("S83|S86|8449", DIAG28)) %>%
  group_by(sport, SEX) %>%
  summarise(knee_leg_sprain_count = n()) %>%
  arrange(desc(knee_leg_sprain_count))

op_knee_leg_sprains <- opall_all %>%
  filter(grepl("S83|S86|8449", PRINDIAG) | grepl("S83|S86|8449", DIAG1) | grepl("S83|S86|8449", DIAG2) | grepl("S83|S86|8449", DIAG3) | grepl("S83|S86|8449", DIAG4) | grepl("S83|S86|8449", DIAG5) | grepl("S83|S86|8449", DIAG6) | grepl("S83|S86|8449", DIAG7) | grepl("S83|S86|8449", DIAG8)| grepl("S83|S86|8449", DIAG9)| grepl("S83|S86|8449", DIAG10)| grepl("S83|S86|8449", DIAG11)| grepl("S83|S86|8449", DIAG12)| grepl("S83|S86|8449", DIAG13)| grepl("S83|S86|8449", DIAG14)| grepl("S83|S86|8449", DIAG15)| grepl("S83|S86|8449", DIAG16)| grepl("S83|S86|8449", DIAG17)| grepl("S83|S86|8449", DIAG18)| grepl("S83|S86|8449", DIAG19)| grepl("S83|S86|8449", DIAG21)| grepl("S83|S86|8449", DIAG22)| grepl("S83|S86|8449", DIAG23)| grepl("S83|S86|8449", DIAG24)| grepl("S83|S86|8449", DIAG25)| grepl("S83|S86|8449", DIAG26)| grepl("S83|S86|8449", DIAG27)| grepl("S83|S86|8449", DIAG28)) %>%
  group_by(sport, SEX) %>%
  summarise(knee_leg_sprain_count = n()) %>%
  arrange(desc(knee_leg_sprain_count))


ggplot(data=op_knee_leg_sprains, aes(x=sport, y=knee_leg_sprain_count,)) +
  geom_bar(stat="identity") +
  ggtitle("op_knee_leg_sprains")


ip_knee_leg_sprains[1:12,] 
op_knee_leg_sprains[1:12,] 


#S5 is an icd 10 code and it covers all injuries to the elbow and forearm, ICD9 codes are 9593 is elbow and forearm injuries. 842 is wrist injuries. S6 is the icd10 wrist code

ip_elbows_forearms_wrists <- ipall_all %>%
  filter(grepl("S5|9593|842|S6", PRINDIAG) | grepl("S5|9593|842|S6", DIAG1) | grepl("S5|9593|842|S6", DIAG2) | grepl("S5|9593|842|S6", DIAG3) | grepl("S5|9593|842|S6", DIAG4) | grepl("S5|9593|842|S6", DIAG5) | grepl("S5|9593|842|S6", DIAG6) | grepl("S5|9593|842|S6", DIAG7) | grepl("S5|9593|842|S6", DIAG8)| grepl("S5|9593|842|S6", DIAG9)| grepl("S5|9593|842|S6", DIAG10)| grepl("S5|9593|842|S6", DIAG11)| grepl("S5|9593|842|S6", DIAG12)| grepl("S5|9593|842|S6", DIAG13)| grepl("S5|9593|842|S6", DIAG14)| grepl("S5|9593|842|S6", DIAG15)| grepl("S5|9593|842|S6", DIAG16)| grepl("S5|9593|842|S6", DIAG17)| grepl("S5|9593|842|S6", DIAG18)| grepl("S5|9593|842|S6", DIAG19)| grepl("S5|9593|842|S6", DIAG21)| grepl("S5|9593|842|S6", DIAG22)| grepl("S5|9593|842|S6", DIAG23)| grepl("S5|9593|842|S6", DIAG24)| grepl("S5|9593|842|S6", DIAG25)| grepl("S5|9593|842|S6", DIAG26)| grepl("S5|9593|842|S6", DIAG27)| grepl("S5|9593|842|S6", DIAG28)) %>%
  group_by(sport, SEX, YEAR) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

ggplot(data=ip_elbows_forearms_wrists, aes(x=sport, y=count,)) +
  geom_bar(stat="identity") +
  ggtitle("IP Elbows Forearms Wrists injuries")


op_elbows_forearms_wrists <- opall_all %>%
  filter(grepl("S5|9593|842|S6", PRINDIAG) | grepl("S5|9593|842|S6", DIAG1) | grepl("S5|9593|842|S6", DIAG2) | grepl("S5|9593|842|S6", DIAG3) | grepl("S5|9593|842|S6", DIAG4) | grepl("S5|9593|842|S6", DIAG5) | grepl("S5|9593|842|S6", DIAG6) | grepl("S5|9593|842|S6", DIAG7) | grepl("S5|9593|842|S6", DIAG8)| grepl("S5|9593|842|S6", DIAG9)| grepl("S5|9593|842|S6", DIAG10)| grepl("S5|9593|842|S6", DIAG11)| grepl("S5|9593|842|S6", DIAG12)| grepl("S5|9593|842|S6", DIAG13)| grepl("S5|9593|842|S6", DIAG14)| grepl("S5|9593|842|S6", DIAG15)| grepl("S5|9593|842|S6", DIAG16)| grepl("S5|9593|842|S6", DIAG17)| grepl("S5|9593|842|S6", DIAG18)| grepl("S5|9593|842|S6", DIAG19)| grepl("S5|9593|842|S6", DIAG21)| grepl("S5|9593|842|S6", DIAG22)| grepl("S5|9593|842|S6", DIAG23)| grepl("S5|9593|842|S6", DIAG24)| grepl("S5|9593|842|S6", DIAG25)| grepl("S5|9593|842|S6", DIAG26)| grepl("S5|9593|842|S6", DIAG27)| grepl("S5|9593|842|S6", DIAG28)) %>%
  group_by(sport, SEX, YEAR) %>%
  summarise(count = n()) %>%
  arrange(desc(count))


ggplot(data=op_elbows_forearms_wrists, aes(x=sport, y=count,)) +
  geom_bar(stat="identity") +
  ggtitle("OP Elbows Forearms Wrists injuries")



write_csv(op_ankle_sprains)
write_csv(ip_ankle_sprains)
write_csv(op_knee_leg_sprains)
write_csv(op_ankle_sprains)
write_csv(concussions_op_all )
write_csv(concussions_ip_all)  
write_csv(sport_count, "sport_prindiag_count.csv")


#### so exploratory queries were a hoot. Now let's do what's needed. 

#renames the gender fields to male female and unknown using a nested ifelse function
opall_all$SEX <- ifelse(opall_all$SEX == 1, "MALE", ifelse(opall_all$SEX == 2,"FEMALE", "UNKNOWN"))
ipall_all$SEX <- ifelse(ipall_all$SEX == 1, "MALE", ifelse(ipall_all$SEX == 2,"FEMALE", "UNKNOWN"))
#for race
opall_all$RACE <- ifelse(opall_all$RACE == 1, "WHITE", ifelse(opall_all$RACE == 2,"BLACK", ifelse(opall_all$RACE == 3,"ASIAN", ifelse(opall_all$RACE == 4,"AMERICAN INDIAN/ALASKA NATIVE", ifelse(opall_all$RACE == 5,"OTHER", ifelse(opall_all$RACE == 6,"TWO OR MORE RACES", ifelse(opall_all$RACE == 7 ,"NATIVE HAWAIIAN OR PACIFIC ISLANDER", ifelse(opall_all$RACE == 8,"DECLINED TO ANSWER", "UNKNOWN"))))))))
ipall_all$RACE <- ifelse(ipall_all$RACE == 1, "WHITE", ifelse(ipall_all$RACE == 2,"BLACK", ifelse(ipall_all$RACE == 3,"ASIAN", ifelse(ipall_all$RACE == 4,"AMERICAN INDIAN/ALASKA NATIVE", ifelse(ipall_all$RACE == 5,"OTHER", ifelse(ipall_all$RACE == 6,"TWO OR MORE RACES", ifelse(ipall_all$RACE == 7 ,"NATIVE HAWAIIAN OR PACIFIC ISLANDER", ifelse(ipall_all$RACE == 8,"DECLINED TO ANSWER", "UNKNOWN"))))))))


#first let's merge a zip code table with our darta so we can look on a city level, though we will also pull the zip codes too. 

data(zipcode)
View(zipcode) 
#creates a merged list of zip codes and the hogan information. 
ipall_all_with_zips <-  left_join(ipall_all, zipcode, by =c("ZIPCODE" = "zip"))
opall_all_with_zips <- left_join(opall_all, zipcode, by =c("ZIPCODE" = "zip"))



#All over time, if possible
#1 bar chart of total injuries -- 
#2 line graph with injuries by quarter by sport.
#3 line graph with injuries by gender and sport -- specifically, baseball, basketball, soccer, lacrosse cheer.
#4 concussions by sport over time /  concussions as a percentage of all injuries 
#5 overall cost/average cost for sports 
#6 basball arm injuries over time
#8 lower extremity injuries in Football - 
#hockey, soccer, football, lax -- by gender over time 
#cardiac arrest and death by sport over time 



#1- we're doing total IP injuries and grouping them by sport.


ip_injuries_by_sport <- ipall_all_with_zips %>%
  group_by(sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
ip_injuries_by_sport[1:10,]
#now we're looking at all OP injuries and grouping them by sport 
op_injuries_by_sport <- opall_all_with_zips %>%
  group_by(sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
op_injuries_by_sport[1:10,]

#identifies the columns with nunbers below 10 and replaces them with Less than 10. 
ip_injuries_by_sport$count[ip_injuries_by_sport$count<=10] <- "Less than 10"
op_injuries_by_sport$count[op_injuries_by_sport$count<=10] <- "Less than 10"


write_csv(ip_injuries_by_sport, "ip_injuries_by_sport.csv")
write_csv(op_injuries_by_sport, "op_injuries_by_sport.csv")



#2 - Now we are just looking at all IP injuries and grouping them by QTR.



ip_by_year_sport<- ipall_all_with_zips %>%
  group_by(YEAR, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
ip_by_year_sport[1:10,]
#now we're looking at all OP injuries and grouping them by QTR 
op_by_year_sport<- opall_all_with_zips %>%
  group_by(YEAR, sport) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
op_by_year_sport[1:10,]

ip_by_year_sport$count[ip_by_year_sport$count<=10] <- "Less than 10"
op_by_year_sport$count[op_by_year_sport$count<=10] <- "Less than 10"


write_csv(ip_by_year_sport, "ip_by_year_sport.csv")
write_csv(op_by_year_sport, "op_by_year_sport.csv")

#3 - Now we are just looking at all IP injuries and grouping them by QTR.

ip_by_sport_year_gender <- ipall_all_with_zips %>%
  group_by(SEX, sport, YEAR) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
ip_by_sport_year_gender[1:10,]
#now we're looking at all OP injuries and grouping them by QTR 
op_by_sport_year_gender <- opall_all_with_zips %>%
  group_by(SEX, sport, YEAR) %>%
  summarise(count = n()) %>%
  #arrange the list in descending order
  arrange(desc(count)) 
op_by_sport_year_gender[1:10,]

ip_by_sport_year_gender$count[ip_by_sport_year_gender$count<=10] <- "Less than 10"
op_by_sport_year_gender$count[op_by_sport_year_gender$count<=10] <- "Less than 10"

write_csv(ip_by_sport_year_gender, "ip_by_sport_year_gender.csv")
write_csv(op_by_sport_year_gender, "op_by_sport_year_gender.csv")

#4 concussions by sport over time



#this takes the ip codes that correspond to concussions, both for ICD9 and ICD10 and filters 

ip_concussions_year_sport <- ipall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(YEAR, sport) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
ip_concussions_year_sport[1:10,]

  #this takes the ip codes that correspond to concussions, both for ICD9 and ICD10 
op_concussions_year_sport  <- opall_all_with_zips %>%
    filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
    group_by(YEAR, sport) %>%
    summarise(concussions_count = n()) %>%
    arrange(desc(concussions_count))
op_concussions_year_sport [1:10,]


#identifies the columns with nunbers below 10 and replaces them with Less than 10. 
op_concussions_year_sport$concussions_count[op_concussions_year_sport$concussions_count<=10] <- "Less than 10"
ip_concussions_year_sport$concussions_count[ip_concussions_year_sport$concussions_count<=10] <- "Less than 10"


write_csv(op_concussions_year_sport, "op_concussions_year_sport.csv")
write_csv(ip_concussions_year_sport, "ip_concussions_year_sport.csv")

# 4b this is just concussions bg sport 
ip_concussions_sport <- ipall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(sport) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
ip_concussions_sport[1:10,]

#this takes the ip codes that correspond to concussions, both for ICD9 and ICD10 
op_concussions_sport  <- opall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(sport) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
op_concussions_sport [1:10,]




#identifies the columns with nunbers below 10 and replaces them with Less than 10. 
op_concussions_sport$concussions_count[op_concussions_sport$concussions_count<=10] <- "Less than 10"
ip_concussions_sport$concussions_count[ip_concussions_sport$concussions_count<=10] <- "Less than 10"


write_csv(op_concussions_sport, "op_concussions_sport.csv")
write_csv(ip_concussions_sport, "ip_concussions_sport.csv")

# 4c this is just concussions bg sport 
ip_concussions_sport_sex <- ipall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(SEX, sport) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
ip_concussions_sport_sex[1:10,]

#this takes the ip codes that correspond to concussions, both for ICD9 and ICD10 
op_concussions_sport_sex  <- opall_all_with_zips %>%
  filter(grepl("S060X0A|8500|S060X9|8502|8505|8509", PRINDIAG) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG1) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG2) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG3) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG4) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG5) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG6) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG7) | grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG8)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG9)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG10)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG11)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG12)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG13)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG14)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG15)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG16)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG17)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG18)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG19)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG21)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG22)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG23)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG24)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG25)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG26)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG27)| grepl("S060X0A|8500|S060X9|8502|8505|8509", DIAG28)) %>%
  group_by(SEX, sport) %>%
  summarise(concussions_count = n()) %>%
  arrange(desc(concussions_count))
op_concussions_sport_sex [1:10,]




#identifies the columns with nunbers below 10 and replaces them with Less than 10. 
op_concussions_sport_sex$concussions_count[op_concussions_sport_sex$concussions_count<=10] <- "Less than 10"
ip_concussions_sport_sex$concussions_count[ip_concussions_sport_sex$concussions_count<=10] <- "Less than 10"


write_csv(op_concussions_sport_sex, "op_concussions_sport_sex.csv")
write_csv(ip_concussions_sport_sex, "ip_concussions_sport_sex.csv")

#5 overall cost/average cost for sports
 
  #total chg op for each sport by gender
  op_cost_sport_gender <- opall_all_with_zips %>%
    group_by(sport, SEX) %>%
    summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
    arrange(desc(total_cost ))
  op_cost_sport_gender [1:10,]
  #total chg ip for each sport by gender
  ip_cost_sport_gender <- ipall_all_with_zips %>%
    group_by(sport, SEX) %>%
    summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
    arrange(desc(total_cost ))
  ip_cost_sport_gender[1:10,]
  
  
  #total chg op for each sport
  op_cost_sport <- opall_all_with_zips %>%
    group_by(sport) %>%
    summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
    arrange(desc(total_cost ))
  op_cost_sport[1:10,]
  #total chg ip for each sport by gender
  ip_cost_sport <- ipall_all_with_zips %>%
    group_by(sport) %>%
    summarise(total_cost = sum(TOT_CHG), avg_cost = mean(TOT_CHG)) %>%
    arrange(desc(total_cost ))
  ip_cost_sport[1:10,]
  
  write_csv( op_cost_sport_gender, "op_cost_sport_gender.csv")
  write_csv(op_cost_sport_gender, "op_cost_sport_gender.csv")
  write_csv(op_cost_sport, "op_cost_sport.csv")
  write_csv(ip_cost_sport, "ip_cost_sport.csv")
  
  
  #6 basball arm injuries over time
  #S5 is an icd 10 code and it covers all injuries to the elbow and forearm, ICD9 codes are 9593 is elbow and forearm injuries. 842 is wrist injuries. S6 is the icd10 wrist code. 
  
  ip_elbows_forearms_wrists <- ipall_all_with_zips %>%
    filter(grepl("S5|9593|842|S6", PRINDIAG) | grepl("S5|9593|842|S6", DIAG1) | grepl("S5|9593|842|S6", DIAG2) | grepl("S5|9593|842|S6", DIAG3) | grepl("S5|9593|842|S6", DIAG4) | grepl("S5|9593|842|S6", DIAG5) | grepl("S5|9593|842|S6", DIAG6) | grepl("S5|9593|842|S6", DIAG7) | grepl("S5|9593|842|S6", DIAG8)| grepl("S5|9593|842|S6", DIAG9)| grepl("S5|9593|842|S6", DIAG10)| grepl("S5|9593|842|S6", DIAG11)| grepl("S5|9593|842|S6", DIAG12)| grepl("S5|9593|842|S6", DIAG13)| grepl("S5|9593|842|S6", DIAG14)| grepl("S5|9593|842|S6", DIAG15)| grepl("S5|9593|842|S6", DIAG16)| grepl("S5|9593|842|S6", DIAG17)| grepl("S5|9593|842|S6", DIAG18)| grepl("S5|9593|842|S6", DIAG19)| grepl("S5|9593|842|S6", DIAG21)| grepl("S5|9593|842|S6", DIAG22)| grepl("S5|9593|842|S6", DIAG23)| grepl("S5|9593|842|S6", DIAG24)| grepl("S5|9593|842|S6", DIAG25)| grepl("S5|9593|842|S6", DIAG26)| grepl("S5|9593|842|S6", DIAG27)| grepl("S5|9593|842|S6", DIAG28)) %>%
     group_by(sport, SEX) %>%
    summarise(count = n()) %>%
    arrange(desc(count))
  
  op_elbows_forearms_wrists <- opall_all_with_zips %>%
    filter(grepl("S5|9593|842|S6", PRINDIAG) | grepl("S5|9593|842|S6", DIAG1) | grepl("S5|9593|842|S6", DIAG2) | grepl("S5|9593|842|S6", DIAG3) | grepl("S5|9593|842|S6", DIAG4) | grepl("S5|9593|842|S6", DIAG5) | grepl("S5|9593|842|S6", DIAG6) | grepl("S5|9593|842|S6", DIAG7) | grepl("S5|9593|842|S6", DIAG8)| grepl("S5|9593|842|S6", DIAG9)| grepl("S5|9593|842|S6", DIAG10)| grepl("S5|9593|842|S6", DIAG11)| grepl("S5|9593|842|S6", DIAG12)| grepl("S5|9593|842|S6", DIAG13)| grepl("S5|9593|842|S6", DIAG14)| grepl("S5|9593|842|S6", DIAG15)| grepl("S5|9593|842|S6", DIAG16)| grepl("S5|9593|842|S6", DIAG17)| grepl("S5|9593|842|S6", DIAG18)| grepl("S5|9593|842|S6", DIAG19)| grepl("S5|9593|842|S6", DIAG21)| grepl("S5|9593|842|S6", DIAG22)| grepl("S5|9593|842|S6", DIAG23)| grepl("S5|9593|842|S6", DIAG24)| grepl("S5|9593|842|S6", DIAG25)| grepl("S5|9593|842|S6", DIAG26)| grepl("S5|9593|842|S6", DIAG27)| grepl("S5|9593|842|S6", DIAG28)) %>%
    group_by(sport, SEX) %>%
    summarise(count = n()) %>%
    arrange(desc(count))
  
  
  
  ip_elbows_forearms_wrists$count[ip_elbows_forearms_wrists$count<=10] <- "Less than 10"
  op_elbows_forearms_wrists$count[op_elbows_forearms_wrists$count<=10] <- "Less than 10"
  
  write_csv( ip_elbows_forearms_wrists, " ip_elbows_forearms_wrists.csv")
  write_csv(op_elbows_forearms_wrists, "op_elbows_forearms_wrists.csv")
  
  
  
#8 lower extremity injuries in Football - 
  
  
ip_knee_leg_ankle_sprains <- ipall_all_with_zips %>%
    filter(grepl("S934|8450|S83|S86|8449", PRINDIAG) | grepl("S934|8450|S83|S86|8449", DIAG1) | grepl("S934|8450|S83|S86|8449", DIAG2) | grepl("S934|8450|S83|S86|8449", DIAG3) | grepl("S934|8450|S83|S86|8449", DIAG4) | grepl("S934|8450|S83|S86|8449", DIAG5) | grepl("S934|8450|S83|S86|8449", DIAG6) | grepl("S934|8450|S83|S86|8449", DIAG7) | grepl("S934|8450|S83|S86|8449", DIAG8)| grepl("S934|8450|S83|S86|8449", DIAG9)| grepl("S934|8450|S83|S86|8449", DIAG10)| grepl("S934|8450|S83|S86|8449", DIAG11)| grepl("S934|8450|S83|S86|8449", DIAG12)| grepl("S934|8450|S83|S86|8449", DIAG13)| grepl("S934|8450|S83|S86|8449", DIAG14)| grepl("S934|8450|S83|S86|8449", DIAG15)| grepl("S934|8450|S83|S86|8449", DIAG16)| grepl("S934|8450|S83|S86|8449", DIAG17)| grepl("S934|8450|S83|S86|8449", DIAG18)| grepl("S934|8450|S83|S86|8449", DIAG19)| grepl("S934|8450|S83|S86|8449", DIAG21)| grepl("S934|8450|S83|S86|8449", DIAG22)| grepl("S934|8450|S83|S86|8449", DIAG23)| grepl("S934|8450|S83|S86|8449", DIAG24)| grepl("S934|8450|S83|S86|8449", DIAG25)| grepl("S934|8450|S83|S86|8449", DIAG26)| grepl("S934|8450|S83|S86|8449", DIAG27)| grepl("S934|8450|S83|S86|8449", DIAG28)) %>%
    group_by(sport, SEX) %>%
    summarise(knee_leg_ankle_sprain_count = n()) %>%
    arrange(desc(knee_leg_ankle_sprain_count))
  
  op_knee_leg_ankle_sprains <- opall_all_with_zips %>%
    filter(grepl("S934|8450|S83|S86|8449", PRINDIAG) | grepl("S934|8450|S83|S86|8449", DIAG1) | grepl("S934|8450|S83|S86|8449", DIAG2) | grepl("S934|8450|S83|S86|8449", DIAG3) | grepl("S934|8450|S83|S86|8449", DIAG4) | grepl("S934|8450|S83|S86|8449", DIAG5) | grepl("S934|8450|S83|S86|8449", DIAG6) | grepl("S934|8450|S83|S86|8449", DIAG7) | grepl("S934|8450|S83|S86|8449", DIAG8)| grepl("S934|8450|S83|S86|8449", DIAG9)| grepl("S934|8450|S83|S86|8449", DIAG10)| grepl("S934|8450|S83|S86|8449", DIAG11)| grepl("S934|8450|S83|S86|8449", DIAG12)| grepl("S934|8450|S83|S86|8449", DIAG13)| grepl("S934|8450|S83|S86|8449", DIAG14)| grepl("S934|8450|S83|S86|8449", DIAG15)| grepl("S934|8450|S83|S86|8449", DIAG16)| grepl("S934|8450|S83|S86|8449", DIAG17)| grepl("S934|8450|S83|S86|8449", DIAG18)| grepl("S934|8450|S83|S86|8449", DIAG19)| grepl("S934|8450|S83|S86|8449", DIAG21)| grepl("S934|8450|S83|S86|8449", DIAG22)| grepl("S934|8450|S83|S86|8449", DIAG23)| grepl("S934|8450|S83|S86|8449", DIAG24)| grepl("S934|8450|S83|S86|8449", DIAG25)| grepl("S934|8450|S83|S86|8449", DIAG26)| grepl("S934|8450|S83|S86|8449", DIAG27)| grepl("S934|8450|S83|S86|8449", DIAG28)) %>%
    group_by(sport, SEX) %>%
    summarise(knee_leg_ankle_sprain_count = n()) %>%
    arrange(desc(knee_leg_ankle_sprain_count))
  
  
  #ok so year made a wonky graph. So now we're trying to zero in on quarter data.
  #so, here we are converting the year and quarter field into one. 
  op_knee_leg_ankle_sprains$NewDate <- as.yearqtr(paste(op_knee_leg_ankle_sprains$YEAR, op_knee_leg_ankle_sprains$QTR, sep = ' Q'))
  #now we are using the library(zoo) to make them a yearqtr type...this should help us graph
  yearqtr(op_knee_leg_ankle_sprains$NewDate)
  #making sure it's a yearqtr field 
  class(op_knee_leg_ankle_sprains$NewDate)
  #and now we try and count and groupbefore we graph. 
  ip_year_qtr<- op_knee_leg_ankle_sprains %>%
    group_by(NewDate, sport) %>%
    summarise(count = n()) %>%
    #arrange the list in descending order
    arrange(desc(NewDate)) 
  
  #now we graph. Looks funny but looks right. 
  ggplot(data=op_knee_leg_ankle_sprains, aes(x=NewDate, y=knee_leg_ankle_sprain_count, group=sport)) +
    geom_line(aes(color=sport))+
    geom_point(aes(color=sport)) +
    scale_x_yearqtr(format="%YQ%q", n=5) +
    xlab("Quarter") +
    ylab("Number of injuries") +
    ggtitle("OP Year by quarter")
  
  
  op_knee_leg_ankle_sprains$knee_leg_ankle_sprain_count[ op_knee_leg_ankle_sprains$knee_leg_ankle_sprain_count<=10] <- "Less than 10"
  ip_knee_leg_ankle_sprains$knee_leg_ankle_sprain_count[ ip_knee_leg_ankle_sprains$knee_leg_ankle_sprain_count<=10] <- "Less than 10"
  
  
  
  write_csv(ip_knee_leg_ankle_sprains, "ip_knee_leg_ankle_sprains.csv")
  write_csv(op_knee_leg_ankle_sprains , "op_knee_leg_ankle_sprains.csv")
  
  