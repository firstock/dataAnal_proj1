#### data 의미 분석
getwd()
setwd("E:/github/dataAnal_proj1")
priceMG <- read.csv("data/price_merge.csv")


# install.packages(c("caret","corrplot","FactoMineR")) #상관계수
library(caret)
library(corrplot)
library(FactoMineR)

# install.packages("Hmisc") #p-value
library(Hmisc)



str(priceMG)
names(priceMG)
head(priceMG,2)
priceMG[is.na(priceMG),] #NA 없음

length(priceMG)



### 별 뜬 변수만 보기         <<<<<<<<<<  ㅈㅇㅇㅎ
## lm의 종속변수에 date를 넣으면 안 된다 
## 다중선형회귀 분석1
priceMG_nonDate <- priceMG[,-1]
mod <- lm(근원물가~ ., data= priceMG_nonDate)
summary(mod) #multiple R-squared: 0.9884

# 순차실행ㄴㄴ

## 다중선형회귀 분석2
priceMG_meaning <- priceMG[,c("근원물가","라면","달걀","맥주","휴대전화료","설렁탕","건설업","주류","우편서비스","전화및팩스서비스","오락및문화서비스","중등교육","소비자물가","공공서비스","개인서비스","생활물가","생산가능인구","경제활동인구","취업자")]
mod <- lm(근원물가~ ., data= priceMG_meaning)
summary(mod) #multiple R-squared: 0.9364


# head(mod) #for check
# head(summary(mod)$coefficients) #for check
# write.csv(summary(mod)$coefficients,"result/mod_summ_coeff.csv") #for check
# write.csv(mod_star_val,"result/mod_star_val.csv") #for check

## 
(mod_summ_coff <- summary(mod)$coefficients)
(mod_star_val <- mod_summ_coff[mod_summ_coff[,"Pr(>|t|)"]<0.07, ])
rownames(mod_star_val)

head(mod_star_val)



### for check- pValue/상관계수 plot 그리고 싶은데..       ----- error. out of bound
priceMG_meaning <- priceMG[,c("근원물가","라면","달걀","맥주","휴대전화료","설렁탕","건설업","주류","우편서비스","전화및팩스서비스","오락및문화서비스","중등교육","소비자물가","공공서비스","개인서비스","생활물가","생산가능인구","경제활동인구","취업자")]


price_star_cr <- cor(mod_star_val[,rownames(mod_star_val)])
corrplot.mixed(price_star_cr,lower="number",upper="pie")

# priceMG_cr <- cor(priceMG[,c(97,seq(2,10))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")













# 구글::r lm var loop. https://goo.gl/4ZCkff 모르겠다~
# for(inde_var in rownames(mod_star_val)){
#   (mod2 <- lm(근원물가~ inde_var[[1]], data= priceMG_nonDate)  )
# }


 # 이 밑은 뭘 잘못했는지 이상하게 나옴 #


# ## corr 10개씩 보기. 총 103개  length(priceMG)
# # 근원물가: 97
# priceMG_cr <- cor(priceMG[,c(97,seq(2,10))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(11,20))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(21,30))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(31,40))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(41,50))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(51,60))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(61,70))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(71,80))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(81,90))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")
# 
# priceMG_cr <- cor(priceMG[,c(97,seq(91,103))])
# corrplot.mixed(priceMG_cr,lower="number",upper="pie")


# priceMG[,2:length(priceMG)]
# ## 변수 date빼고 다
# priceMG_cr <- cor(priceMG[,2:length(priceMG)])
# # corrplot.mixed(priceMG_cr,lower="number",upper="color")
# 
# price_pear <- rcorr(as.matrix(priceMG_cr), type="pearson")
# # head(price_pear)
# # str(price_pear)
# 
# (pearP_price <- subset(price_pear$P, select = 근원물가))
# (pearR_price <- subset(price_pear$r, select = 근원물가))
# 
# # pearP_price[pearP_price<0.05 & 0<pearP_price,]
# pearP_price[which(pearP_price<0.05 & 0<pearP_price),] #올~ which하니 NA칼럼이 없어짐!
# pearR_price[abs(pearR_price)>0.7,]
# 
# # 상관계수>0.7 & pValue<0.05 일때, 각 칼럼의 상관계수 값과 pvalue값
# pearP_price[which(pearP_price<0.05 & abs(pearR_price)>0.7),] # 다 0
# pearR_price[which(pearP_price<0.05 & abs(pearR_price)>0.7),]

## save
# write.csv(price_pear$P, "result/price_pear_P.csv")
# write.csv(price_pear$r, "result/price_pear_r.csv")