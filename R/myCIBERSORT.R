myCIBERSORT <-
function(X, Y){
    
    #read in data
  
    X <- data.matrix(X)
    Y <- data.matrix(Y)
    
    #order
    X <- X[order(rownames(X)),]
    Y <- Y[order(rownames(Y)),]

    
    #anti-log if max < 50 in mixture file
    if(max(Y) < 50) {Y <- 2^Y}
    
   
    #intersect genes
    Xgns <- row.names(X)
    Ygns <- row.names(Y)
    YintX <- Ygns %in% Xgns
    Y <- Y[YintX,]
    XintY <- Xgns %in% row.names(Y)
    X <- X[XintY,]

    #standardize sig matrix
    X <- (X - mean(X)) / sd(as.vector(X))
    
    
    #print(nulldist)

    header <- c('Mixture',colnames(X),"P-value","Correlation","RMSE")
    #print(header)

    output <- matrix()
    itor <- 1
    mixtures <- dim(Y)[2]
    pval <- 9999

    #iterate through mixtures
    while(itor <= mixtures){
        print(paste("mixture",itor))
        y <- Y[,itor]
        
        #standardize mixture
        y <- (y - mean(y)) / sd(y)

        #run SVR core algorithm
        result <- CoreAlg(X, y)
        
        #get results
        w <- result$w
        mix_r <- result$mix_r
        mix_rmse <- result$mix_rmse
        

        #print output
        out <- c(colnames(Y)[itor],w,pval,mix_r,mix_rmse)
        if(itor == 1) {output <- out}
        else {output <- rbind(output, out)}
        
        itor <- itor + 1
        
    }
    
    #save results
   # write.table(rbind(header,output), file="CIBERSORT-Results.txt", sep="\t", row.names=F, col.names=F, quote=F)
    
    #return matrix object containing all results
    obj <- rbind(header,output)
    obj <- obj[,-1]
    obj <- obj[-1,]
    obj <- matrix(as.numeric(unlist(obj)),nrow=nrow(obj))
    rownames(obj) <- colnames(Y)
    colnames(obj) <- c(colnames(X),"P-value","Correlation","RMSE")
    obj
}
