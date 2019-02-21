classificationRF <-
function(exprM,casesamples,controlsamples,testingsamples)
{
   r<-ranger(class ~., data=data.frame(t(exprM[,c(casesamples,controlsamples)]),class=factor(c(rep("pos",length(casesamples)),rep("neg",length(controlsamples))),levels=c("neg","pos"))),probability=TRUE,write.forest=TRUE)
   p<-predict(r,data=data.frame(t(exprM[,testingsamples])))
   p<-p[["predictions"]][,"pos"]
  names(p)<-testingsamples
list(P=p,siggenes=NA)
}
