# setwd("d:/github/dataAnal_proj1/data") #집
setwd("e:/github/dataAnal_proj1/data") #학원

## file read & merge
(file_list= list.files(pattern="*_clean2\\.csv$"))
#
firstfileName <- file_list[1]#merge용 첫 파일
dataset <- read.csv(firstfileName, header=T, sep=",")
names(dataset)
for(file in file_list[-1]){
  print(file)
  temp= read.csv(file, header=T, sep=",")
  dataset <-  merge(dataset, temp, by="Date", all=T)
}

head(dataset,2)
str(dataset) #180 obs. of  75 variables

# # # 깔끔한데, 다룰줄 모름
# install.packages("dplyr")
# install.packages("readr")
# library(dplyr)
# library(readr)
# 
# list_file <- list.files(pattern="*_clean2.csv") %>%
#   as.data.frame(lapply(read.csv)) %>%
#    full_join(by= "Date")
# 
# ??full_join


# typeof(dataset) #list


## NA -> 0
head(dataset$월적설량합,40)
dataset$월적설량합 <- as.numeric(lapply(dataset$월적설량합, function(x) {
  ifelse(is.na(x), 0, x)
}))

head(dataset$월적설량합,40)
str(dataset) #180 obs. of  60 variables:


## NA -> median
# date 칼럼을 밀어버리길래 temp로 두고 앞에 붙임
date_temp <- dataset[1]
dataset <- as.data.frame(lapply(dataset, function(x) {
  ifelse(is.na(x), median(x, na.rm=TRUE), x)
}))

dataset <- cbind.data.frame(date_temp,dataset[-1])
head(dataset,2)
str(dataset) #180 obs. of  60 variables:
# dataset <- within(dataset, {
#   val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)
# })

## file save
# write.csv( dataset[,-grep("(실업자.y)|(실업률.y)",colnames(dataset))], "price_merge.csv", row.names=FALSE)
write.csv( dataset, "price_merge.csv", row.names=FALSE)
