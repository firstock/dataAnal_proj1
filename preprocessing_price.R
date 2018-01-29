getwd()
setwd("E:/github/dataAnal_proj1")

# file <- "data/seoul_price_item_200302_201712.csv"#소비자물가지수(주요품목별)
file <- "data/seoul_price_payaim_200302_201712.csv"#소비자물가지수(주요품목별)

price1 <- read.csv(file, header=T, sep=",", skip=1)
head(price1,3)
tail(price1,3)
names(price1)

## 문자, 컬럼명에 '.' 지우기
# item
# price1$외래진료비 <- gsub('\\s*-\\s*','',price1$외래진료비)

names(price1) <- gsub('\\.','',names(price1))

## "구분"칼럼빼고 다시 저장
outName <- "payaim"
write.csv( subset(price1, drop = ), paste0("data/price_",outName,"_clean1.csv"), row.names=FALSE)

price2 <- read.csv(paste0("data/price_",outName,"_clean1.csv"), header=T, sep=",")
head(price2,2)
names(price2)

