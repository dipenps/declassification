Ztransform <-
function(exprM,basesamples)
  {
    basesamples<-intersect(basesamples,colnames(exprM))
    if(length(basesamples)<10) warning("base sample number below 10")
    m<-apply(exprM[,basesamples],1,mean,na.rm=TRUE)
    sd<-apply(exprM[,basesamples],1,sd,na.rm=TRUE)
    s0<-quantile(sd,0.5,na.rm=TRUE)
    exprM<-sweep(exprM,1,m,"-")
    exprM<-sweep(exprM,1,sd+s0,"/")
    exprM;
  }
