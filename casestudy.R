rm(list=ls())


case.data<-read.csv(file.choose(),stringsAsFactors = TRUE,header=TRUE, sep = ",")
View(case.data)
summary(case.data)

case.data[is.na(case.data$deposit),"deposit"]<- mean(case.data$deposit,na.rm = T)
summary(case.data)

case.data<-case.data[!(case.data$education==""),]
summary(case.data)
View(case.data)

case.data<-case.data[(case.data$loan=="yes" |case.data$loan=="no" ),]
case.data<-case.data[!(case.data$loan=="!!"),]
case.data<-case.data[!(case.data$loan=="%"),]
case.data<-case.data[!(case.data$loan==""),]
summary(case.data)
View(case.data)

case.data<-case.data[!(case.data$contact=="??"),]
case.data<-case.data[!(case.data$contact=="?"),]
summary(case.data)
View(case.data)
hist(case.data$deposit)


case.data$contact<-NULL
summary(case.data)

library(binaryLogic)
encode_binary <- function(x, order = unique(x), name = "v_") {
  x <- as.numeric(factor(x, levels = order, exclude = NULL))
  x2 <- as.binary(x)
  maxlen <- max(sapply(x2, length))
  x2 <- lapply(x2, function(y) {
    l <- length(y)
    if (l < maxlen) {
      y <- c(rep(0, (maxlen - l)), y)
    }
    y
  })
  d <- as.data.frame(t(as.data.frame(x2)))
  rownames(d) <- NULL
  colnames(d) <- paste0(name, 1:maxlen)
  d
}

case.data <- cbind(case.data, encode_binary(case.data$marital, name = "marital_"))
summary(case.data)
View(case.data)



#duration 
case.data$duration<- case.data$duration/ 60
summary(case.data)
View(case.data)


#discritize age 

age_bin<-cut (case.data$age,breaks=seq(min(case.data$age),max(case.data$age),(max(case.data$age)-min(case.data$age))/4))
summary(age_bin)

View(age_bin)
levels(age_bin)
#rrr<-which(is.na(age_bin))
#print(rrr)


case.data["age_bin"]<-age_bin
summary(case.data)
View(case.data)
case.data <-na.omit(case.data)
summary(case.data)


#normalizing balance

case.data["norm_deposit"]<-  (case.data$deposit-min(case.data$deposit))/ (max(case.data$deposit)-min(case.data$deposit)) * (10-1) +1
#case.data$norm_balance<- NULL
summary(case.data)
View(case.data)



#5
dayz<- case.data$day
mz<-case.data$month
mz2<-toupper(substr(mz, start = 1, stop = 3))

#x <- c("January", "February", "March") 
#substr(x, start = 1, stop = 3)

dd<- sprintf("%s-%s-19",dayz,mz2)
print(dd)
case.data["date_diference"]<- Sys.Date()-as.Date(dd,format="%d-%b-%y")+1
View(case.data)



#6
rm(list=ls())


case.data<-read.csv(file.choose(),stringsAsFactors = TRUE,header=TRUE, sep = ",")
View(case.data)
summary(case.data)

case.data[is.na(case.data$deposit),"deposit"]<- mean(case.data$deposit,na.rm = T)
summary(case.data)

case.data<-case.data[!(case.data$education==""),]
summary(case.data)
View(case.data)

case.data<-case.data[(case.data$loan=="yes" |case.data$loan=="no" ),]
case.data<-case.data[!(case.data$loan=="!!"),]
case.data<-case.data[!(case.data$loan=="%"),]
case.data<-case.data[!(case.data$loan==""),]
summary(case.data)
View(case.data)

case.data<-case.data[!(case.data$contact=="??"),]
case.data<-case.data[!(case.data$contact=="?"),]
summary(case.data)
View(case.data)
hist(case.data$deposit)


case.data$contact<-NULL
summary(case.data)

library(binaryLogic)
encode_binary <- function(x, order = unique(x), name = "v_") {
  x <- as.numeric(factor(x, levels = order, exclude = NULL))
  x2 <- as.binary(x)
  maxlen <- max(sapply(x2, length))
  x2 <- lapply(x2, function(y) {
    l <- length(y)
    if (l < maxlen) {
      y <- c(rep(0, (maxlen - l)), y)
    }
    y
  })
  d <- as.data.frame(t(as.data.frame(x2)))
  rownames(d) <- NULL
  colnames(d) <- paste0(name, 1:maxlen)
  d
}

case.data <- cbind(case.data, encode_binary(case.data$marital, name = "marital_"))
summary(case.data)
View(case.data)



#duration 
case.data$duration<- case.data$duration/ 60
summary(case.data)
View(case.data)


#discritize age 

age_bin<-cut (case.data$age,breaks=seq(min(case.data$age),max(case.data$age),(max(case.data$age)-min(case.data$age))/4))
summary(age_bin)

View(age_bin)
levels(age_bin)
#rrr<-which(is.na(age_bin))
#print(rrr)


case.data["age_bin"]<-age_bin
summary(case.data)
View(case.data)
case.data <-na.omit(case.data)
summary(case.data)


#normalizing balance

case.data["norm_deposit"]<-  (case.data$deposit-min(case.data$deposit))/ (max(case.data$deposit)-min(case.data$deposit)) * (10-1) +1
#case.data$norm_balance<- NULL
summary(case.data)
View(case.data)



#5
dayz<- case.data$day
mz<-case.data$month
mz2<-toupper(substr(mz, start = 1, stop = 3))

#x <- c("January", "February", "March") 
#substr(x, start = 1, stop = 3)

dd<- sprintf("%s-%s-19",dayz,mz2)
print(dd)
case.data["date_diference"]<- Sys.Date()-as.Date(dd,format="%d-%b-%y")+1
View(case.data)


#6



