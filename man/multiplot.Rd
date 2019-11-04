\name{multiplot}
\alias{multiplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Multiplot
}
\description{
Plot multiple ggplot objects
}
\usage{
multiplot(..., plotlist = NULL, file, cols = 1, layout = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{\dots}{
ggplot object
}
  \item{plotlist}{
list of ggplot object, either plotlist should be specified, or ...
}
  \item{file}{
...
}
  \item{cols}{
number of columns
}
  \item{layout}{
matrix describing how the plots should be ordered
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a plot containing all ggplot objects
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

## The function is currently defined as
function (..., plotlist = NULL, file, cols = 1, layout = NULL) 
{
    library(grid)
    plots <- c(list(...), plotlist)
    numPlots = length(plots)
    if (is.null(layout)) {
        layout <- matrix(seq(1, cols * ceiling(numPlots/cols)), 
            ncol = cols, nrow = ceiling(numPlots/cols))
    }
    if (numPlots == 1) {
        print(plots[[1]])
    }
    else {
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(nrow(layout), 
            ncol(layout))))
        for (i in 1:numPlots) {
            matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
            print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row, 
                layout.pos.col = matchidx$col))
        }
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
