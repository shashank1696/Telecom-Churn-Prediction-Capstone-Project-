library(dplyr)
library(dataQualityR)
library(readr)

project = read.csv("C:\\DS Full stack\\Graded Assignments\\09 - Capstone Project  and Certitication\\telecomfinal.csv",stringsAsFactors = T)
#View(project)
options(scipen = 999)
names(project)
str(project)
summary(project)

getwd()
setwd("C://Jig18073")

# Data Quality Report
checkDataQuality(data = project,out.file.num =  "dqr_num.csv", out.file.cat = "dqr_cat.csv")

#missing value for retdays and creating dummies
summary(project$retdays)
sort(unique(project$retdays),na.last = F)
project$retdays1 = ifelse(is.na(project$retdays)==TRUE,0,1)
str(project$retdays1)
summary(project$retdays1)
names(project)


#missing values which are more than 15% are removed a new dataset is formed
project1 = project[,colMeans(is.na(project))<=0.15]
names(project1)

# As the variable drp_blk_mean is created by adding blck_dat_Mean,drop_vce_Mean,drop_dat_Mean,blck_vce_mean
#therefore, drp_blk_mean is removed
project1 = project1[,-50]
names(project1$drop_blk_Mean)

#data exploration where proC is for categorical variables
#and pro is for continuous variables
names(project1)
str(project1)

#Considering CONTINUOUS VARIABLES
#mou_mean variable
summary(project1$mou_Mean)
project1%>%mutate(dec=ntile(mou_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro1
pro1$N = unclass(project1%>%mutate(dec=ntile(mou_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro1$churn_perc = round(pro1$n/pro1$N,2)
pro1$GreaterThan = unclass(project1%>%mutate(dec=ntile(mou_Mean,n=10))%>%group_by(dec)%>%summarise(min(mou_Mean)))[[2]]
pro1$LessThan = unclass(project1%>%mutate(dec=ntile(mou_Mean,n=10))%>%group_by(dec)%>%summarise(max(mou_Mean)))[[2]]
pro1$varname = rep("mou_Mean",nrow(pro1))
pro1

#totmrc_Mean variable
summary(project1$totmrc_Mean)
project1%>%mutate(dec=ntile(totmrc_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro2
pro2$N = unclass(project1%>%mutate(dec=ntile(totmrc_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro2$churn_perc = pro2$n/pro2$N
pro2$GreaterThan = unclass(project1%>%mutate(dec=ntile(totmrc_Mean,n=10))%>%group_by(dec)%>%summarise(min(totmrc_Mean)))[[2]]
pro2$LessThan = unclass(project1%>%mutate(dec=ntile(totmrc_Mean,n=10))%>%group_by(dec)%>%summarise(max(totmrc_Mean)))[[2]]
pro2$varname = rep("totmrc_Mean",nrow(pro2))
pro2

#rev_Range variable
summary(project1$rev_Range)
project1%>%mutate(dec=ntile(rev_Range,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro3
pro3$N = unclass(project1%>%mutate(dec=ntile(rev_Range,n=10))%>%count(dec)%>%unname())[[2]]
pro3$churn_perc = pro3$n/pro3$N
pro3$GreaterThan = unclass(project1%>%mutate(dec=ntile(rev_Range,n=10))%>%group_by(dec)%>%summarise(min(rev_Range)))[[2]]
pro3$LessThan = unclass(project1%>%mutate(dec=ntile(rev_Range,n=10))%>%group_by(dec)%>%summarise(max(rev_Range)))[[2]]
pro3$varname = rep("rev_Range",nrow(pro3))
pro3

#mou_Range variable
summary(project1$mou_Range)
project1%>%mutate(dec=ntile(mou_Range,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro4
pro4$N = unclass(project1%>%mutate(dec=ntile(rev_Range,n=10))%>%count(dec)%>%unname())[[2]]
pro4$churn_perc = pro4$n/pro4$N
pro4$GreaterThan = unclass(project1%>%mutate(dec=ntile(mou_Range,n=10))%>%group_by(dec)%>%summarise(min(mou_Range)))[[2]]
pro4$LessThan = unclass(project1%>%mutate(dec=ntile(rev_Range,n=10))%>%group_by(dec)%>%summarise(max(mou_Range)))[[2]]
pro4$varname = rep("mou_Range",nrow(pro4))
pro4

#change_mou variable
summary(project1$change_mou)
project1%>%mutate(dec=ntile(change_mou,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro5
pro5$N = unclass(project1%>%mutate(dec=ntile(change_mou,n=10))%>%count(dec)%>%unname())[[2]]
pro5$churn_perc = pro5$n/pro5$N
pro5$GreaterThan = unclass(project1%>%mutate(dec=ntile(change_mou,n=10))%>%group_by(dec)%>%summarise(min(change_mou)))[[2]]
pro5$LessThan = unclass(project1%>%mutate(dec=ntile(change_mou,n=10))%>%group_by(dec)%>%summarise(max(change_mou)))[[2]]
pro5$varname = rep("change_mou",nrow(pro5))
pro5

#drop_blk_Mean variable
summary(project1$drop_blk_Mean)
project1%>%mutate(dec=ntile(drop_blk_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro6
pro6$N = unclass(project1%>%mutate(dec=ntile(drop_blk_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro6$churn_perc = pro6$n/pro6$N
pro6$GreaterThan = unclass(project1%>%mutate(dec=ntile(drop_blk_Mean,n=10))%>%group_by(dec)%>%summarise(min(drop_blk_Mean)))[[2]]
pro6$LessThan = unclass(project1%>%mutate(dec=ntile(drop_blk_Mean,n=10))%>%group_by(dec)%>%summarise(max(drop_blk_Mean)))[[2]]
pro6$varname = rep("drop_blk_Mean",nrow(pro6))
pro6

#drop_vce_Range variable
summary(project1$drop_vce_Range)
project1%>%mutate(dec=ntile(drop_vce_Range,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro7
pro7$N = unclass(project1%>%mutate(dec=ntile(drop_vce_Range,n=10))%>%count(dec)%>%unname())[[2]]
pro7$churn_perc = pro7$n/pro7$N
pro7$GreaterThan = unclass(project1%>%mutate(dec=ntile(drop_vce_Range,n=10))%>%group_by(dec)%>%summarise(min(drop_vce_Range)))[[2]]
pro7$LessThan = unclass(project1%>%mutate(dec=ntile(drop_vce_Range,n=10))%>%group_by(dec)%>%summarise(max(drop_vce_Range)))[[2]]
pro7$varname = rep("drop_vce_Range",nrow(pro7))
pro7

#owylis_vce_Range variable
summary(project1$owylis_vce_Range)
project1%>%mutate(dec=ntile(owylis_vce_Range,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro8
pro8$N = unclass(project1%>%mutate(dec=ntile(owylis_vce_Range,n=10))%>%count(dec)%>%unname())[[2]]
pro8$churn_perc = pro8$n/pro8$N
pro8$GreaterThan = unclass(project1%>%mutate(dec=ntile(owylis_vce_Range,n=10))%>%group_by(dec)%>%summarise(min(owylis_vce_Range)))[[2]]
pro8$LessThan = unclass(project1%>%mutate(dec=ntile(owylis_vce_Range,n=10))%>%group_by(dec)%>%summarise(max(owylis_vce_Range)))[[2]]
pro8$varname = rep("owylis_vce_Range",nrow(pro8))
pro8

#mou_opkv_Range variable
summary(project1$mou_opkv_Range)
project1%>%mutate(dec=ntile(mou_opkv_Range,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro9
pro9$N = unclass(project1%>%mutate(dec=ntile(mou_opkv_Range,n=10))%>%count(dec)%>%unname())[[2]]
pro9$churn_perc = pro9$n/pro9$N
pro9$GreaterThan = unclass(project1%>%mutate(dec=ntile(mou_opkv_Range,n=10))%>%group_by(dec)%>%summarise(min(mou_opkv_Range)))[[2]]
pro9$LessThan = unclass(project1%>%mutate(dec=ntile(mou_opkv_Range,n=10))%>%group_by(dec)%>%summarise(max(mou_opkv_Range)))[[2]]
pro9$varname = rep("mou_opkv_Range",nrow(pro9))
pro9

#months variable
summary(project1$months)
project1%>%mutate(dec=ntile(months,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro10
pro10$N = unclass(project1%>%mutate(dec=ntile(months,n=10))%>%count(dec)%>%unname())[[2]]
pro10$churn_perc = pro10$n/pro10$N
pro10$GreaterThan = unclass(project1%>%mutate(dec=ntile(months,n=10))%>%group_by(dec)%>%summarise(min(months)))[[2]]
pro10$LessThan = unclass(project1%>%mutate(dec=ntile(months,n=10))%>%group_by(dec)%>%summarise(max(months)))[[2]]
pro10$varname = rep("months",nrow(pro10))
pro10

#totcalls variable
summary(project1$totcalls)
project1%>%mutate(dec=ntile(totcalls,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro11
pro11$N = unclass(project1%>%mutate(dec=ntile(totcalls,n=10))%>%count(dec)%>%unname())[[2]]
pro11$churn_perc = pro11$n/pro11$N
pro11$GreaterThan = unclass(project1%>%mutate(dec=ntile(totcalls,n=10))%>%group_by(dec)%>%summarise(min(totcalls)))[[2]]
pro11$LessThan = unclass(project1%>%mutate(dec=ntile(totcalls,n=10))%>%group_by(dec)%>%summarise(max(totcalls)))[[2]]
pro11$varname = rep("totcalls",nrow(pro11))
pro11

#eqpdays variable
summary(project1$eqpdays)
#removing 1 N.A value
ind = which(is.na(project1$eqpdays))
project1 = project1[-ind,]
#binning
project1%>%mutate(dec=ntile(eqpdays,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro12
pro12$N = unclass(project1%>%mutate(dec=ntile(eqpdays,n=10))%>%count(dec)%>%unname())[[2]]
pro12$churn_perc = pro12$n/pro12$N
pro12$GreaterThan = unclass(project1%>%mutate(dec=ntile(totcalls,n=10))%>%group_by(dec)%>%summarise(min(eqpdays)))[[2]]
pro12$LessThan = unclass(project1%>%mutate(dec=ntile(totcalls,n=10))%>%group_by(dec)%>%summarise(max(eqpdays)))[[2]]
pro12$varname = rep("eqpdays",nrow(pro12))
pro12

#custcare_Mean variable
summary(project1$custcare_Mean)
project1%>%mutate(dec=ntile(custcare_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro13
#data has 3 deciles which is less than 4. Therefore, removing the variable.
pro13$varname = rep("custcare_Mean",nrow(pro13))
pro13

#callwait_Mean variable
summary(project1$callwait_Mean)
#data has 4 deciles. Therefore n= 4
project1%>%mutate(dec=ntile(callwait_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro14
pro14$N = unclass(project1%>%mutate(dec=ntile(callwait_Mean,n=4))%>%count(dec)%>%unname())[[2]]
pro14$churn_perc = pro14$n/pro14$N
pro14$GreaterThan = unclass(project1%>%mutate(dec=ntile(callwait_Mean,n=4))%>%group_by(dec)%>%summarise(min(callwait_Mean)))[[2]]
pro14$LessThan = unclass(project1%>%mutate(dec=ntile(callwait_Mean,n=4))%>%group_by(dec)%>%summarise(max(callwait_Mean)))[[2]]
pro14$varname = rep("callwait_Mean",nrow(pro14))
pro14

#iwylis_vce_Mean variable
#data has 6 deciles. Therefore n= 6
project1%>%mutate(dec=ntile(iwylis_vce_Mean,n=6))%>%count(churn,dec)%>%filter(churn==1)->pro15
pro15$N = unclass(project1%>%mutate(dec=ntile(iwylis_vce_Mean,n=6))%>%count(dec)%>%unname())[[2]]
pro15$churn_perc = pro15$n/pro15$N
pro15$GreaterThan = unclass(project1%>%mutate(dec=ntile(iwylis_vce_Mean,n=6))%>%group_by(dec)%>%summarise(min(iwylis_vce_Mean)))[[2]]
pro15$LessThan = unclass(project1%>%mutate(dec=ntile(iwylis_vce_Mean,n=6))%>%group_by(dec)%>%summarise(max(iwylis_vce_Mean)))[[2]]
pro15$varname = rep("iwylis_vce_Mean",nrow(pro15))
pro15

#callwait_Range variable
project1%>%mutate(dec=ntile(callwait_Range,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro16
#data has 3 deciles which is less than 4. Therefore, removing the variable
#pro16$N = unclass(project1%>%mutate(dec=ntile(callwait_Range,n=4))%>%count(dec)%>%unname())[[2]]
pro16$varname = rep("callwait_Range",nrow(pro16))
pro16

#ccrndmou_Range variable
project1%>%mutate(dec=ntile(ccrndmou_Range,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro17
#data has 3 deciles which is less than 4. Therefore, removing the variable
#pro17$N = unclass(project1%>%mutate(dec=ntile(ccrndmou_Range,n=4))%>%count(dec)%>%unname())[[2]]
pro17$varname = rep("callwait_Range",nrow(pro17))
pro17

#adjqty variable
summary(project1$adjqty)
project1%>%mutate(dec=ntile(adjqty,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro18
pro18$N = unclass(project1%>%mutate(dec=ntile(adjqty,n=10))%>%count(dec)%>%unname())[[2]]
pro18$churn_perc = pro18$n/pro18$N
pro18$GreaterThan = unclass(project1%>%mutate(dec=ntile(adjqty,n=10))%>%group_by(dec)%>%summarise(min(adjqty)))[[2]]
pro18$LessThan = unclass(project1%>%mutate(dec=ntile(adjqty,n=10))%>%group_by(dec)%>%summarise(max(adjqty)))[[2]]
pro18$varname = rep("adjqty",nrow(pro18))
pro18

#ovrrev_Mean variable
project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro19
#data has 4 deciles. Therefore n= 4
pro19$N = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%count(dec)%>%unname())[[2]]
pro19$churn_perc = pro19$n/pro19$N
pro19$GreaterThan = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%group_by(dec)%>%summarise(min(ovrrev_Mean)))[[2]]
pro19$LessThan = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%group_by(dec)%>%summarise(max(ovrrev_Mean)))[[2]]
pro19$varname = rep("ovrrev_Mean",nrow(pro19))
pro19

#rev_Mean variable
project1%>%mutate(dec=ntile(rev_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro20
pro20$N = unclass(project1%>%mutate(dec=ntile(rev_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro20$churn_perc = pro20$n/pro20$N
pro20$GreaterThan = unclass(project1%>%mutate(dec=ntile(rev_Mean,n=10))%>%group_by(dec)%>%summarise(min(rev_Mean)))[[2]]
pro20$LessThan = unclass(project1%>%mutate(dec=ntile(rev_Mean,n=10))%>%group_by(dec)%>%summarise(max(rev_Mean)))[[2]]
pro20$varname = rep("rev_Mean",nrow(pro20))
pro20

#ovrmou_Mean variable
project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro21
#data has 4 deciles. Therefore n= 4
pro21$N = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%count(dec)%>%unname())[[2]]
pro21$churn_perc = pro21$n/pro21$N
pro21$GreaterThan = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%group_by(dec)%>%summarise(min(ovrrev_Mean)))[[2]]
pro21$LessThan = unclass(project1%>%mutate(dec=ntile(ovrrev_Mean,n=4))%>%group_by(dec)%>%summarise(max(ovrrev_Mean)))[[2]]
pro21$varname = rep("ovrrev_Mean",nrow(pro19))
pro21

#comp_vce_Mean variable##Remove
project1%>%mutate(dec=ntile(comp_vce_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro22
pro22$N = unclass(project1%>%mutate(dec=ntile(comp_vce_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro22$churn_perc = pro22$n/pro22$N
pro22$GreaterThan = unclass(project1%>%mutate(dec=ntile(comp_vce_Mean,n=10))%>%group_by(dec)%>%summarise(min(comp_vce_Mean)))[[2]]
pro22$LessThan = unclass(project1%>%mutate(dec=ntile(comp_vce_Mean,n=10))%>%group_by(dec)%>%summarise(max(comp_vce_Mean)))[[2]]
pro22$varname = rep("comp_vce_Mean",nrow(pro22))
pro22

#plcd_vce_Mean variable##Remove
project1%>%mutate(dec=ntile(plcd_vce_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro23
pro23$N = unclass(project1%>%mutate(dec=ntile(plcd_vce_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro23$churn_perc = pro23$n/pro23$N
pro23$GreaterThan = unclass(project1%>%mutate(dec=ntile(plcd_vce_Mean,n=10))%>%group_by(dec)%>%summarise(min(plcd_vce_Mean)))[[2]]
pro23$LessThan = unclass(project1%>%mutate(dec=ntile(plcd_vce_Mean,n=10))%>%group_by(dec)%>%summarise(max(plcd_vce_Mean)))[[2]]
pro23$varname = rep("plcd_vce_Mean",nrow(pro23))
pro23

#avg3mou variable
project1%>%mutate(dec=ntile(avg3mou,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro24
pro24$N = unclass(project1%>%mutate(dec=ntile(avg3mou,n=10))%>%count(dec)%>%unname())[[2]]
pro24$churn_perc = pro24$n/pro24$N
pro24$GreaterThan = unclass(project1%>%mutate(dec=ntile(avg3mou,n=10))%>%group_by(dec)%>%summarise(min(avg3mou)))[[2]]
pro24$LessThan = unclass(project1%>%mutate(dec=ntile(avg3mou,n=10))%>%group_by(dec)%>%summarise(max(avg3mou)))[[2]]
pro24$varname = rep("avg3mou",nrow(pro24))
pro24

#avgmou variable
project1%>%mutate(dec=ntile(avgmou,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro25
pro25$N = unclass(project1%>%mutate(dec=ntile(avgmou,n=10))%>%count(dec)%>%unname())[[2]]
pro25$churn_perc = pro25$n/pro25$N
pro25$GreaterThan = unclass(project1%>%mutate(dec=ntile(avgmou,n=10))%>%group_by(dec)%>%summarise(min(avgmou)))[[2]]
pro25$LessThan = unclass(project1%>%mutate(dec=ntile(avgmou,n=10))%>%group_by(dec)%>%summarise(max(avgmou)))[[2]]
pro25$varname = rep("avgmou",nrow(pro25))
pro25


#avg3qty variable
project1%>%mutate(dec=ntile(avg3qty,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro26
pro26$N = unclass(project1%>%mutate(dec=ntile(avg3qty,n=10))%>%count(dec)%>%unname())[[2]]
pro26$churn_perc = pro26$n/pro26$N
pro26$GreaterThan = unclass(project1%>%mutate(dec=ntile(avg3qty,n=10))%>%group_by(dec)%>%summarise(min(avg3qty)))[[2]]
pro26$LessThan = unclass(project1%>%mutate(dec=ntile(avg3qty,n=10))%>%group_by(dec)%>%summarise(max(avg3qty)))[[2]]
pro26$varname = rep("avg3qty",nrow(pro26))
pro26

#avgqty variable
project1%>%mutate(dec=ntile(avgqty,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro27
pro27$N = unclass(project1%>%mutate(dec=ntile(avgqty,n=10))%>%count(dec)%>%unname())[[2]]
pro27$churn_perc = pro27$n/pro27$N
pro27$GreaterThan = unclass(project1%>%mutate(dec=ntile(avgqty,n=10))%>%group_by(dec)%>%summarise(min(avgqty)))[[2]]
pro27$LessThan = unclass(project1%>%mutate(dec=ntile(avgqty,n=10))%>%group_by(dec)%>%summarise(max(avgqty)))[[2]]
pro27$varname = rep("avgqty",nrow(pro27))
pro27

#avg6mou variable
project1%>%mutate(dec=ntile(avg6mou,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro28
pro28$N = unclass(project1%>%mutate(dec=ntile(avg6mou,n=10))%>%count(dec)%>%unname())[[2]]
pro28$churn_perc = pro28$n/pro28$N
pro28$GreaterThan = unclass(project1%>%mutate(dec=ntile(avg6mou,n=10))%>%group_by(dec)%>%summarise(min(avg6mou)))[[2]]
pro28$LessThan = unclass(project1%>%mutate(dec=ntile(avg6mou,n=10))%>%group_by(dec)%>%summarise(max(avg6mou)))[[2]]
pro28$varname = rep("avg6mou",nrow(pro28))
pro28

#avg6qty variable
project1%>%mutate(dec=ntile(avg6qty,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro29
pro29$N = unclass(project1%>%mutate(dec=ntile(avg6qty,n=10))%>%count(dec)%>%unname())[[2]]
pro29$churn_perc = pro29$n/pro29$N
pro29$GreaterThan = unclass(project1%>%mutate(dec=ntile(avg6qty,n=10))%>%group_by(dec)%>%summarise(min(avg6qty)))[[2]]
pro29$LessThan = unclass(project1%>%mutate(dec=ntile(avg6qty,n=10))%>%group_by(dec)%>%summarise(max(avg6qty)))[[2]]
pro29$varname = rep("avg6qty",nrow(pro29))
pro29

#age1 variable ((factor))
project1%>%mutate(dec=ntile(age1,n=6))%>%count(churn,dec)%>%filter(churn==1)->pro30
pro30$N = unclass(project1%>%mutate(dec=ntile(age1,n=6))%>%count(dec)%>%unname())[[2]]
pro30$churn_perc = pro30$n/pro30$N
pro30$GreaterThan = unclass(project1%>%mutate(dec=ntile(age1,n=6))%>%group_by(dec)%>%summarise(min(age1)))[[2]]
pro30$LessThan = unclass(project1%>%mutate(dec=ntile(age1,n=6))%>%group_by(dec)%>%summarise(max(age1)))[[2]]
pro30$varname = rep("age1",nrow(pro30))
pro30

#age2 variable ((factor))
project1%>%mutate(dec=ntile(age2,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro31
#pro31$N = unclass(project1%>%mutate(dec=ntile(age2,n=4))%>%count(dec)%>%unname())[[2]]
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro31$varname = rep("age2",nrow(pro31))
pro31

#models variable
project1%>%mutate(dec=ntile(models,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro32
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro32$varname = rep("models",nrow(pro32))
pro32

#hnd_price varaible ((factor))
project1%>%mutate(dec=ntile(hnd_price,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro33
pro33$N = unclass(project1%>%mutate(dec=ntile(hnd_price,n=10))%>%count(dec)%>%unname())[[2]]
pro33$churn_perc = pro33$n/pro33$N
pro33$GreaterThan = unclass(project1%>%mutate(dec=ntile(hnd_price,n=10))%>%group_by(dec)%>%summarise(min(hnd_price)))[[2]]
pro33$LessThan = unclass(project1%>%mutate(dec=ntile(hnd_price,n=10))%>%group_by(dec)%>%summarise(max(hnd_price)))[[2]]
pro33$varname = rep("age1",nrow(pro30))
pro33

#actvsubs variable ((factor))
project1%>%mutate(dec=ntile(actvsubs,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro34
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro34$varname = rep("actvsubs",nrow(pro34))
pro34

#uniqsubs variable
project1%>%mutate(dec=ntile(uniqsubs,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro35
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro35$varname = rep("uniqsubs",nrow(pro35))
pro35

#forgntvl variable ((factor))
project1%>%mutate(dec=ntile(forgntvl,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro36
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro36$varname = rep("forgntvl",nrow(pro36))
pro36

#opk_dat_Mean variable ((factor))
project1%>%mutate(dec=ntile(opk_dat_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro37
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro37$varname = rep("opk_dat_Mean",nrow(pro37))
pro37

#mtrcycle variable ((factor))
project1%>%mutate(dec=ntile(mtrcycle,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro38
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro38$varname = rep("mtrcycle",nrow(pro38))
pro38

#truck variable ((factor))
project1%>%mutate(dec=ntile(truck,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro39
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro39$varname = rep("truck",nrow(pro39))
pro39

#roam_Mean variable
project1%>%mutate(dec=ntile(roam_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro40
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro40$varname = rep("roam_Mean",nrow(pro40))
pro40

#recv_sms_Mean variable
project1%>%mutate(dec=ntile(recv_sms_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro41
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro41$varname = rep("recv_sms_Mean",nrow(pro41))
pro41

#mou_pead_Mean variable
project1%>%mutate(dec=ntile(mou_pead_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro42
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro42$varname = rep("mou_pead_Mean",nrow(pro42))
pro42

#da_Mean variable
project1%>%mutate(dec=ntile(da_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro43
pro43$N = unclass(project1%>%mutate(dec=ntile(da_Mean,n=4))%>%count(dec)%>%unname())[[2]]
pro43$churn_perc = pro43$n/pro43$N
pro43$GreaterThan = unclass(project1%>%mutate(dec=ntile(da_Mean,n=4))%>%group_by(dec)%>%summarise(min(da_Mean)))[[2]]
pro43$LessThan = unclass(project1%>%mutate(dec=ntile(da_Mean,n=4))%>%group_by(dec)%>%summarise(max(da_Mean)))[[2]]
pro43$varname = rep("da_Mean",nrow(pro43))
pro43

#da_Range variable
project1%>%mutate(dec=ntile(da_Range,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro44
pro44$N = unclass(project1%>%mutate(dec=ntile(da_Range,n=4))%>%count(dec)%>%unname())[[2]]
pro44$churn_perc = pro44$n/pro44$N
pro44$GreaterThan = unclass(project1%>%mutate(dec=ntile(da_Range,n=4))%>%group_by(dec)%>%summarise(min(da_Range)))[[2]]
pro44$LessThan = unclass(project1%>%mutate(dec=ntile(da_Range,n=4))%>%group_by(dec)%>%summarise(max(da_Range)))[[2]]
pro44$varname = rep("da_Range",nrow(pro44))
pro44

#datovr_Mean variable
project1%>%mutate(dec=ntile(datovr_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro45
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro45$varname = rep("datovr_Mean",nrow(pro45))
pro45

#datovr_Range variable
project1%>%mutate(dec=ntile(datovr_Range,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro46
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro46$varname = rep("datovr_Range",nrow(pro46))
pro46

#drop_dat_Mean variable
project1%>%mutate(dec=ntile(drop_dat_Mean,n=4))%>%count(churn,dec)%>%filter(churn==1)->pro47
#data has 3 deciles which is less than 4. Therefore, removing the variable
pro47$varname = rep("drop_dat_Mean",nrow(pro47))
pro47

#drop_vce_Mean variable
project1%>%mutate(dec=ntile(drop_vce_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro48
pro48$N = unclass(project1%>%mutate(dec=ntile(drop_vce_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro48$churn_perc = pro48$n/pro48$N
pro48$GreaterThan = unclass(project1%>%mutate(dec=ntile(drop_vce_Mean,n=10))%>%group_by(dec)%>%summarise(min(drop_vce_Mean)))[[2]]
pro48$LessThan = unclass(project1%>%mutate(dec=ntile(drop_vce_Mean,n=10))%>%group_by(dec)%>%summarise(max(drop_vce_Mean)))[[2]]
pro48$varname = rep("drop_vce_Mean",nrow(pro48))
pro48

#adjmou variable
project1%>%mutate(dec=ntile(adjmou,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro49
pro49$N = unclass(project1%>%mutate(dec=ntile(adjmou,n=10))%>%count(dec)%>%unname())[[2]]
pro49$churn_perc = pro49$n/pro49$N
pro49$GreaterThan = unclass(project1%>%mutate(dec=ntile(adjmou,n=10))%>%group_by(dec)%>%summarise(min(adjmou)))[[2]]
pro49$LessThan = unclass(project1%>%mutate(dec=ntile(adjmou,n=10))%>%group_by(dec)%>%summarise(max(adjmou)))[[2]]
pro49$varname = rep("adjmou",nrow(pro49))
pro49

#totrev variable
project1%>%mutate(dec=ntile(totrev,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro50
pro50$N = unclass(project1%>%mutate(dec=ntile(totrev,n=10))%>%count(dec)%>%unname())[[2]]
pro50$churn_perc = pro50$n/pro50$N
pro50$GreaterThan = unclass(project1%>%mutate(dec=ntile(totrev,n=10))%>%group_by(dec)%>%summarise(min(totrev)))[[2]]
pro50$LessThan = unclass(project1%>%mutate(dec=ntile(totrev,n=10))%>%group_by(dec)%>%summarise(max(totrev)))[[2]]
pro50$varname = rep("totrev",nrow(pro50))
pro50

#adjrev variable
project1%>%mutate(dec=ntile(adjrev,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro51
pro51$N = unclass(project1%>%mutate(dec=ntile(adjrev,n=10))%>%count(dec)%>%unname())[[2]]
pro51$churn_perc = pro51$n/pro51$N
pro51$GreaterThan = unclass(project1%>%mutate(dec=ntile(adjrev,n=10))%>%group_by(dec)%>%summarise(min(adjrev)))[[2]]
pro51$LessThan = unclass(project1%>%mutate(dec=ntile(adjrev,n=10))%>%group_by(dec)%>%summarise(max(adjrev)))[[2]]
pro51$varname = rep("adjrev",nrow(pro51))
pro51

#avgrev variable
project1%>%mutate(dec=ntile(avgrev,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro52
pro52$N = unclass(project1%>%mutate(dec=ntile(avgrev,n=10))%>%count(dec)%>%unname())[[2]]
pro52$churn_perc = pro52$n/pro52$N
pro52$GreaterThan = unclass(project1%>%mutate(dec=ntile(avgrev,n=10))%>%group_by(dec)%>%summarise(min(avgrev)))[[2]]
pro52$LessThan = unclass(project1%>%mutate(dec=ntile(avgrev,n=10))%>%group_by(dec)%>%summarise(max(avgrev)))[[2]]
pro52$varname = rep("avgrev",nrow(pro52))
pro52

#comp_dat_Mean variable##Remove
project1%>%mutate(dec=ntile(comp_dat_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro53

pro53$varname = rep("comp_dat_Mean",nrow(pro53))
pro53

#comp_dat_Mean variable##Remove
project1%>%mutate(dec=ntile(plcd_dat_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro54

pro54$varname = rep("plcd_dat_Mean",nrow(pro54))
pro54


##Create dummies (Data transformation)
#adding plcd_vce_Mean and plcd_dat_Mean
project1$plcd_attempt_Mean = project1$plcd_vce_Mean+project1$plcd_dat_Mean
#plcd_attempt_Mean variable
summary(project1$plcd_attempt_Mean)
project1%>%mutate(dec=ntile(plcd_attempt_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro55
pro55$N = unclass(project1%>%mutate(dec=ntile(plcd_attempt_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro55$churn_perc = pro55$n/pro55$N
pro55$GreaterThan = unclass(project1%>%mutate(dec=ntile(plcd_attempt_Mean,n=10))%>%group_by(dec)%>%summarise(min(plcd_attempt_Mean)))[[2]]
pro55$LessThan = unclass(project1%>%mutate(dec=ntile(plcd_attempt_Mean,n=10))%>%group_by(dec)%>%summarise(max(plcd_attempt_Mean)))[[2]]
pro55$varname = rep("plcd_attempt_Mean",nrow(pro55))
pro55

#complete_mean creating dummies and binning 
project1$complete_Mean = project1$comp_vce_Mean+project1$comp_dat_Mean
#complete_Mean variable
summary(project1$complete_Mean)
project1%>%mutate(dec=ntile(complete_Mean,n=10))%>%count(churn,dec)%>%filter(churn==1)->pro56
pro56$N = unclass(project1%>%mutate(dec=ntile(complete_Mean,n=10))%>%count(dec)%>%unname())[[2]]
pro56$churn_perc = pro55$n/pro55$N
pro56$GreaterThan = unclass(project1%>%mutate(dec=ntile(complete_Mean,n=10))%>%group_by(dec)%>%summarise(min(complete_Mean)))[[2]]
pro56$LessThan = unclass(project1%>%mutate(dec=ntile(complete_Mean,n=10))%>%group_by(dec)%>%summarise(max(complete_Mean)))[[2]]
pro56$varname = rep("complete_Mean",nrow(pro55))
pro56

#adding all pro1 to pro54 objects to create a dat object
dat = rbind(pro1,pro2,pro3,pro4,pro5,pro6,pro7,pro8,pro9,pro10,pro11,pro12,pro14,pro15,pro18,pro19,pro20,
            pro21,pro22,pro23,pro24,pro25,pro26,pro27,pro28,pro29,pro30,pro33,pro43,pro44,pro48,pro49,pro50,
            pro51,pro52,pro55,pro56)#37 variables are considered out of 61 from continuous variable dqr_num.csv

#removing the variables as specified before which are insignificant in the model
project1 = project1[,-c(13,16,17,22,23,45,48,49,50,56,57,58,65,66)]
names(project1)

#Exporting binned variables
setwd("C://Jig18073")
write.csv(dat,"Binned continuous var.csv")

#Considering Categorical Variables
#Removing those levels which have < 5% churn rate as they are insignificant in the model

#crclscod variable
summary(project1$crclscod)
project1%>%count(churn,levels=crclscod)%>%filter(churn==1)->proC19
proC19$N = unclass(project1%>%filter(crclscod%in%proC19$levels)%>%count(crclscod))[[2]]
proC19$churn_perc = proC19$n/proC19$N
proC19$Var.Name = rep("crclscod",nrow(proC19))
proC19

#asl_flag variable
project1%>%count(churn,levels=asl_flag)%>%filter(churn==1)->proC20
proC20$N = unclass(project1%>%filter(asl_flag%in%proC20$levels)%>%count(asl_flag))[[2]]
proC20$churn_perc = proC20$n/proC20$N
proC20$Var.Name = rep("crclscod",nrow(proC20))
proC20

#prizm_social_one variable
project1%>%count(churn,levels=prizm_social_one)%>%filter(churn==1)->proC21
proC21$N = unclass(project1%>%filter(prizm_social_one%in%proC21$levels)%>%count(prizm_social_one))[[2]]
proC21$churn_perc = proC21$n/proC21$N
proC21$Var.Name = rep("prizm_social_one",nrow(proC21))
proC21

#area variable
project1%>%count(churn,levels=area )%>%filter(churn==1)->proC22
proC22$N = unclass(project1%>%filter(area %in%proC22$levels)%>%count(area ))[[2]]
proC22$churn_perc = proC22$n/proC22$N
proC22$Var.Name = rep("area ",nrow(proC22))
proC22

#refurb_new variable
project1%>%count(churn,levels=refurb_new)%>%filter(churn==1)->proC23
proC23$N = unclass(project1%>%filter(refurb_new%in%proC23$levels)%>%count(refurb_new))[[2]]
proC23$churn_perc = proC23$n/proC23$N
proC23$Var.Name = rep("refurb_new",nrow(proC23))
proC23

#hnd_webcap variable
project1%>%count(churn,levels=hnd_webcap)%>%filter(churn==1)->proC24
proC24$N = unclass(project1%>%filter(hnd_webcap%in%proC24$levels)%>%count(hnd_webcap))[[2]]
proC24$churn_perc = proC24$n/proC24$N
proC24$Var.Name = rep("hnd_webcap",nrow(proC24))
proC24

#marital variable
project1%>%count(churn,levels=marital)%>%filter(churn==1)->proC25
proC25$N = unclass(project1%>%filter(marital%in%proC25$levels)%>%count(marital))[[2]]
proC25$churn_perc = proC25$n/proC25$N
proC25$Var.Name = rep("marital",nrow(proC25))
proC25

#ethnic variable
project1%>%count(churn,levels=ethnic)%>%filter(churn==1)->proC26
proC26$N = unclass(project1%>%filter(ethnic%in%proC26$levels)%>%count(ethnic))[[2]]
proC26$churn_perc = proC26$n/proC26$N
proC26$Var.Name = rep("ethnic",nrow(proC26))
proC26

#car_buy variable
project1%>%count(churn,levels=car_buy)%>%filter(churn==1)->proC27
proC27$N = unclass(project1%>%filter(car_buy%in%proC27$levels)%>%count(car_buy))[[2]]
proC27$churn_perc = proC27$n/proC27$N
proC27$Var.Name = rep("car_buy",nrow(proC27))
proC27

#csa variable
project1%>%count(churn,levels=csa)%>%filter(churn==1)->proC28
proC28$N = unclass(project1%>%filter(csa%in%proC28$levels)%>%count(csa))[[2]]
proC28$churn_perc = proC28$n/proC28$N
proC28$Var.Name = rep("csa",nrow(proC28))
proC28
names(project1)
#retdays1 variable
summary(project1$retdays1)
names(project1$retdays1)
project1$retdays1 = as.factor(project1$retdays1)
project1%>%count(churn,levels=retdays1)%>%filter(churn==1)->proC29
proC29$N = unclass(project1%>%filter(retdays1%in%proC29$levels)%>%count(retdays1))[[2]]
proC29$churn_perc = proC29$n/proC29$N
proC29$Var.Name = rep("retdays1",nrow(proC29))
proC29

#Considering variables that are factors
#age2 variable
#project1$age2 = as.factor(project1$age2)
project1%>%count(churn,levels=age2)%>%filter(churn==1)->proC31
proC31$N = unclass(project1%>%filter(age2%in%proC31$levels)%>%count(age2))[[2]]
proC31$churn_perc = proC31$n/proC31$N
proC31$Var.Name = rep("age2",nrow(proC31))
proC31

#models variable
project1%>%count(churn,levels=models)%>%filter(churn==1)->proC32
proC32$N = unclass(project1%>%filter(models%in%proC32$levels)%>%count(models))[[2]]
proC32$churn_perc = proC32$n/proC32$N
proC32$Var.Name = rep("models",nrow(proC32))
proC32

#actvsubs variable
project1%>%count(churn,levels=actvsubs)%>%filter(churn==1)->proC34
proC34$N = unclass(project1%>%filter(actvsubs%in%proC34$levels)%>%count(actvsubs))[[2]]
proC34$churn_perc = proC34$n/proC34$N
proC34$Var.Name = rep("actvsubs",nrow(proC34))
proC34

#uniqsubs variable
project1%>%count(churn,levels=uniqsubs)%>%filter(churn==1)->proC35
proC35$N = unclass(project1%>%filter(uniqsubs%in%proC35$levels)%>%count(uniqsubs))[[2]]
proC35$churn_perc = proC35$n/proC35$N
proC35$Var.Name = rep("uniqsubs",nrow(proC35))
proC35

#forgntvl variable
project1%>%count(churn,levels=forgntvl)%>%filter(churn==1)->proC36
proC36$N = unclass(project1%>%filter(forgntvl%in%proC36$levels)%>%count(forgntvl))[[2]]
proC36$churn_perc = proC36$n/proC36$N
proC36$var.Name = rep("forgntvl",nrow(proC36))
proC36

#mtrcycle variable
project1%>%count(churn,levels=mtrcycle)%>%filter(churn==1)->proC37
proC37$N = unclass(project1%>%filter(mtrcycle%in%proC37$levels)%>%count(mtrcycle))[[2]]
proC37$churn_perc = proC37$n/proC37$N
proC37$Var.Name = rep("mtrcycle",nrow(proC37))
proC37

#truck variable
project1%>%count(churn,levels=truck)%>%filter(churn==1)->proC38
proC38$N = unclass(project1%>%filter(truck%in%proC38$levels)%>%count(truck))[[2]]
proC38$churn_perc = proC38$n/proC38$N
proC38$Var.Name = rep("truck",nrow(proC38))
proC38

#hnd_price variable
project1%>%count(churn,levels=hnd_price)%>%filter(churn==1)->proC39
proC39$N = unclass(project1%>%filter(hnd_price%in%proC39$levels)%>%count(hnd_price))[[2]]
proC39$churn_perc = proC39$n/proC39$N
proC39$Var.Name = rep("hnd_price",nrow(proC39))
proC39

#Creating datC -> Categorical object
datC1 = rbind(proC19,proC20,proC21,proC22,proC23,proC24,proC25,proC26,proC27,proC28,proC29)
datC2 = rbind(proC31,proC32,proC34,proC35,proC36,proC37,proC38)

#Binned variables
#Creating 2 csv files to store event rate of categorical variables
write.csv(datC1,"Event rate Categorical var1.csv")
write.csv(datC2,"Event rate Categorical var2.csv")

#Deleting variables that have churn rate less than 0.05 (5%)
names(project1)
project1 = project1[,-c(25,44)]

#DATA PREPARATION

#Let's check the outliers for continuous variables

#BOX PLOT

str(project1)
box = names(project1)
box
#let's remove the Categorical variables
box = box[-c(25,26,27:42,50,51)]
box

#Ploting the outliers using boxplot model
#Reducing the figure margin using par()
par(mar = c(2,3,0,0))

for(i in 1:length(box))
{
  boxplot(project1[,box[i]],main = box[i])
}

#outlier treatment

for(i in 1:length(box))
{
  a = boxplot(project1[,box[i]],main = box[i])
  out = a$out
  ind = which(project1[,box[i]]%in%a$out)
  project1[ind,box[i]] = mean(project1[,box[i]],na.rm = T)
  rm(a)
  rm(out)
}

#Checking after the Treatment
for(i in 1:length(box))
{
  boxplot(project1[,box[i]],main = box[i])
}

#This controls over multiple graphics devices.
dev.off()

#TREATING WITH MISSING VALUE considering factor variables also
summary(project1)

#Missing values are 

#deleting missing values row wise
ind1 = which(is.na(project1[,c(1:5)]))
project1 = project1[-ind1,]
#Checking for NA values
summary(project1)
str(project1)

#change_mou variable
ind2 = which(is.na(project1$change_mou))
project1 = project1[-ind2,]

#area variable
ind4 = which(is.na(project1$area))
project1 = project1[-ind4,]

#marital variable
ind5 = which(is.na(project1$marital))
project1 = project1[-ind5,]

summary(project1)

#IMPUTATIONS W.R.T MEAN VALUE

project1$avg6mou[is.na(project1$avg6mou)] = mean(project1$avg6mou,na.rm = T)
project1$avg6qty[is.na(project1$avg6qty)] = mean(project1$avg6qty,na.rm = T)
project1$hnd_price[is.na(project1$hnd_price)] = mean(project1$hnd_price,na.rm = T)
summary(project1)

#prizm_social_one
#Renaming NA and other values apart from the required data as C,R,S,T,U,MISSING
project1$prizm_social_one1 = ifelse(is.na(project1$prizm_social_one),"MISSING",as.factor(project1$prizm_social_one))
project1$prizm_social_one1 = as.factor(project1$prizm_social_one1)
summary(project1$prizm_social_one1)
names(project1)
project1$prizm_social_one1 = factor(project1$prizm_social_one1,labels = c('C','R','S','T','U','MISSING'))
project1 = project1[,-26]

#hnd_webcap
project1$hnd_webcap1 = ifelse(is.na(project1$hnd_webcap),"MISSING",as.factor(project1$hnd_webcap))
project1$hnd_webcap1 = as.factor(project1$hnd_webcap1)
summary(project1$hnd_webcap1)
project1$hnd_webcap1 = factor(project1$hnd_webcap1,labels = c("UNKW","WC","WCMB","MISSING"))
project1 = project1[,-28]

#let's check for the churn rate for the dataset now..
table(project$churn)/nrow(project)
table(project1$churn)/nrow(project1)

#age1
project1$age11 = ifelse(project1$age1 == 0,"Default",
                        ifelse(project1$age1 <= 30,"Young",
                        ifelse(project1$age1 > 30 & project1$age1 <= 55,"Mid age","Old")))
project1$age11
names(project1)
project1 = project1[,-30]

#age2
project1$age21 = ifelse(project1$age2 == 0,"Default",
                        ifelse(project1$age2 <= 30,"Young",
                               ifelse(project1$age2 > 30 & project1$age1 <= 55,"Mid age","Old")))
project1$age21
names(project1)
project1 = project1[,-30]

#converting into factor
str(project1)
#models
str(project1$models)
project1$models = as.factor(project1$models)

#hnd_price
project1$hnd_price = as.factor(project1$hnd_price)

#actvsubs
project1$actvsubs = as.factor(project1$actvsubs)

#uniqsubs
project1$uniqsubs = as.factor(project1$uniqsubs)

#forgntvl
project1$forgntvl = as.factor(project1$forgntvl)

#mtrcycle
project1$mtrcycle = as.factor(project1$mtrcycle)

#truck
project1$truck = as.factor(project1$truck)

str(project1)

#Lets's build the model now
#LOGISTIC REGRESSION MODEL IS USED
# as the churn(target variable) is binary i.e., 1(YES),0(NO)

#Splitting the data into train and test
set.seed(200)
ind = sample(nrow(project1),0.70*nrow(project1),replace = F)
train = project1[ind,]
test = project1[-ind,]

#churn rate for test and train data
table(test$churn)/nrow(test)
table(train$churn)/nrow(train)

#removing Customer_ID
names(train)
train = train[,-46]
#mod = glm(churn~.,data = train,family = "binomial")
#step(mod,direction = "both")

mod = glm(churn ~ mou_Mean+ totmrc_Mean + rev_Range + mou_Range + change_mou + 
            drop_blk_Mean + drop_vce_Range + owylis_vce_Range + mou_opkv_Range + 
            months + totcalls + eqpdays + area + callwait_Mean + iwylis_vce_Mean + 
            adjqty + ovrrev_Mean + rev_Mean + ovrmou_Mean + avg3mou + 
            avgmou + avg3qty + avgqty + avg6mou + ethnic + avg6qty + asl_flag + 
            refurb_new + marital + models + hnd_price + uniqsubs +
            actvsubs + forgntvl + mtrcycle + truck + car_buy + 
            da_Mean + da_Range + drop_vce_Mean + adjmou + totrev + adjrev + 
            avgrev  + complete_Mean + prizm_social_one1 + plcd_attempt_Mean + 
            hnd_webcap1 + age11 + age21,data = train,family = "binomial")

summary(mod)
str(train)

#dummies for factor vars
str(train)
train$area_cal_north = ifelse(train$area == "CALIFORNIA NORTH AREA",1,0)
test$area_cal_north = ifelse(test$area == "CALIFORNIA NORTH AREA",1,0)

train$area_texas = ifelse(train$area == "CENTRAL/SOUTH TEXAS AREA",1,0)
test$area_texas = ifelse(test$area == "CENTRAL/SOUTH TEXAS AREA",1,0)

train$area_midwest = ifelse(train$area == "MIDWEST AREA",1,0)
test$area_midwest = ifelse(test$area == "MIDWEST AREA",1,0)

train$area_north_florida = ifelse(train$area == "NORTH FLORIDA AREA",1,0)
test$area_north_florida = ifelse(test$area == "NORTH FLORIDA AREA",1,0)

train$area_north_west = ifelse(train$area == "NORTHWEST/ROCKY MOUNTAIN AREA",1,0)
test$area_north_west= ifelse(test$area == "NORTHWEST/ROCKY MOUNTAIN AREA",1,0)

train$area_south_florida = ifelse(train$area == "SOUTH FLORIDA AREA",1,0)
test$area_south_florida = ifelse(test$area == "SOUTH FLORIDA AREA",1,0)

train$area_south_west = ifelse(train$area == "SOUTHWEST AREA",1,0)
test$area_south_west = ifelse(test$area== "SOUTHWEST AREA",1,0)

train$area_tenese = ifelse(train$area == "TENNESSEE AREA",1,0)
test$area_tenese = ifelse(test$area == "TENNESSEE AREA",1,0)

summary(train$refurb_new)
str(train$refurb_new)
train$refurb_R= ifelse(train$refurb_new == "R",1,0)
test$refurb_R = ifelse(test$refurb_new == "R",1,0)

summary(train$ethnic)

train$ethnic_C = ifelse(train$ethnic == "C",1,0)
test$ethnic_C = ifelse(test$ethnic== "C",1,0)

train$ethnic_N = ifelse(train$ethnic == "N",1,0)
test$ethnic_N = ifelse(test$ethnic== "N",1,0)

train$ethnic_O = ifelse(train$ethnic == "O",1,0)
test$ethnic_O = ifelse(test$ethnic== "O",1,0)

train$ethnic_S= ifelse(train$ethnic == "S",1,0)
test$ethnic_S = ifelse(test$ethnic== "S",1,0)

train$ethnic_U= ifelse(train$ethnic == "U",1,0)
test$ethnic_U = ifelse(test$ethnic== "U",1,0)

train$ethnic_Z= ifelse(train$ethnic == "Z",1,0)
test$ethnic_Z = ifelse(test$ethnic== "Z",1,0)

summary(project1$asl_flag)
train$asl_flagY= ifelse(train$asl_flag == "Y",1,0)
test$asl_flagY = ifelse(test$asl_flag == "Y",1,0)

train$asl_flagN = ifelse(train$asl_flag == "N",1,0)
test$asl_flagN = ifelse(test$asl_flag == "N",1,0)

summary(train$hnd_price)
str(train)

train$hnd_price79.9 = ifelse(train$hnd_price == "79.98999023",1,0)
test$hnd_price79.9 = ifelse(test$hnd_price == "79.98999023",1,0)

train$hnd_price105 = ifelse(train$hnd_price == "105.083038078331",1,0)
test$hnd_price105 = ifelse(test$hnd_price == "105.083038078331",1,0)

train$hnd_price129.9 = ifelse(train$hnd_price == "129.9899902",1,0)
test$hnd_price129.9 = ifelse(test$hnd_price == "129.9899902",1,0)

train$hnd_price199.9 = ifelse(train$hnd_price == "199.9899902",1,0)
test$hnd_price199.9 = ifelse(test$hnd_price == "199.9899902",1,0)

train$hnd_price249.9 = ifelse(train$hnd_price == "249.9899902",1,0)
test$hnd_price249.9 = ifelse(test$hnd_price == "249.9899902",1,0)

summary(train$uniqsubs)

train$unq2 = ifelse(train$uniqsubs == "2",1,0)
test$unq2 = ifelse(test$uniqsubs == "2",1,0)

train$unq3 = ifelse(train$uniqsubs == "3",1,0)
test$unq3 = ifelse(test$uniqsubs == "3",1,0)

train$unq4 = ifelse(train$uniqsubs == "4",1,0)
test$unq4 = ifelse(test$uniqsubs == "4",1,0)

train$unq5 = ifelse(train$uniqsubs == "5",1,0)
test$unq5 = ifelse(test$uniqsubs == "5",1,0)

train$unq6 = ifelse(train$uniqsubs == "6",1,0)
test$unq6 = ifelse(test$uniqsubs == "6",1,0)

train$unq7 = ifelse(train$uniqsubs == "7",1,0)
test$unq7 = ifelse(test$uniqsubs == "7",1,0)

train$unq9 = ifelse(train$uniqsubs == "9",1,0)
test$unq9 = ifelse(test$uniqsubs == "9",1,0)

summary(train$prizm_social_one1)

train$prizmR = ifelse(train$prizm_social_one1 == "R",1,0)
test$prizmR = ifelse(test$prizm_social_one1 == "R",1,0)

train$prizmT = ifelse(train$prizm_social_one1 == "T",1,0)
test$prizmT = ifelse(test$prizm_social_one1 == "T",1,0)

summary(train$age11)

train$age1_mid = ifelse(train$age11 == "Mid age",1,0)
test$age1_mid = ifelse(test$age11 == "Mid age",1,0)

train$age1_old = ifelse(train$age11 == "Old",1,0)
test$age1_old = ifelse(test$age11 == "Old",1,0)

train$age1_young = ifelse(train$age11 == "Young",1,0)
test$age1_young = ifelse(test$age11 == "Young",1,0)

mod1 = glm(churn ~ mou_Mean + totmrc_Mean + rev_Range + mou_Range + change_mou + 
            drop_blk_Mean + drop_vce_Range + owylis_vce_Range + mou_opkv_Range + 
            months + totcalls + eqpdays + area_tenese + area_south_west + area_south_florida +
            area_north_west + area_north_florida + area_midwest + area_texas +
            callwait_Mean + iwylis_vce_Mean + 
            adjqty + ovrrev_Mean + rev_Mean + ovrmou_Mean + avg3mou + 
            avgmou + avg3qty + avgqty + avg6mou + ethnic_Z + ethnic_U +
            ethnic_S + ethnic_O + ethnic_N + ethnic_C + avg6qty + asl_flagN + asl_flagY + 
            refurb_new + marital + models + hnd_price249.9 + hnd_price199.9 +
            hnd_price129.9 + hnd_price105 + hnd_price79.9 + unq9 + unq7 +
            unq6 + unq5 + unq4 + unq3 + unq2 + retdays1 + 
            actvsubs + forgntvl + mtrcycle + truck + car_buy +
            da_Mean + da_Range + drop_vce_Mean + adjmou + totrev + adjrev + 
            avgrev  + complete_Mean + prizmR + prizmT + plcd_attempt_Mean + 
            hnd_webcap1 + age1_young + age1_mid + age1_old ,data = train,family = "binomial")
summary(mod1)

#REMOVING THE INSIGNIFICANT VARIABLES
mod2 = glm(churn ~ mou_Mean + totmrc_Mean + rev_Range + mou_Range + change_mou + 
             drop_blk_Mean + drop_vce_Range + mou_opkv_Range + 
             months + eqpdays + area_tenese + area_south_west + area_south_florida +
             area_north_west + area_north_florida + area_midwest + area_texas +
             iwylis_vce_Mean + 
             ovrrev_Mean + retdays1 + 
             avgmou + avg3qty + avgqty + avg6mou + ethnic_Z + ethnic_U +
             ethnic_S + ethnic_O + ethnic_N + ethnic_C + asl_flagN + 
             refurb_new + hnd_price249.9 + hnd_price199.9 +
             hnd_price129.9 + hnd_price105 + unq7 +
             unq4 + unq3 + unq2 + 
             adjmou + totrev +
             complete_Mean + prizmR + prizmT + plcd_attempt_Mean + 
             age1_mid + age1_old,data = train,family = "binomial")

summary(mod2)

##Let's check for Multicollinearity
library(car)
vif(mod2)

#cut-off for vif is 5. So, let's remove all the variables whose vif is greater than 5
#mou_Mean, avgmou, avg3qty, avg6mou 

mod3 = glm(churn ~ totmrc_Mean + rev_Range + mou_Range + change_mou + 
             drop_blk_Mean + drop_vce_Range + mou_opkv_Range +
             months + eqpdays + area_tenese + area_south_florida +
             area_north_west  + area_midwest + area_texas +
             iwylis_vce_Mean + 
             ovrrev_Mean + asl_flagN +
             avgqty + ethnic_Z + ethnic_U +
             ethnic_S + ethnic_O + ethnic_N + ethnic_C + 
             refurb_new + hnd_price249.9 + hnd_price199.9 +
             hnd_price129.9 + hnd_price105 + unq7 +
             unq4 + unq3 + unq2 + retdays1 +
             totrev +
             complete_Mean + prizmR + prizmT + 
             age1_mid + age1_old,data = train,family = "binomial")
summary(mod3)

vif(mod3)

#let's check the churn rate now
table(project1$churn)/nrow(project1)

#Confidence interval
confint(mod3)

pred = predict(mod3,type = "response",newdata = test)
head(pred)

#kappa matrix
library(lpSolve)
library(irr)
library(caret)

#let's consider pred>0.279
pred2 = ifelse(pred>0.279,1,0)
head(pred2)

kappa2(data.frame(test$churn,pred2))
#Kappa = 0.154
#z = 21.6
#p-value = 0

#confusion matrix
confusionMatrix(pred2,test$churn,positive = "1")
#Model is created with 67.55% accuracy
# cnemar's Test P-Value : <0.0000000000000002

#ROCR curve
library(ROCR)
library(plotly)
pred3 = prediction(pred2,test$churn)
pref = performance(pred3,"tpr","fpr")

par(mar = c(2,3,0,0))
plot(pref,col = 'green')
abline(0,1,lty = 8,col = 'blue')
auc = performance(pred3,"auc")
auc

auc = unlist(slot(auc,"y.values"))
auc
#area under curve is 58.16%

#gains chart
library(gains)
gains(test$churn,predict(mod3,type = "response",newdata = test),groups = 10)

test$prob = predict(mod3,type = "response",newdata = test)
quantile(test$prob,prob = c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1))
#40% of th data lie between 0.26 to 0.39

#PROJECT QUESTIONS AND ANSWERS

#1) WHAT ARE THE TOP 5 FACTORS DRIVING THE LIKELIHOOD OF CHURN AT MOBICOM?

Q1 = abs(mod3$coefficients)
Q1 = sort(Q1,decreasing = T)
head(Q1,15)

#(Intercept)     unq7      retdays11      asl_flagN      ethnic_O        area_north_west 
#1.5131461    0.7512079    0.6722432      0.3918855      0.3084353           0.2506568

#FACTOR-1  tells us that uniqsubs variable in the level 7
# has the first highest unit increase of 0.7512079 in churn 
# which means some offers should be rolled out for families 
# with 7 unique subscribers as it is said that churn rate is 
# increasing as the subscriber is getting influenced and
# recommended by family and friends to switch the operators.

#FACTOR-2 tells us that retdays variable has second highest 
# unit increase of 0.6722432 in churn which is the number of days
# since the last retention call. Retention calls are made to 
# retain the customers over some peroid.

#FACTOR-3 tells us that asl_flagN variable has third highest 
# unit increase of 0.3918855 in churn that is account spending 
# limit under level "N" is the monthly maximum spending limit
# for Mobicom and "N" specifies no account speed limit.
# (I think this happens mostly with non-optimal rate plan subscribers who have
# significantly higher odds of churn relative to subscribers on optimal rate plans.)

#FACTOR-4 tells us that ethnic variable in the level
# "O" has the fourth highest unit increase of 0.3084353 
# in churn which means the subscribers whose ethnicity with
# level "O" should be provided with some offers that is for the
# subscribers who live in Asia region has to be provided with
# some offers.

#FACTOR-5 tells us that area  variable in the level
# "NORTH WEST AREA" has the fifth highest unit increase of 0.2506568 
# in churn which means the subscribers who live in North-West region has
# to be provided with some offers. The company has to rollout some special
# plans to this area to reduce the churn.

#2) VALIDATION OF SURVEYS FINDINGS
#A) WHETHER "COST AND BILLING" AND "NETWORK AND SERVICE QUALITY" 
# ARE THE IMPORTANT FACTORS INFLUENCING CHURN BEHAVIOUR

#***"COST AND BILLING" factor:
#variables like totmrc_Mean, rev_Range, ovrrev_Mean, totrev influence on cost and billing factor
#**totmrc_Mean var is the base plan charge cost to the customer that has the beta coefficient
# of -0.00603758 that is causing churn to decrease by 0.00603758/unit.
#**rev_Range var is the range of revenue that represents the billing amount 
# to the customer that has the beta coefficient
# of 0.00207155 that is causing churn to increase by 0.00207155/unit.
#**ovrrev_Mean var is the addition of 2 variables datovr_Mean and vceovr_Mean which
# is the mean average revene that is again sum of the data and voice, that has the beta coefficient
# of 0.00685211 that is causing churn to increase by 0.00685211/unit.
#**totrev var is the total revenue earned from the customers that has the beta coefficient
# of  0.00024202 that is causing churn to increase by 0.00024202/unit.
#By above seen values its negligible amount of impact on the churn rate.Therefore, cost and billing
# is can be an important factor influencing churn behaviour in mobicom. As the variables like 
# rev_Range, ovrrev_Mean, totrev turns out to increase the churn. Thus it as to be considered.

#***"NETWORK AND SERVICE QUALITY" factor
#**mou_Range var is the unit increase in range of number of minutes of use may be based on promotions
# which is a Proactive Retention Strategy, by which there is an increase in churn by 0.00024676 units.
#**change_mou var is the unit increase in percentage change in monthly minutes of use comparing with 
# 3 months average, there is decrease of churn by -0.00062382 units.
#**drop_blk_mean var is the unit increase in mean number of dropped or blocked calls there by 
# increasing churn by 0.00688997 units.
#**drop_vce_Range var is the unit increase in range of number of dropped voice calls there by 
# increasing churn by 0.01874519 units.
#**mou_opkv_Range  var is the unit increase in range of unrounded minutes of use of off-peak
# voice calls,i.e., calls apart from monday to friday from 7.00am to 9.00pm, there is decrease in
# churn by -0.00116024 units.
#**iwylis_vce_Mean var is the unit increase in mean number of inbound wireless to wireless voice
# calls, there is a decrease in churn by -0.01589697 units.
#**avgqty var is the unit increase in average monthly number of calls over life of the subscriber there
# by increasing the churn by 0.00085275 units.
#** complete_Mean var is the unit increase in mean number of completed voice and data calls there
# by decreasing the churn by -0.00193047 units.
#**retdays1 var is the unit increase in churn by 0.67224316 units which is quite high compared to other
# variables retdays means number of days since the last retention call.
# Retention calls are made to  retain the customers over some peroid. There is a high
# unit for this var and also a important factor influencing the churn which can be 
# due to service quality of the company. 
#Therefore, with the increase in number of days since the customer
# retention call, customer's chances of churning out is quite high.
# These customers has to be paid more attention and appropriate offers have to given
# inorder to retain the customers.
# And thus network and service quality
# is not a important factor influencing churn behavior in mobicom.

#2b) Are data usage connectivity issues turning out to be costly?
# In other words, is it leading to churn?

#The variables that express the data usage connectivity issues are
#**comp_dat_Mean is the mean number of completed data calls.
#**plcd_dat_Mean is the mean number of attempted data calls.
#**opk_dat_Mean is the mean number of off-peak data calls,
#i.e., calls apart from monday to friday from 7.00am to 9.00pm.
#**blck_dat_Mean is the mean number of blocked or failed data calls.
#**datovr_Mean is the mean revenue of data overage.
#**datovr_Range is the range of revene of data overage.
#**drop_dat_Mean is the mean number of dropped or failed data calls.

Q2 = quantile(project$plcd_dat_Mean,prob = c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,
                                             0.80,0.82,0.84,0.85,0.86,0.88,0.90,
                                             0.92,0.94,0.95,0.96,0.98,1))
Q2
Q2_num = read.csv("C:\\Jig18073\\dqr_num.csv")
head(Q2_num)
Q2_cat = read.csv("C:\\Jig18073\\dqr_cat.csv")
head(Q2_cat)
#Based on the DQR(Data Quality Report) most of the variables actually
# makes data calls or uses the internet.
#According to 2014 Acquisition and Retention Study Report is that recommendations from
#family and friends have gained in importance in the decision to switch
#operators Subscribers who have switched operators in recent months reported
#two key information sources in their decision: the Internet and recommendation
#of family and friends. It will be better to attain the customers who are not using 
#the data calls and internet to upgrade to internet by providing some promotional
#offers by proactive retention strategy.
#Thereby, improving the quality and connectivity of the network. Therefore,
# providing maximum customer satisification and reduce churn.

#3)  Would you recommend rate plan migration as a proactive retention strategy?

#ovrr_Mean is the addition of datovr_mean and vceovr_Mean that is the overall mean 
# for the revenue which considers the sum of data and voice overage revenue values 
# that represents the overage revenue earned from the subs after billing.
# The beta coefficient for the variable ovrr_Mean is 0.00647120 which is negligible 
# and almost 0% impact on the overage billing that is a factor for influencing the churn behavior.
# Therefore, the overall rate plan migration as a proactive retention strategy might not help at Mobicom.

#4)What would be your recommendation on how to use this churn model for prioritisation 
# of customers for a proactive retention campaigns in the future?

#Gains chart
library(gains)
gains(test$churn,predict(mod3,type = "response",newdata = test),groups = 10)

test$prob = predict(mod3,type = "response",newdata = test)
quantile(test$prob,prob = c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1))

#After seeing the gains chart, we can conclude that the top20% of the probabilities
# contain 30% of the total customers with Mean model score of 0.40 for 10% probability
# and 0.32 for 20% probability.

# cut-off value for prediction
pred5 = predict(mod3,type = "response",newdata = test)
pred5 = ifelse(pred5>0.3,1,0)
Q4_Customer_ID = test[test$prob>0.3 & test$prob<=0.7 & test$churn == '1',"Customer_ID"]
str(Q4) 
#convert it to data.frame
final = as.data.frame(Q4_Customer_ID)
nrow(final)
#1414 rows
write.csv(final,"Target_customers.csv",row.names = F)
# The company should extract the customer ID to know the targeted customers
# and can check the high probability of churn by this model.

#5) What would be the target segments for proactive retention campaigns?
# Falling ARPU forecast is also a concern and therefore, Mobicom would 
# like to save their high revenue customers besides managing churn. 
# Given a budget constraint of a contact list of 20% of the subscriber pool,
# which subscribers should prioritized if "revenue saves" is also a priority
# besides controlling churn. In other words, controlling churn
# is the primary objective and revenue saves is the secondary objective.

# The ARPU that is the average revenue per user is aso a factor that has to
# be considered by Mobicom to save their high revenue subs besides managing 
# the churn rate.
# Controlling the churn is primary important factor and ARPU is the secondary
# factor.

pred6 = predict(mod3,type = "response",newdata = test)
test$prob = predict(mod3,type = "response",newdata = test)
quantile(test$prob,prob = c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1))

#lets divide the prediction value of low score(<0.20) that is low,
# medium score(>=0.20 & <0.30) as mid and high score(remaining) as high

pred7 = ifelse(pred6<0.20,"LOW",ifelse(pred6>=.20 & pred6<0.30,"MID","HIGH"))
table(pred7,test$churn)

str(pred6,test$churn)
quantile(test$prob,prob = c(0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1))
summary(test$totrev)
#Values of Totrev var is divided into low revenue(<540.7) ,medium revenue(>=540.7
#and <1121.0) and high revenue(>=1121.0).
revenue = ifelse(test$totrev < 540.7,"LOW_REVENUE",
                 ifelse(test$totrev>=540.7 & test$totrev < 1121.0,
                        "MEDIUM_REVENUE","HIGH_REVENUE"))

table(revenue)
table(pred7,revenue)

test$prob = ifelse(pred6<0.20,"LOW",ifelse(pred6>=.20 & pred6<0.30,"MID","HIGH"))
test$revenue = ifelse(test$totrev < 540.7,"LOW_REVENUE",
                 ifelse(test$totrev>=540.7 & test$totrev < 1121.0,
                        "MEDIUM_REVENUE","HIGH_REVENUE"))

Q5_Customer_ID = test[test$prob == "HIGH" & test$revenue == "HIGH_REVENUE","Customer_ID"]
test$Customer_ID
final = as.data.frame(Q5_Customer_ID)
write.csv(final,"HIGH REVENUE TARGET_CUSTOMER.csv",row.names = F)
nrow(final)

names(project)

