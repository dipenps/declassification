\name{marker}
\alias{marker}
\docType{data}
\title{
blood cell markers used by DSA algorithms
}
\description{
a list of gene vectors, each represent cell markers for a particular cell type.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(marker)}
\format{
  The format is:
List of 8
 $ B-CD19           : atomic [1:205] LOC90925 STEAP1 AIM2 BLNK ...
  ..- attr(*, "na.action")=Class 'exclude'  int 70
 $ Erythroblast     : atomic [1:296] LXN RP11-529I10.4 SLC11A2 AQP2 ...
  ..- attr(*, "na.action")=Class 'exclude'  int 21
 $ Granulocyte-CD66b: atomic [1:734] LYN HAL GK MTHFS ...
  ..- attr(*, "na.action")=Class 'exclude'  int 5
 $ Megakaryocyte    : atomic [1:258] LAT DDAH1 ARHGAP21 LOC352909 ...
  ..- attr(*, "na.action")=Class 'exclude'  int 35
 $ Monocyte-CD14    : atomic [1:184] COMMD9 RASSF4 SGK3 ANXA2P1 ...
  ..- attr(*, "na.action")=Class 'exclude'  int 6
 $ NK-CD56          : atomic [1:73] SH2D1B ADAMTS1 FLJ20699 BZRAP1 ...
  ..- attr(*, "na.action")=Class 'exclude'  int 40
 $ T-CD4            : chr [1:44] "C6orf105" "WNT7A" "DUSP4" "MAN1C1" ...
 $ T-CD8            : chr [1:5] "CD8B1" "CD8A" "CD248" "LOC650761" ...
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(marker)
## maybe str(marker) ; plot(marker) ...
}
\keyword{datasets}
