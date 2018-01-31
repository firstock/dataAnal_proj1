#### data 의미 분석
getwd()
setwd("E:/github/dataAnal_proj1")
priceMG <- read.csv("data/price_merge.csv")

install.packages(c("caret","corrplot","FactoMineR"))
library(caret)
library(corrplot)
library(FactoMineR)

names(priceMG)
head(priceMG,1)
priceMG[is.na(priceMG),] #NA 없음

length(priceMG)

# # 예쁜 테이블보 디자인
# priceMG_cr <- cor(priceMG[,2:length(priceMG)])
# corrplot.mixed(priceMG_cr,lower="number",upper="color")

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



