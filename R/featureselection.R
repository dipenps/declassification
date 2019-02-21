featureselection <-
function(exprM,casesamples,controlsamples,pcutoff,topN)
  {
      pvalue<-sapply(1:nrow(exprM),function(i)as.numeric(try(t.test(exprM[i,casesamples],exprM[i,controlsamples])$p.value)))
      if(!missing(pcutoff))
        {       
          feature<-which(pvalue<pcutoff)
          if(length(feature)==0&!missing(topN))feature<-order(pvalue)[1:topN]
        }
      if(!missing(topN))
        {       
          feature<-order(pvalue)[1:topN]
        }
      print(paste("featureselection: selected",length(feature),"features"))
      print(paste("featureselection: controlsampleNum",length(controlsamples)))
      feature;
      
    }
