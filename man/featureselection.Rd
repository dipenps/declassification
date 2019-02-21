\name{featureselection}
\alias{featureselection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Slect features for classification
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  Select features that distinguish between case and control
  samples.
}
\usage{
featureselection(exprM, casesamples, controlsamples, pcutoff, topN)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{exprM}{
    %%     ~~Describe \code{exprM} here~~
    a gene by sample matrix
}
  \item{casesamples}{
    %%     ~~Describe \code{casesamples} here~~
    case sample IDs
}
  \item{controlsamples}{
    %%     ~~Describe \code{controlsamples} here~~
    control sample IDs
}
  \item{pcutoff}{
    %%     ~~Describe \code{pcutoff} here~~
    T-test p-value cutoff for selecting features.
}
  \item{topN}{
    %%     ~~Describe \code{topN} here~~
    The number of top ranking features selected. (Features are ranked by p-value)
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
The index number of selected features.
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
r<-featureselection(exprML[[1]],casesamples=sampleIDs[[1]][["casesamples"]],controlsamples=sampleIDs[[1]][["controlsamples"]],topN=200)
r<-featureselection(exprML[[1]],casesamples=sampleIDs[[1]][["casesamples"]],controlsamples=sampleIDs[[1]][["controlsamples"]],pcutoff=0.001)
genes<-rownames(exprML[[1]])[r]

}