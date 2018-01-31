#### data 의미 분석
getwd()
setwd("E:/github/dataAnal_proj1")
priceMG <- read.csv("data/price_merge.csv")


install.packages(c("caret","corrplot","FactoMineR")) #상관계수
library(caret)
library(corrplot)
library(FactoMineR)

install.packages("Hmisc") #p-value
library(Hmisc)




names(priceMG)
head(priceMG,1)
priceMG[is.na(priceMG),] #NA 없음

length(priceMG)


## corr 10개씩 보기. 총 103개  length(priceMG)
# 근원물가: 97
priceMG_cr <- cor(priceMG[,c(97,seq(2,10))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(11,20))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(21,30))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(31,40))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(41,50))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(51,60))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(61,70))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(71,80))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(81,90))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")

priceMG_cr <- cor(priceMG[,c(97,seq(91,103))])
corrplot.mixed(priceMG_cr,lower="number",upper="color")


## 변수 전체 다
priceMG_cr <- cor(priceMG[,2:length(priceMG)])
# corrplot.mixed(priceMG_cr,lower="number",upper="color")

price_pear <- rcorr(as.matrix(priceMG_cr), type="pearson")
# head(price_pear)
# str(price_pear)

pearP_price <- subset(price_pear$P, select = 근원물가)
pearR_price <- subset(price_pear$r, select = 근원물가)

pearP_price[pearP_price<0.05,]
pearR_price[abs(pearR_price)>0.7,]
# write.csv(price_pear$P, "result/price_pear_P.csv")
# write.csv(price_pear$r, "result/price_pear_r.csv")



##
mod <- lm(근원물가~ 개인서비스, data=priceMG)
summary(mod)