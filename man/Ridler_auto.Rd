\name{Ridler_auto}
\alias{Ridler_auto}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Automatically analyzing canopy openness
}
\description{
Ridler_auto uses the Ridler and Calvard algorithm (1978) to iterativelly find the threshold for each picture in order to calculate the proportion of sky (canopy openness) in multiple pictures at time.
}
\usage{
Ridler_auto(path1, path2 = TRUE, write = TRUE, pixel)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path1}{
corresponds to the path to the picture folders.
}
  \item{path2}{
if TRUE it indicates that there are sub-folder within path1, for example different year folders. Then the alogrithm will look within these folders to analyze the pictures.
}
  \item{write}{
if TRUE, the function will write the result file as a .csv in path1.
}
  \item{pixel}{
Indicates the number of pixel of the hemispherical picture. If not given, Ridler_auto will use the total number of pixel detected.
}
}
\value{
if path2==FALSE, the value is a dataframe with two columns. The first one, "Name", corresponds to the name of each picture. The second one, "Sky", is the proportion of sky pixels corresponding to each picture.
If path2==TRUE, the value is a list containing one dataframe (similar to the one previously described) for each picture sub-folder. The names of the list correspond to the names of the sub-folders.
}
\references{
Ridler, T.W. & Calvard, S. (1978). Picture thresholding an iterative selection method. IEEE transactions on Systems, Man and Cybernetics, 8(8), 630-632.
}
\author{
Benedicte Bachelot
}
\examples{

## The function is currently defined as
function (path1, path2 = TRUE, write = TRUE, pixel) 
{
    R <- list()
    setwd(path1)
    ll <- list.files(path = path1)
    for (j in 1:length(ll)) {
        if (path2 == TRUE) {
            file <- ll[j]
            l <- list.files(path = file)
            eval(parse(text = paste("setwd('", path1, "/", file, 
                "')", sep = "")))
        }
        if (path2 == FALSE) {
            l <- ll
        }
        Result <- matrix(data = NA, nrow = length(l), ncol = 2)
        for (k in 1:length(l)) {
            r <- Ridler(readImage(l[k]), pixel, p = FALSE)
            Result[k, 1] <- l[k]
            Result[k, 2] <- r
        }
        setwd(path1)
        Result <- data.frame(Result)
        Result[, 1] <- as.character(Result[, 1])
        Result[, 2] <- as.numeric(as.character(Result[, 2]))
        colnames(Result) <- c("Name", "Sky")
        R[[j]] <- Result
        if (write == TRUE & path2 == TRUE) {
            eval(parse(text = paste("write.csv(Result,'Result_", 
                file, ".csv')", sep = "")))
            names(R)[j] <- file
        }
        if (write == FALSE & path2 == TRUE) {
            names(R)[j] <- file
        }
        if (write == TRUE & path2 == FALSE) {
            write.csv(R[[1]], "Result.csv")
        }
    }
    if (path2 == TRUE) {
        return(R)
    }
    if (path2 == FALSE) {
        return(R[[1]])
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Canopy openness}
\keyword{Ridler and Calvard algorithm}
\keyword{automatic}
