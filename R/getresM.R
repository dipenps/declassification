getresM <-
function(exprM,compM,basesamples,method=c("csSAM","NMF"),uselogvalue=c(FALSE,TRUE))
  {
     if(any(colnames(exprM)!=colnames(compM)))stop("exprM and compM sample name inconsistent")
     if(is.null(rownames(exprM)))stop("gene names are missing")
     basesamples<-intersect(basesamples,colnames(exprM))
     if(length(basesamples)<10) warning("base sample number below 10")

    if(length(basesamples)<nrow(compM))
     {
      compM<-compM[order(apply(compM,1,sd),decreasing=TRUE)[1:length(basesamples)],]
     }   

    if(method=="csSAM")
      {
        if(uselogvalue)
          {
           fit=lsfit(t(compM[,basesamples]),t(exprM[,basesamples]),intercept=FALSE)
           p<-t(fit$coefficients)%*%compM
           resM<-exprM-p;
          }else{
           fit=lsfit(t(compM[,basesamples]),2^t(exprM[,basesamples]),intercept=FALSE)
           p<-t(fit$coefficients)%*%compM
           p[p<1]<-1
           resM<-exprM-log2(p);
          }
         rownames(resM)<-rownames(exprM)
      }
     
    if(method=="NMF")
      {
        if(uselogvalue)
          {
            ####NMF needs positive inputs
           if(min(exprM)<0) exprM<-exprM-min(exprM)
           fit=fcnnls(t(compM[,basesamples]),t(exprM[,basesamples]))
           p<-t(fit$x)%*%compM
           resM<-exprM-p;
          }else{
           fit=fcnnls(t(compM[,basesamples]),2^t(exprM[,basesamples]))
           p<-t(fit$x)%*%compM
           p[p<1]<-1
           resM<-exprM-log2(p);
          }
        rownames(resM)<-rownames(exprM)
      }
     
     
       resM;
   }
