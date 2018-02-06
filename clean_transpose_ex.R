setwd("e:/github/dataAnal_proj1") #학원

file <- "data/youthemploy_200301_201712.csv"#청년. ok 고용동향


## 읽기
data <- read.csv(file, header=T, sep=",",skip=2, stringsAsFactor = F) 
head(data,1)
tail(data,3)
names(data)

## 문자, 컬럼명에 자잘한거 지우기
# names(data) <- gsub('\\.|ㆍ','',names(data)) #일반
names(data) <- gsub('[^ㄱ-힣a-zA-Z0-9 ]|X|월','',names(data)) #transepose. 월
names(data)

dim(data)
str(data)

data[1]
(realName <- data[1])
is.data.frame(realName)

(dataBody <- data[,2:181])
dataBody <- t(as.matrix(dataBody))
head(dataBody,1)


colnames(dataBody) <- realName
str(colnames)

dataBody

########## fail. 뭘더 시도해야 하나?



# ## 현수코드
# data <- read.csv("youthemploy_200301_201712_원본.csv", header = T,skip=2, stringsAsFactor = F)
data <- t(as.matrix(data))
dim(data)
str(data)
head(data)

data <- unname(data, force = F) # attribute 속성 제거
data <- data.frame(data)
str(data)
data <- cbind(realName,data[2:181,])
# colnames(data) <- c("생산가능인구", "경제활동인구", "취업자", "실업자", "실업률", "고용률", "경제활동참가율")
colnames(data) <- realName
str(data)
names(data)
date <- seq(as.Date("2003-01-01"), as.Date("2017-12-01"), by="month")
data$date <- seq(as.Date("2003-01-01"), as.Date("2017-12-01"), by="month")
# write.csv(data, "final.csv")

















#### ## r dataframe Transpose. 첫줄 X1,2,3 들어간거 지우기
# temp_colname <- names(price1)
# price1 <- cbind(temp_colname, as.data.frame(t(price1)))
# #칼럼에 엔터있는건 일단 sublimetext에서 수동으로 붙임. \n\d{2}
# # 혹은 write.csv(), read.csv(..., skip=1) 하던가

head(price1,1)
names(price1)

## 특정 칼럼빼고 다시 저장
outName <- "temperature"
# "temperature", "tot", "payaim", "jobless", "youthemploy"


## 일반
# write.csv( subset(price1, select= -구분 ), paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
# write.csv( price1[ ,-grep("계|(구분)",colnames(price1))], paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
write.csv( price1[ ,-grep("지점",colnames(price1))], paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
# write.csv( price1, paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)
## transpose 했던거
# write.csv( price1, paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)

###엑셀 작업. <<< transpose 한 것 해당
# transpose한 건 첫 줄 빼주고, 칼럼은 몇개 안되면 노가다. 많으면 함더 불러서 코딩







### merge 위한 밑작업

outName <- "jobless"
# "temperature" # ok
# "tot" # ok
# "payaim" #ok
# "jobless"
# "youthemploy" #ok

price2 <- read.csv(paste0("data/price_",outName,"_clean1.csv"), header=T, sep=",")


## 첫 칼럼 Date로
(nl <- names(price2))
(names(price2) <- c("Date",nl[-1]))
head(price2$Date,40)


## 엑셀작업
# Date 칼럼명 각기 다르게 하기

## 같은 형식으로 바꾸기
# 년월은 as.Date()불가. 날짜 붙이는건 조작


## 특정 칼럼만 남기기
#price2 <- price2[ ,c("Date", "소비자물가")] #tot 
price2 <- price2[ ,c("Date", "청년실업률")] #jobless


str(price2)

# # item
# reg_find <- "(\\d{4}).0?(\\d)"
# reg_out <- "\\1-0\\2"
# price2$Date <- gsub(reg_find,reg_out,price2$Date)
# reg_find <- "\\-0(\\d{2})"
# reg_out <- "-\\1"
# price2$Date <- gsub(reg_find,reg_out,price2$Date)

#tot, jobless, youthemploy
reg_find <- "(\\d{4})(\\d{2})"
reg_out <- "\\1-\\2"
price2$Date <- gsub(reg_find,reg_out,price2$Date)

# #payaim
# reg_find <- "(\\d{4})\\.(\\d{2})"
# reg_out <- "\\1-\\2"
# price2$Date <- gsub(reg_find,reg_out,price2$Date)
# reg_find <- "(\\.1)"
# reg_out <- "-10"
# price2$Date <- gsub(reg_find,reg_out,price2$Date)

#

head(price2$Date,40)






### cleaning 최종
write.csv(price2, paste0("data/price_",outName,"_clean2.csv"), row.names=FALSE)
# 날짜 형식이면 알아서 날짜가 붙음 @엑셀. 데려올땐 괜찮


# price3 <- read.csv(paste0("data/price_",outName,"_clean2.csv"), header=T, sep=",")
# head(price3,3)
