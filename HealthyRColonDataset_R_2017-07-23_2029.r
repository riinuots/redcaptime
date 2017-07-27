# #Clear existing data and graphics
# rm(list=ls())
# graphics.off()
# #Load Hmisc library
# library(Hmisc)
# #Read Data
# data=read.csv('HealthyRColonDataset_DATA_2017-07-23_2029.csv')
# #Setting Labels
# 
# label(data$record_id)="Record ID"
# label(data$redcap_data_access_group)="Data Access Group"
# label(data$date)="Date added"
# label(data$age)="Age at diagnosis"
# label(data$sex)="Sex"
# label(data$demographics_complete)="Complete?"
# label(data$obstruct)="Obstruction of colon by tumour"
# label(data$perfor)="Perforation of colon"
# label(data$adhere)="Adherence to nearby organs"
# label(data$nodes)="Number of lymph nodes with detectable cancer"
# label(data$differ)="Differentiation of tumour"
# label(data$extent)="Extent of local spread"
# label(data$surg)="Time from surgery to registration"
# label(data$node4)="More than 4 positive lymph nodes"
# label(data$rx)="Treatment"
# label(data$pathology_complete)="Complete?"
# label(data$etype_1)="Event type"
# label(data$time_1)="Time of event"
# label(data$etype_2)="Event type"
# label(data$time_2)="Time of event"
# label(data$outcomes_complete)="Complete?"
# #Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_data_access_group.factor = factor(data$redcap_data_access_group,levels=c("hospital_1","hospital_2","hospital_3","hospital_4","hospital_5","hospital_6"))
data$sex.factor = factor(data$sex,levels=c("0","1"))
data$demographics_complete.factor = factor(data$demographics_complete,levels=c("0","1","2"))
data$obstruct.factor = factor(data$obstruct,levels=c("0","1"))
data$perfor.factor = factor(data$perfor,levels=c("0","1"))
data$adhere.factor = factor(data$adhere,levels=c("0","1"))
data$differ.factor = factor(data$differ,levels=c("1","2","3"))
data$extent.factor = factor(data$extent,levels=c("1","2","3","4"))
data$surg.factor = factor(data$surg,levels=c("0","1"))
data$node4.factor = factor(data$node4,levels=c("0","1"))
data$rx.factor = factor(data$rx,levels=c("1","2","3"))
data$pathology_complete.factor = factor(data$pathology_complete,levels=c("0","1","2"))
data$etype_1.factor = factor(data$etype_1,levels=c("0","1","2"))
data$etype_2.factor = factor(data$etype_2,levels=c("0","1","2"))
data$outcomes_complete.factor = factor(data$outcomes_complete,levels=c("0","1","2"))

levels(data$redcap_data_access_group.factor)=c("Hospital 1","Hospital 2","Hospital 3","Hospital 4","Hospital 5","Hospital 6")
levels(data$sex.factor)=c("Female","Male")
levels(data$demographics_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$obstruct.factor)=c("No","Yes")
levels(data$perfor.factor)=c("No","Yes")
levels(data$adhere.factor)=c("No","Yes")
levels(data$differ.factor)=c("Well","Moderate","Poor")
levels(data$extent.factor)=c("Submucosa","Muscle","Serosa","Contiguous structures")
levels(data$surg.factor)=c("Short","Long")
levels(data$node4.factor)=c("No","Yes")
levels(data$rx.factor)=c("Obs","Lev","Lev+5FU")
levels(data$pathology_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$etype_1.factor)=c("Censored","Recurrence","Death")
levels(data$etype_2.factor)=c("Censored","Recurrence","Death")
levels(data$outcomes_complete.factor)=c("Incomplete","Unverified","Complete")
