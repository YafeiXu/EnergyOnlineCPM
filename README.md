 
# EnergyOnlineCPM: Distribution Free Multivariate Control Chart Based on Energy Test
Provides a function for distribution free control chart based on the change point model, for multivariate statistical process control. 
The main constituent of the chart is the energy test that focuses on the discrepancy between empirical characteristic functions of two random vectors. 
This new control chart highlights in three aspects. 
Firstly, it is distribution free, requiring no knowledge of the random processes. 
Secondly, this control chart can monitor mean and variance simultaneously. 
Thirdly it is devised for multivariate time series which is more practical in real data application. 
Fourthly, it is designed for online detection (Phase II), which is central for real time surveillance of stream data. For more information please refer to O. Okhrin and Y.F. Xu (2017).

## 1. Keywords: 
Change point model • Energy test • Multivariate statistical process monitoring • Phase II statistical process control.

## 2. Install and Usage:
### 2.1 Install
~~~R
install.packages("EnergyOnlineCPM")
library(EnergyOnlineCPM)
~~~
### 2.2 Example and Usage
Please refer to Package Reference Manual: https://drive.google.com/file/d/15qUGOFjvkrZaC1QA_h3j3lcuepafLxyF/view?usp=sharing and https://cran.r-project.org/web/packages/EnergyOnlineCPM/index.html
~~~
library(MASS)
# simulate 300 length time series
simNr=300
# simulate 300 length 5 dimensonal standard Gaussian series
Sigma2 <- matrix(c(1,0,0,0,0, 0,1,0,0,0, 0,0,1,0,0, 0,0,0,1,0, 0,0,0,0,1),5,5)
Mean2=rep(1,5)
sim2=(mvrnorm(n = simNr, Mean2, Sigma2))
# simulate 300 length 5 dimensonal standard Gaussian series
Sigma3 <- matrix(c(1,0,0,0,0, 0,1,0,0,0, 0,0,1,0,0, 0,0,0,1,0, 0,0,0,0,1),5,5)
Mean3=rep(0,5)
sim3=(mvrnorm(n = simNr, Mean3, Sigma3))
# construct a data set of length equal to 90.
# first 20 points are from standard Gaussian.
# second 30 points from a Gaussian with a mean shift with 555.
# last 40 points are from standard Gaussian.
data1=sim6=rbind(sim2[1:20,],(sim3+555)[1:30,],sim2[1:40,])
# set warm-up number as 20, permutation 200 times, significant level 0.005
wNr=20
permNr=200
alpha=1/200
maxEnergyCPMv(data1,wNr,permNr,alpha)
~~~

## 3. Papers and Package
### 3.1 A Nonparametric Multivariate Statistical Process Control Chart Based on Change Point Model
- DOI: https://doi.org/10.35566/isdsa2019c2
- PDF@googledrive: https://drive.google.com/file/d/1ahkLP0672MYnyaqiNKP9glw21a4axvGH/view?usp=sharing

### 3.2 Reference Manual: An R Package 'EnergyOnlineCPM'
- PDF@googledrive https://drive.google.com/file/d/15qUGOFjvkrZaC1QA_h3j3lcuepafLxyF/view?usp=sharing
  
### 3.3 Introduction of Package 'EnergyOnlineCPM' in CRAN
https://cran.r-project.org/web/packages/EnergyOnlineCPM/index.html
