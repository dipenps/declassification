\name{classificationElasticNet}
\alias{classificationElasticNet}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Classifcation using ElasticNet
}
\description{
The function builds ElasticNet classifer using the training samples, and then output predicted value for testing samples. 
}
\usage{
classificationElasticNet(exprM, casesamples, controlsamples, testingsamples)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exprM}{
feature by sample matrix.Sample should include both training and testing samples.
}
  \item{casesamples}{
Sample IDs for case samples in the training.
}
  \item{controlsamples}{
Sample IDs for control samples in the training.
}
  \item{testingsamples}{
Sample IDs for testing samples.}
}
\details{
The function uses an inner loop of 10 crossvalidation to choose the best alpha and lamba for elasticNet
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{P }{Predicted probability of the testing samples}
\item{siggenes }{features selected by elasticNet model}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(exprML)
data(sampleIDs)
Index<-featureselection(exprML[[1]],casesamples=sampleIDs[[1]][["casesamples"]],controlsamples=sampleIDs[[1]][["controlsamples"]],topN=200)
r<-classificationElasticNet(exprML[[1]][Index,], casesamples=sampleIDs[[1]][["casesamples"]], controlsamples=sampleIDs[[1]][["controlsamples"]], testingsamples=unlist(sampleIDs[[1]])) 
}