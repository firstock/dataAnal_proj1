getwd()
power1 <- read.csv("data/powerGenerator_EPSIS.csv", header=TRUE, skip=1)
head(power1)
str(power1)

install.packages("dplyr")
