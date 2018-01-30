getwd()
setwd("E:/github/dataAnal_proj1")

# install.packages("lubridate")
# library(lubridate) #날짜변환은 나중에 한꺼번에 하자

file <- "data/seoul_price_item_200302_201712.csv"#소비자물가지수(주요품목별)
# file <- "data/seoul_price_payaim_200302_201712.csv"#소비자물가지수(지출목적별). ok
# file <- "data/price_tot_200301_201712.csv"#소비자물가지수(개괄). ok
# file <- "data/jobless_200301_201705.csv"#실업률. ok
# file <- "data/youthemploy_200301_201712.csv"#청년. ok 고용동향

price1 <- read.csv(file, header=T, sep=",") #, skip=1, skip=2
head(price1,3)
tail(price1,3)
names(price1)

## 문자, 컬럼명에 자잘한거 지우기
# item
price1$외래진료비 <- gsub('\\s*-\\s*','',price1$외래진료비)
# names(price1) <- gsub('\\.|ㆍ','',names(price1)) #일반
names(price1) <- gsub('[^ㄱ-힣a-zA-Z0-9 ]|X','',names(price1)) #transepose. 월
names(price1)

# ## r dataframe Transpose. 첫줄 X1,2,3 들어간거 지우기
# temp_colname <- names(price1)
# price1 <- cbind(temp_colname, as.data.frame(t(price1)))
# #칼럼에 엔터있는건 일단 sublimetext에서 수동으로 붙임. \n\d{2}

head(price1,1)
names(price1)

## 특정 칼럼빼고 다시 저장
outName <- "item"
# outName <- "tot"
# outName <- "payaim"
# outName <- "jobless"
# outName <- "youthemploy"


## 일반
# write.csv( subset(price1, select= -구분 ), paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
write.csv( price1[,-grep("계|(구분)",colnames(price1))], paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
## transpose 했던거
# write.csv( price1, paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)

##엑셀 작업. <<< transpose 한 것 해당
# transpose한 건 첫 줄 빼주고, 칼럼은 몇개 안되면 노가다. 많으면 함더 불러서 코딩

price2 <- read.csv(paste0("data/price_",outName,"_clean1.csv"), header=T, sep=",")
head(price2,2)
names(price2)

