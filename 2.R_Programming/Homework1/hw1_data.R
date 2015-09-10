#Question 11
colnames(kk)

#Question 12
kk[1:2,]

#Question 13
nrow(kk)

#Question 14
#kk[152:153,]
tail(kk, 2)

#Question 15
kk$Ozone[47]

#Question 16
colSums(is.na(kk))["Ozone"]

#Question 17
mean(kk$Ozone, na.rm = TRUE)

#Question 18
ss <- subset(kk, kk$Ozone > 31 & kk$Temp > 90)
mean(ss$Solar)

goodData <- complete.cases(kk)
filteredData <- goodData[goodData$Ozone > 31 & goodData$Temp > 90,]
mean(filteredData$Solar)

#Question 19
mean(subset(kk, kk$Month == 6)$Temp)

#Question 20
ss <- subset(kk, kk$Month == 5)
max(ss$Ozone, na.rm=TRUE)