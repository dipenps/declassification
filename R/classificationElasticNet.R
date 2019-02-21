classificationElasticNet <-
function(exprM,casesamples,controlsamples,testingsamples)
  {
  
casesize<-length(casesamples)
controlsize<-length(controlsamples)
casen<-floor(casesize/10)
controln<-floor(controlsize/10)
casesamplesList<-split(sample(casesamples),list(c(rep(1:10,each=casen),1:(casesize-10*casen))[1:casesize]))
controlsamplesList<-split(sample(controlsamples),list(c(rep(1:10,each=controln),1:(controlsize-10*controln))[1:controlsize]))
    
##    
alphaList<-c(0.1,0.3,0.5,0.7,0.9,1)
####from big to small number
lambdaList<-exp(seq(3,-8, length=100))
  
auc<-matrix(NA,length(alphaList),length(lambdaList))
#featureNum<-matrix(0,length(alphaList),length(lambdaList))

#####################
    
for(k in 1:length(alphaList))
  {
    print(alphaList[k])
r<-foreach(i =1:10)%dopar%
  {
      traincase<-setdiff(casesamples,casesamplesList[[i]])
      traincontrol<-setdiff(controlsamples,controlsamplesList[[i]])
      test<-c(casesamplesList[[i]],controlsamplesList[[i]])
        # w<-c(rep(length(traincontrol)/length(traincase),length(traincase)),rep(1,length(traincontrol)))
 Enet <- glmnet(t(exprM[,c(traincase,traincontrol)]), factor(c(rep("pos",length(traincase)),rep("neg",length(traincontrol))),levels=c("neg","pos")),family="binomial", alpha=alphaList[k], lambda=lambdaList)
      p<-predict(Enet,newx=t(exprM[,test,drop=FALSE]),type="response")
      ###some smaller lambda will cause fail to converge, thus fewer columns in r
      if(ncol(p)<length(lambdaList))
        {
          p<-cbind(p,matrix(NA,nrow(p),length(lambdaList)-ncol(p),dimnames=list(rownames(p),paste("s",ncol(p):(length(lambdaList)-1),sep=""))))
        }
data.frame(p=p,label=c(rep("pos",length(casesamplesList[[i]])),rep("neg",length(controlsamplesList[[i]]))))
    }

r<-do.call("rbind",r)
r[,which(colSums(is.na(r))>0)]<-NA  
auc[k,]<-sapply(1:length(lambdaList),function(i)as.numeric(try(performance(prediction(r[,i],r[,length(lambdaList)+1],label.ordering=c("neg","pos")),measure="auc")@y.values[[1]])))
  }

#######
maxauc<-max(auc,na.rm=TRUE)
#minfeatureNum<-min(featureNum[auc==maxauc])
bestalpha<-alphaList[row(auc)[which(auc==maxauc)][1]]
bestlambda<-lambdaList[col(auc)[which(auc==maxauc)]][[1]]
 
 # w<-c(rep(length(controlsamples)/length(casesamples),length(casesamples)),rep(1,length(controlsamples)))
Enet <- glmnet(t(exprM[,c(casesamples,controlsamples)]),factor(c(rep("pos",length(casesamples)),rep("neg",length(controlsamples))),levels=c("neg","pos")),family="binomial", alpha=bestalpha, lambda=lambdaList)
siggenes<-rownames(Enet$beta)[Enet$beta[,which(Enet$lambda==bestlambda)]>0]


P<-predict(Enet,newx=t(exprM[,testingsamples,drop=FALSE]),s=bestlambda,type="response")[,1]
names(P)<-testingsamples;
list(P=P,siggenes=siggenes);
}
