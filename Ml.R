library(dslabs)
library(dplyr)
install.packages("lubridate")
library(lubridate)
install.packages("caret")
library(caret)
library(dplyr)

data("reported_heights")

dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)

y <- factor(dat$sex, c("Female", "Male"))
x <- dat$type

##Ratio of inclass females
inclassF <- filter(dat,dat$type=="inclass")
sum(inclassF=="Female")/length(inclassF$sex)

##Ratio of online females
onlineF <- filter(dat,dat$type=="online")
sum(onlineF=="Female")/length(onlineF$sex)

dat <- dat%>%
  mutate(genderP=ifelse(dat$type="inclass",yes="female",no="male"))
table(predicted=y_hat,actual=y)

sum(dat$sex=="Female")/length(dat$sex)

y_hat <- ifelse(x == "online", "Male", "Female") %>% 
  factor(levels = levels(y))
mean(y_hat==y)

confusionMatrix(data=y_hat,reference=y)
