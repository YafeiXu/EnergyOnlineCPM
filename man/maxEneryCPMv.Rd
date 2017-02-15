\name{maxEneryCPMv}
\alias{maxEneryCPMv}

\title{
Phase II Multiple Change Points Model for High Dimensional Time Series
}
\description{
This function is used for online detection of multiple change points based on energy divergence for high dimensional time series.
}
\usage{
maxEneryCPMv(data1, wNr, permNr, alpha)
}

\arguments{
  \item{data1}{
an N*d matrix, N is the number of observations and d the dimensions.
}
  \item{wNr}{
a scalar of warm-up.
}
  \item{permNr}{
a scalar of times of permutation.
}
  \item{alpha}{
a scalar of significant level
}
}
\details{
The function returns ONLY ONE vector containing even number components, where the first half stands for detection time vector and the rest half stands for the vector of change time locations.
}
\value{

  \item{result}{a vector of locations of detection time in the first half, locations of change time in the second half.}

}
\author{
Yafei Xu <yafei.xu@hu-berlin.de>
}


\examples{
library(MASS)

# simulate 300 length time series
simNr=300

# simulate 300 length 5 dimensonal standard Gaussian series
Sigma2 <- matrix(c(1,0,0,0,0,  0,1,0,0,0,   0,0,1,0,0,  0,0,0,1,0,  0,0,0,0,1),5,5)
Mean2=rep(1,5)
sim2=(mvrnorm(n = simNr, Mean2, Sigma2)) 

# simulate 300 length 5 dimensonal standard Gaussian series
Sigma3 <- matrix(c(1,0,0,0,0,  0,1,0,0,0,   0,0,1,0,0,  0,0,0,1,0,  0,0,0,0,1),5,5)
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
}
\keyword{ Phase II Statistical Process Control}
\keyword{ Change Point Model }% __ONLY ONE__ keyword per line
\keyword{ Energy Statistic }% __ONLY ONE__ keyword per line
