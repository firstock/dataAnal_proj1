# setwd("E:/github/dataAnal_proj1")
setwd("E:/github/dataAnal_proj1/data")
file_list= list.files(pattern="_clean1\\.csv$")

dataset= data.frame()
for(file in file_list){
  # print(file)
  temp =  read.csv(file, header=T, sep=",")
  head(temp,2) #왜 안읽힘??
}
# for(outName,i in zip(outNames,1:length(outNames))){
#   price[i] <- read.csv(paste0("data/price_",outName,"_clean1.csv"), header=T, sep=",")
# }
