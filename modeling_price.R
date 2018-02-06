#### data 의미 분석
getwd()
# setwd("E:/github/dataAnal_proj1") #학원
setwd("D:/github/dataAnal_proj1") #집

# source("clean_1_price.R")
# source("merge_clean2_price.R")

priceMG <- read.csv("data/price_merge.csv")

# install.packages("Hmisc") #p-value
library(Hmisc)


str(priceMG)
names(priceMG)
head(priceMG,2)
priceMG[is.na(priceMG),] #NA 없음 

ncol(priceMG)



### 별 뜬 변수만 보기         <<<<<<<<<<  ㅈㅇㅇㅎ
## lm의 종속변수에 date를 넣으면 안 된다 
## 다중선형회귀 분석1
priceMG_nonDate <- priceMG[,-1]
mod <- lm(소비자물가~ ., data= priceMG_nonDate)
summary(mod) #multiple R-squared: 0.9884 => 0.9457

## 
(mod_summ_coff <- summary(mod)$coefficients)
(mod_star_val <- mod_summ_coff[mod_summ_coff[,"Pr(>|t|)"]<0.07, ])
rownames(mod_star_val)

head(mod_star_val)
  
price_lm_cols <- c("소비자물가", "담배", "의류", "주택임차료", "외래환자서비스", "병원서비스", "운송장비", "우편서비스", "전화및팩스장비", "기타오락및문화용주요내구재", "오락및문화서비스", "유치원및초등교육", "기타교육", "기타개인용품", "기타서비스", "고용률")



## regsubsets - 최적 모형 무엇?
install.packages("leaps")
library(leaps)
reg_m <- regsubsets(소비자물가~., data=priceMG[,price_lm_cols]) #회귀1
summary(reg_m)

par(mfrow=c(1,1))
plot(summary(reg_m)$adjr2)
plot(reg_m) #ADJusted R squared. 설명력
plot(reg_m, scale="r2")


 #plot 보면서 직접 타이핑
price_reg_cols <- c("소비자물가","")


### pValue/상관계수 plot

install.packages(c("caret","corrplot","FactoMineR")) #상관계수
library(caret)
library(corrplot)
library(FactoMineR)

par(mfrow=c(1,1))
price_star_cr <- cor(priceMG[,c("소비자물가",price_reg_cols)])
corrplot.mixed(price_star_cr,lower="number",upper="pie")

# priceMG_cr <- cor(priceMG[,c(97,seq(2,10))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
