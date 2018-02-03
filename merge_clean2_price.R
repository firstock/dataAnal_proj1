# setwd("E:/github/dataAnal_proj1")
setwd("d:/github/dataAnal_proj1/data")

## file read & merge
(file_list= list.files(pattern="*_clean2\\.csv$"))
#
firstfileName <- "price_jobless_clean2.csv"#merge용 첫 파일
dataset <- read.csv(firstfileName, header=T, sep=",")
names(dataset)
for(file in file_list[-1]){
  print(file)
  temp= read.csv(file, header=T, sep=",")
  dataset <-  merge(dataset, temp, by="Date", all=T)
}

head(dataset,2)
str(dataset) #194 obs. of  105 variables

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

## NA -> median
# date 칼럼을 밀어버리길래 temp로 두고 앞에 붙임
date_temp <- dataset[1]
dataset <- as.data.frame(lapply(dataset, function(x) {
  ifelse(is.na(x), median(x, na.rm=TRUE), x)
}))
# dataset <- within(dataset, {
#   val <- ifelse(is.na(val), median(val, na.rm=TRUE), val)
# })
dataset <- cbind.data.frame(date_temp,dataset[-1])
head(dataset,2)
str(dataset) #180 obs. of  66 variables:


## file save - 실업률xy어쩔. 일단 뒤쪽에거 날리자
write.csv( dataset[,-grep("(실업자.y)|(실업률.y)",colnames(dataset))], "price_merge.csv", row.names=FALSE)
