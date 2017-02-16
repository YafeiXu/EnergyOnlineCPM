# EnergyOnlineCPM
An R Package for Phase II Multiple Change Points Detection based on Energy Statistic.

1. Installation with following four lines in R.

    install.packages("devtools")
    library(devtools)
    install_github("YafeiXu/EnergyOnlineCPM")
    library(EnergyOnlineCPM)
    
2. An example of simulation study for P2MECPM to detect a five dimensional time series 
with two change points in variance shifts by standard Gaussian can be found in the manual of the package.

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
    maxEneryCPMv(data1,wNr,permNr,alpha)
    
3 Contact author: Yafei.Xu@hu-berlin.de