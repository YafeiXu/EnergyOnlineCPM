
maxEneryCPMv=function(data1,wNr,permNr,alpha){
tryCatch({

  is.installed <- function(mypkg){
    is.element(mypkg, installed.packages()[,1])
  } 


          if (!is.installed("energy")){
            install.packages("energy")
          }
          if (!is.installed("parallel")){
            install.packages("parallel")
          }


uniqueVineCPMenergy1=function(dataInput,confLev,simNr,warmNr,stepLength,runIndex){


maxEnergyVector=function(data2,permSampleSize){

        maxeg1=function(data1){

        library(energy)
        dataLength=dim(data1)[1]
            if(dataLength<wNr){

                return(999999)
            }else{
                runs=dataLength-wNr+1
                Dkn=numeric()
                for(i in 1:runs){

                    Dkn[i]=eqdist.e(data1, c((wNr/2+i-1),(dataLength-(wNr/2+i-1))))         
                }
                return(max(Dkn))
            }

        }


        dataLength=dim(data2)[1]
        permMatrix=list()

        permMatrix=t(as.matrix(sample(1:dataLength, dataLength, replace = FALSE, prob = NULL)))
        for(j in 1:permSampleSize){

        sameVec=TRUE
            while(sameVec==TRUE){
            newSample=sample(1:dataLength, dataLength, replace = FALSE, prob = NULL)
            compareVector=apply(permMatrix, 1, function(x, want) isTRUE(all.equal(x, want)), newSample)
                if(length(which(compareVector==TRUE))>=1){
                sameVec=TRUE
                }else{
                permMatrix=rbind(newSample,permMatrix )
                sameVec=FALSE
                }
            }

        }

        permData=list()
        for(i in 1:permSampleSize){
        permData[[i]]=data2[permMatrix[i,],]


        }

                library(parallel)
                cl <- makeCluster(detectCores())  
                one=parSapply(cl, X=permData, FUN=maxeg1)
                stopCluster(cl)
                return(one)

}

dataLength=dim(as.matrix(dataInput))[1]
d=dataInput; detectionTime=numeric(); estimatedCP=numeric()

confLev=confLev; simNr=simNr; warmNr=warmNr; dIndex=0

incomeDataLength=warmNr+1



if(dim(d)[1]>=(wNr+1)){

    incomeDataUpdate=dataInput[1:incomeDataLength,]

    noChange=TRUE
maxDkn=0
    while(noChange==TRUE & incomeDataLength<=dataLength){
       

print(paste("incomeStepLength=",incomeDataLength))
pointsChecked=1:incomeDataLength
plot(pointsChecked, main=paste("SearchNo.",runIndex,"ChangePt"," incomeStepLength=",incomeDataLength,"  finished=",100*round(incomeDataLength/dataLength, digit=2),"%"))
        realSectionData=list()






		 
		 for(i in 1:(dim(incomeDataUpdate)[1]-wNr+1)){
		
			 realSectionData[[i]]=as.matrix(cbind(incomeDataUpdate,i))
			
         }
        

        

        vDn=function(Mat){
         tryCatch({                    

			sectionPt=Mat[1,dim(Mat)[2]]
			Mat=Mat[,-dim(Mat)[2]]

                
                library(energy)
                tempDn=eqdist.e(Mat, c((sectionPt+wNr/2-1),(dim(Mat)[1]-(sectionPt+wNr/2-1))))

            return(tempDn)
            }, error=function(e){return(222)})
        }

        

        

        library(parallel)
        cl <- makeCluster(detectCores())  
        oneVectorSimDnHERE=parSapply(cl, X=realSectionData, FUN=vDn)
        stopCluster(cl)
        oneVectorSimDnHERE1=oneVectorSimDnHERE
        if(length(which(oneVectorSimDnHERE1==222))>0){oneVectorSimDnHERE1[which(oneVectorSimDnHERE1==222)]=mean(oneVectorSimDnHERE1[-(which(oneVectorSimDnHERE1==222))])}
		maxDkn=max(oneVectorSimDnHERE1); epochMaxDkn=which(oneVectorSimDnHERE1==max(oneVectorSimDnHERE1))+wNr-1


        

        cutoff=maxEnergyVector(incomeDataUpdate,permNr)
        maxDknPValue= 1-sum(cutoff<maxDkn)/(length(cutoff)+1)

        if(maxDknPValue>(alpha)){
            noChange=TRUE; incomeDataLength=incomeDataLength+1; if(incomeDataLength>dim(dataInput)[1]){print("endReached")}else{incomeDataUpdate=dataInput[1:incomeDataLength,]}
        }else{
            noChange=FALSE; incomeDataLength=incomeDataLength
        }

    }

    if(noChange==FALSE & incomeDataLength<=dataLength){

        dIndex=dIndex+1
        detectionTime[dIndex]=incomeDataLength
        estimatedCP[dIndex]=epochMaxDkn
        returnList=list()
        returnList[[1]]=detectionTime
        returnList[[2]]= estimatedCP
        returnList[[3]]=oneVectorSimDnHERE
        returnList[[4]]=oneVectorSimDnHERE1
        returnList[[5]]=maxDkn
        returnList[[6]]=cutoff
        returnList

        return(returnList)

    }

     if(noChange==TRUE &  incomeDataLength>dataLength){
     
        incomeDataLength=incomeDataLength-1
        returnList=list()
        returnList[[1]]=2600000
        returnList[[2]]=2600000
        returnList[[3]]=oneVectorSimDnHERE
        returnList[[4]]=oneVectorSimDnHERE1
        returnList[[5]]=maxDkn
        returnList[[6]]=cutoff
        returnList
        return(returnList)
     }    
     if(noChange==FALSE & incomeDataLength>dataLength){
        dIndex=dIndex+1
        detectionTime[dIndex]=incomeDataLength
        estimatedCP[dIndex]=epochMaxDkn
        incomeDataLength=incomeDataLength-1
        returnList=list()
        returnList[[1]]=detectionTime
        returnList[[2]]= estimatedCP
        returnList[[3]]=oneVectorSimDnHERE
        returnList[[4]]=oneVectorSimDnHERE1
        returnList[[5]]=maxDkn
        returnList[[6]]=cutoff        
        returnList
        return(returnList)
     }
}else{return(2020)}


}


setComb90=data1

plot(setComb90[,1],type="b")


dataStart=setComb90

simNr=1000
stepLength=110
confLev=.99
warmNr=wNr
runIndex=1



dataInput=dataStart
cp=dtt=numeric();mVCPMindex=1

uVCPM=uniqueVineCPMenergy1(dataInput,confLev,simNr,warmNr,stepLength,runIndex)
oneVectorSimDnHERE1=list()
oneVectorSimDnHERE=list()
oneVectorSimDnHERE[[1]]=uVCPM[[3]]
oneVectorSimDnHERE1[[1]]=uVCPM[[4]]
cp[1]=uVCPM[[2]];dtt[1]=uVCPM[[1]]
cp;dtt

warn2020multi=0

while((cp[length(cp)])!=2600000 & dim(dataStart[-(1:cp[length(cp)]),])[1]>=(warmNr+1) & warn2020multi!=2020){

runIndex=runIndex+1

if((cp[length(cp)]+warmNr)>length(setComb90[,1])){
warn2020multi=2020
}else{
    dataInput=dataStart[-(1:cp[length(cp)]),]

    uResult=uniqueVineCPMenergy1(dataInput,confLev=.99,simNr,warmNr,stepLength=(dim(dataInput)[1]-wNr/2+5),runIndex)

                        if((uResult[[1]])!=2600000){
                            mVCPMindex=1+mVCPMindex
                            cp[mVCPMindex]=uResult[[2]]+cp[mVCPMindex-1]
                            dtt[mVCPMindex]=uResult[[1]]+cp[mVCPMindex-1]
                            oneVectorSimDnHERE[[mVCPMindex]]=uResult[[3]]
                            oneVectorSimDnHERE1[[mVCPMindex]]=uResult[[4]]

                        }else{warn2020multi=2020;print(paste("restSetLessThan22"))}   

                        print(paste("changePt",cp,"and detectionPt",dtt))


 }                          
}
firstColumnOfData=setComb90[,1]
                            plot(firstColumnOfData,type="b",main="An Illustration of Change Location(s) in First Column Data Set")
                            for(i in 1:length(cp)){
                            if(length(cp)==1){lines(x=rep(cp,3),y=seq(min(setComb90[,1]),max(setComb90[,1]),length.out=3),col="red")}else{lines(x=rep(cp[i],3),y=seq(min(setComb90[,1]),max(setComb90[,1]),length.out=3),col="red")}                            
                            } 
                            
retList=list()
retList[[1]]=dtt
retList[[2]]=cp
return(c(dtt,cp))

}, error=function(e){return(1999)})

}                            
