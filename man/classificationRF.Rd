\name{classificationRF}
\alias{classificationRF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Classification using Random Forest
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  The function builds RF classifer using the training samples, and then output predicted value for testing samples.
}
\usage{
classificationRF(exprM, casesamples, controlsamples, testingsamples)
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
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{P }{Predicted values for the testing samples}
\item{siggenes }{NA}

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
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
r<-classificationRF(exprML[[1]][Index,], casesamples=sampleIDs[[1]][["casesamples"]], controlsamples=sampleIDs[[1]][["controlsamples"]], testingsamples=unlist(sampleIDs[[1]])) 

}