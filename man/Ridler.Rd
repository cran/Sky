\name{Ridler}
\alias{Ridler}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Analyzing canopy pictures
}
\description{
Ridler uses the Ridler and Calvard algorithm (1978) to iterativelly find the threshold for each picture in order to calculate the proportion of sky (canopy openness) in one picture. The function can also display the original picture, the gray-scale picture, and the final picture (once the threshold is applied). This function was inspired by the matlab work of Jose Suau Rodriguez.
}
\usage{
Ridler(Original, pixel, p = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Original}{
is the original picture to analyze
}
  \item{pixel}{
Indicates the number of pixel of the hemispherical picture. If not given, Ridler will use the total number of pixel detected.
}
  \item{p}{
if p==TRUE, three pictures are displayed: the original, the gray version, and the final version.
}
}
\value{
the value corresponds to the proportion of sky (canopy openness).
}
\references{
Ridler, T.W. & Calvard, S. (1978). Picture thresholding an iterative selection method. IEEE transactions on Systems, Man and Cybernetics, 8(8), 630-632.
}
\author{
Benedicte Bachelot
}
\examples{
data(Original_ex)
Ridler(Original_ex,p = TRUE) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Canopy openness}
\keyword{Ridler and Calvard algorithm}% __ONLY ONE__ keyword per line
