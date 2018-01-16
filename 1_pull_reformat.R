rm(list=ls())

library(dplyr)
library(lubridate)
library(ggplot2)
library(dplyr)
library(tidyr)
library(broom)
library(forcats)
library(magrittr)
library(scales)
library(ggbeeswarm)
library(ggjoy)

theme_set(theme_bw())



library(RCurl)
result <- postForm(
  uri='https://redcap.cir.ed.ac.uk/api/',
  #this token is for a test-project with made-up data
  token='7D3DFFEDD6C516586BDDCA03F96CBAD5',
  content='record',
  format='csv',
  type='flat',
  rawOrLabel='raw',
  rawOrLabelHeaders='raw',
  exportCheckboxLabel='false',
  exportSurveyFields='false',
  exportDataAccessGroups='true',
  returnFormat='csv'
)
data = read.csv(textConnection(result), stringsAsFactors = FALSE)


rm(result)
source('HealthyRColonDataset_R_2017-07-23_2029.r')

data$date = ymd(data$date)

mydata = data
rm('data') #and example of why I don't like using "data" as a dataframe name - rm(data) errors.

mydata  = mydata %>% 
  mutate(combined_outcome = paste0(etype_1.factor, '-', etype_2.factor)) %>% 
  arrange(date)

# temp for picture - everything's actually set to complete
mydata$is_complete = c(
  sample(c('Started', 'Complete'), 300, prob = c(0.1, 0.9), replace = TRUE),
  sample(c('Started', 'Complete'), 300, prob = c(0.3, 0.7), replace = TRUE),
  sample(c('Started', 'Complete'), 329, prob = c(0.6, 0.4), replace = TRUE))






