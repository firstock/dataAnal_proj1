# setwd("E:/github/dataAnal_proj1")
setwd("E:/github/dataAnal_proj1/data")

(file_list= list.files(pattern="*_clean2\\.csv$"))
# 
# dataset= data.frame()
# names(dataset)[1]
# for(file in file_list){
#   print(file)
#   temp= read.csv(file, header=T, sep=",")
#   dataset <-  merge(x=dataset, y=temp, by="Date", all=TRUE)
#   # dataset <-  merge(x=dataset, y=temp, by.x=names(dataset)[1], by.y=names(temp)[1], all=TRUE)
# }
# 
# dataset[1]
# 
# dataFiles <- lapply(Sys.glob("*_clean2.csv", read.csv))
# 
# install.packages("dplyr")
# install.packages("readr")
# library(dplyr)
# library(readr)
# 
# list_file <- list.files(pattern="*_clean2.csv") %>%
#   lapply(read.csv) %>%
#   
# 
# is.data.frame(list_file)
# head(list_file[1])

# ## read files
# dataset= data.frame()
# for i,file in zip(1:length(file_list),file_list)){
#   dataset[i] <- read.csv(file, header=T, sep=",")
#   #warning 50개
#   dataset= rbind(dataset, temp) #행 길이달라서 안됨
# }



file <- file_list[1]
price1 <- read.csv(file, header=T, sep=",")
file <- file_list[2]
price2 <- read.csv(file, header=T, sep=",")
file <- file_list[3]
price3 <- read.csv(file, header=T, sep=",")
file <- file_list[4]
price4 <- read.csv(file, header=T, sep=",")
file <- file_list[5]
price5 <- read.csv(file, header=T, sep=",")

length(price1[,1])
length(price2[,1])
length(price3[,1])
length(price4[,1])
length(price5[,1])

head(price1,1)
head(price2,1)
head(price3,1)
head(price4,1)
head(price5,1)



