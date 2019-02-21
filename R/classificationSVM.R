classificationSVM <-
function(exprM,casesamples,controlsamples,testingsamples)
  {
  
casesize<-length(casesamples)
controlsize<-length(controlsamples)
casen<-floor(casesize/10)
controln<-floor(controlsize/10)
casesamplesList<-split(sample(casesamples),list(c(rep(1:10,each=casen),1:(casesize-10*casen))[1:casesize]))
controlsamplesList<-split(sample(controlsamples),list(c(rep(1:10,each=controln),1:(controlsize-10*controln))[1:controlsize]))
    
##    
####from big to small number
lambdaList<-exp(seq(3,-6, length=10))
  
auc<-rep(NA,length(lambdaList))
#featureNum<-matrix(0,length(alphaList),length(lambdaList))

#####################
    
for(k in 1:length(lambdaList))
  {
    print(lambdaList[k])
r<-foreach(i =1:10)%dopar%
  {
      traincase<-setdiff(casesamples,casesamplesList[[i]])
      traincontrol<-setdiff(controlsamples,controlsamplesList[[i]])
      test<-c(casesamplesList[[i]],controlsamplesList[[i]])
    
      #w<-c(neg=1,pos=floor(length(traincontrol)/length(traincase)))
 svmM <- svm(t(exprM[,c(traincase,traincontrol)]), y=factor(c(rep("pos",length(traincase)),rep("neg",length(traincontrol))),levels=c("neg","pos")), cost=lambdaList[k],type="C-classification",kernel="linear",scale=F,cachesize=500)

      curp<-attr(predict(svmM,t(exprM[,test,drop=FALSE]),decision.values=T),"decision.values");
       if(colnames(curp)=="pos/neg")p<-curp[,"pos/neg"];
       if(colnames(curp)=="neg/pos")p<--curp[,"neg/pos"];
      
data.frame(p=p,label=c(rep("pos",length(casesamplesList[[i]])),rep("neg",length(controlsamplesList[[i]]))))
    }

r<-do.call("rbind",r)
auc[k]<-as.numeric(try(performance(prediction(r[,"p"],r[,"label"],label.ordering=c("neg","pos")),measure="auc")@y.values[[1]]))
  }

#######
maxauc<-max(auc,na.rm=TRUE)
#minfeatureNum<-min(featureNum[auc==maxauc])
bestlambda<-lambdaList[which(auc==maxauc)][1]
print(paste("best C=",bestlambda))

# w<-c(neg=1,pos=floor(length(controlsamples)/length(casesamples)))
svmM <- svm(t(exprM[,c(casesamples,controlsamples)]), y= factor(c(rep("pos",length(casesamples)),rep("neg",length(controlsamples))),levels=c("neg","pos")), cost=bestlambda,type="C-classification",kernel="linear",scale=F,cachesize=500)

      curp<-attr(predict(svmM,t(exprM[,testingsamples,drop=FALSE]),decision.values=T),"decision.values");
       if(colnames(curp)=="pos/neg")p<-curp[,"pos/neg"];
       if(colnames(curp)=="neg/pos")p<--curp[,"neg/pos"];

names(p)<-testingsamples;
list(P=p,siggenes=NA);
}
