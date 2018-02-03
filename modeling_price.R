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
mod <- lm(근원물가~ ., data= priceMG_nonDate)
summary(mod) #multiple R-squared: 0.9884

## 
(mod_summ_coff <- summary(mod)$coefficients)
(mod_star_val <- mod_summ_coff[mod_summ_coff[,"Pr(>|t|)"]<0.07, ])
rownames(mod_star_val)

head(mod_star_val)

price_lm_cols <- c("근원물가","라면","달걀","맥주","휴대전화료","설렁탕","건설업","주류","우편서비스","전화및팩스서비스","오락및문화서비스","중등교육","소비자물가","공공서비스","개인서비스","생활물가","생산가능인구","경제활동인구","취업자")



## regsubsets - 최적 모형 무엇?
install.packages("leaps")
library(leaps)
reg_m <- regsubsets(근원물가~., data=priceMG[,price_lm_cols]) #회귀1
summary(reg_m)

par(mfrow=c(3,1))
plot(summary(reg_m)$adjr2)
plot(reg_m) #ADJusted R squared. 설명력
plot(reg_m, scale="r2")


 #plot 보면서 직접 타이핑
price_reg_cols <- c("달걀","건설업","주류","우편서비스"
                    ,"소비자물가","공공서비스","개인서비스"
                    ,"생활물가")

#3개: 달걀 소비자물가 




### for check- pValue/상관계수 plot 그리고 싶은데..      

# install.packages(c("caret","corrplot","FactoMineR")) #상관계수
library(caret)
library(corrplot)
library(FactoMineR)

# ----- error. out of bound
price_star_cr <- cor(mod_star_val[,rownames(mod_star_val)])
corrplot.mixed(price_star_cr,lower="number",upper="pie")

# priceMG_cr <- cor(priceMG[,c(97,seq(2,10))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")