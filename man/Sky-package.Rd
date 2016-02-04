\name{Sky-package}
\alias{Sky-package}
\alias{Sky}
\docType{package}
\title{
Canopy Openness Analyzer
~~ Sky ~~
}
\description{
Provides an alternative to manually process hemispherical pictures in order to evaluate the amount of light reaching the understory. The algorithm processes each picture one by one to determine the proportion of sky pixels (canopy openness). The algorithm uses the Ridler and Calvard method (Ridler and Calvard 1978) and was inspired by the matlab work of Jose Suau Rodriguez.
}
\details{
\tabular{ll}{
Package: \tab Sky\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2016-02-01\cr
License: \tab GPL (>=2)\cr
}
This package should be used to process hemispherical canopy pictures in order to evaluate the amount of light reaching the understory. Pictures can be analyzed one by one, using the Ridler function, or automatically using the Ridler_auto function. At the moment, only one algorithm is offered to assess the proportion of sky pixels, using the function Ridler (Ridler and Calvard 1978). In the future, other alternative algorithmes will be incorporated. This package is ideal to quickly process many canopy pictures and get a good estimate of the amount of direct light reaching the understory. As a result, it is a useful tool for plant community ecologists, plant physiologists, and teachers that are investigating the effects of light on various processes.

Ridler function enables the user to process one picture and visualize the result (this can be useful to tune up the algorithm).

Ridler_auto function enables to automatically process all the pictures from picture folders. It also allows the user to have sub-folders such that pictures are analyzed in an organized fashion. For example, if you want to analyze pictures by years, organize the pictures within year folders (EX: 2000, 2001, 2002). Ridler_auto will then analyze the pictures year after year. 

}
\author{
Benedicte Bachelot

Maintainer: Benedicte Bachelot <bmb43@duke.edu>

}
\references{
Ridler, T.W. & Calvard, S. (1978). Picture thresholding an iterative selection method. IEEE transactions on Systems, Man and Cybernetics, 8(8), 630-632.
}
\keyword{ package }
\examples{
data(Original_ex)
Ridler(Original_ex,p=FALSE)
}
