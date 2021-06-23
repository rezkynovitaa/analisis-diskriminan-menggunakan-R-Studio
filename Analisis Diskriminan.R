library(caret)
library(MASS)
library(klaR)
library(MVN)
library(biotools)
library(candisc)
library(DFA.CANCOR)
dataAD <- read.csv(file.choose(),header = T) #memilih file data analisis diskriminan
#Multivariate Normality Test
nm.mardia.test <- mvn(dataAD[,1:2], mvnTest = "mardia",
                      multivariateOutlierMethod = "adj",showNewData = F)
nm.mardia.test
#Homogenity of Covariance Matrix Test
factor(dataAD[,3])
hc.test <- boxM(dataAD[1:2],dataAD[,3])
hc.test
#Correlation dan multikolinearity check
kor<-cor(dataAD[,1:2])
kor
#Wilk Lamda Test
x<-as.matrix(dataAD[,1:2])
x.manova<-manova(x~dataAD[,3])
x.manova
x.wilks<-summary(x.manova,test="Wilks")
x.wilks
#Canonical Correlation (CC)
cc<-candisc(x.manova)
cc
##LINEAR DISCRIMINANT ANALYSIS
#Fit the model
modelAD <- lda(Status~., data = dataAD)
modelAD
#Make predictions
predictions <- predict(modelAD,dataAD)
predictions
#Prediction result
predictions.result=predictions$class
predictions.result=cbind(predictions.result)
real.data=cbind(dataAD$Status)
out=data.frame(real.data,predictions.result)
out
#Confussion table
confusion.lda<-table(dataAD$Status,predict(modelAD)$class) 
confusion.lda