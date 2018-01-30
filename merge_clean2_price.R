#cleaning 이 완전히 끝나고 merge해야!

# setwd("E:/github/dataAnal_proj1")
setwd("E:/github/dataAnal_proj1/data")

# 아 모르겠다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ아 ㅆ 40분하고 안됨
# ## read files
# 
# dataset= data.frame()
# for i,file in zip(1:length(file_list),file_list)){
#   dataset[i] <- read.csv(file, header=T, sep=",")
#   #warning 50개
rbind대신 merge 넣을 수 있게 cleaning해둬야!
#   dataset= rbind(dataset, temp) #행 길이달라서 안됨
# }


(file_list= list.files(pattern="*_clean1\\.csv$"))

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

