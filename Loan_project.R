#Remove all file from R environment 
rm(list=ls())

#To connect R to Mysql and fetch the data
library(RMySQL)
install.packages('e1071', dependencies=TRUE)

#Creating connection to the database
con = dbConnect(MySQL(), user='root', password='root', 
dbname='deepika', host='localhost')

#Loading the data
rs = dbSendQuery(con, "select * from loan;")
data <- read.csv("loan.csv",header=TRUE,stringsAsFactors = FALSE,sep=";")

#Closing the result set
dbClearResult(dbListResults(con)[[1]])

#Another method to load data into R using file from local machine 
#set working directory
setwd("D:/employee/step 1")

#Get working directory
getwd()

#Read the file into R environment
loan=read.csv("Loan.csv",header=TRUE)

#To find dimension of dataset
dim(loan)

#To find column names
colnames(loan)

#Rename values of column
loan$credit.policy = ifelse(loan$credit.policy==1,"met","Not met")
loan$not.fully.paid = ifelse(loan$not.fully.paid==0,"paid","Not paid")

#Rename columns
colnames(loan)[1] = c("credit_policy")
colnames(loan)[3] = c("int_rate")
colnames(loan)[5] = c("log_annual_income")
colnames(loan)[8] = c("days_with_cr_line")
colnames(loan)[9] = c("revol_bal")
colnames(loan)[10] = c("revol_until")
colnames(loan)[11] = c("enqui_last_6mths")
colnames(loan)[12] = c("delinq_2yrs")
colnames(loan)[13] = c("pub_rec")
colnames(loan)[14] = c("Loan")
colnames(loan)[15] = c("annual_income")


#To find structure (data type of variable) -(7 int, 1 factor , 6 num)
str(loan)

#To find first 10 rows
head_loan=head(loan,10)

#To find last 10 rows 
tail(loan,10)

#Slicing the dataset
loan[1:5, 1:6]
slc=loan[,c("installment","fico")]

#To find unique values
unique(loan$credit_policy)
unique(loan$purpose)
unique(loan$enqui_last_6mths)
unique(loan$delinq_2yrs)
unique(loan$pub_rec)

#To find length of unique values 
length(unique(loan$credit_policy))
length(unique(loan$purpose))
length(unique(loan$enqui_last_6mths))
length(unique(loan$delinq_2yrs))
length(unique(loan$pub_rec))


#To find count of categories in variables
table(loan$credit_policy)
table(loan$purpose)

#To find datatypes
class(loan$purpose)
class(loan$installment)
class(loan$fico)

#To find summary of all the variables
summary(loan)

#To find summary of individual variables
summary(loan$credit_policy)
summary(loan$purpose)
summary(loan$int_rate)

#To find Mean
mean(loan$int_rate)

#To find Median
median(loan$annual_income)

#To find standard deviation
sd(loan$enqui_last_6mths)

#To find variance
var(loan$dti)

#sorting in ascending

loan=loan[order(loan$annual_income),]

#sorting in descending
loan=loan[order(-loan$annual_income),]


#Export data to csv
write.csv(loan, file = "loan_r.csv",row.names=FALSE)

