\name{rtlu}
\alias{rtlu}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{~ Function: R to LaTeX, Univariate analysis ~}
\description{
  \code{rtlu} performs some basic analyses, then generates a
  code to be included in a LaTeX document to print the analyses in a (so
  nice!) LaTeX way.
}

\usage{
  rtlu(data,fileOutput="",textBefore="",textAfter="",graphDir="graphUniv",graphName="V",type="png",limDiscrete=10)
}

\arguments{
  \item{data}{\code{[data.frame]} or a \code{[vector]} : containt the
    data to analyse.}

  \item{fileOutput}{\code{[character]};
    name of the output file in which
    the LaTeX summary will be saved. If empty, the LaTeX code is printed on screen.}

  \item{textBefore}{\code{[character] or [vector(character)]} : before
    printing a variable analysis, \code{rtlu} can write a
    text. If \code{rtlu} is apply on a single variable,
    \code{textBefore} should be of lenght 1. If \code{rtlu} is apply on a data.frame,
    \code{textBefore} can have the lenght of the data.frame (this let
    the user to write a specific introduction for each variable), or can be
    of length 1. In this case, it is print before each variable
    analysis. See examples for detail.}

  \item{textAfter}{\code{[character] or [vector(character)]} : after
    printing a variable analysis, \code{rtlu} can write a
    text. If \code{rtlu} is apply on a single variable,
    \code{textAfter} should be of lenght 1. If \code{rtlu} is apply on a \code{data.frame},
    \code{textAfter} can have the lenght of the data.frame (this let
    the user to write a specific conclusion for each variable), or can be
    of length 1. In this case, it is print after each variable
    analysis. See examples for detail.}

  \item{graphDir}{\code{[character]} :
    directory used to save the graph generated by the analyses.}

  \item{graphName}{\code{[character]} or \code{[vector(character)]} :
    prefix of the graphs' names. If empty, the graphs' name are
    \code{V1} to \code{V length(data.frame)}}

  \item{type}{\code{[character]} : type of plot used to export the
          graphics. Can be Windows metafile, PNG, JPEG, BMP (Windows bitmap format), TIFF,
          PostScript or PDF. See \link[grDevices]{savePlot} for details.}

  \item{limDiscrete}{\code{rtlu} distinghues two kind of \code{numeric} :
    \code{discrete} are \code{numeric} variable with only few
    modalities,  \code{continuous} are \code{numeric} variable with many
    modalities. The limit between 'few' and 'many' can be fixed by the
    user through the argument \code{limDiscrete}. By setting
    \code{limDiscrete} to 5, the user will ask \code{rtlu} to consider
    all the \code{numeric} variable with more than 5 modalities as
    \code{continuous} and all the variable with less than 5 modalities
    as \code{discrete}.

    The default value for \code{limDiscrete} is 10.}
}

\details{
  \code{rtlu} performs some basic analyses, then generates a
  code to be included in a LaTeX document to print the analyses in a (so
  nice!) LaTeX way.

  \code{rtlu} performs the analyses automatically according to the
  \code{data} class. It considers 4 classes. The analysis of the
  variable depend of the class:
  \enumerate{
    \item factor, character and logical: Frequency ; Graph: barplot
    \item ordered: Frequency, quartile ; Graph: barplot
    \item numeric discrete: Frequency, mean, variance, quartile ; Graph: boxplot and barplot
    \item numeric continuous: Mean, variance, quartile ; Graph: boxplot and
    histogram.
  }

  On a \code{data.frame}, \code{rtlu} runs the analyses on every column.
}

\value{
  \code{rtlu} generates a LaTeX code and either prints it on screen or saves it in a
  file. It also generates several encapsulated postscript graphs, optionally
  in a different directory.
}

\section{Classical usage}{
  The use of \code{rtlu} goes through the following steps:
  \tabular{ll}{
    Step 1. \tab Load the data (usually, a \code{data.frame}).\cr
    Step 2. \tab Optionally, set some variables as \code{ordered}. \cr
    Step 3. \tab Run \code{rtlu(dataFrame,"fileOut.tex")}.\cr
  }
  See examples an application.
}

\section{R to LaTeX, Bivariate Analyses}{
  \emph{r2lBiv} (R to LaTeX, Bivariate Analyses) is under construction. Any
  help will be welcomed!
}

\section{Author}{
  Christophe Genolini \cr
  \email{christophe.genolini@free.fr}\cr
  PSIGIAM: Paris Sud Innovation Group in Adolescent Mental Health \cr
  INSERM U669 / Maison de Solenn / Paris
}

\section{English correction}{
  Jean-Marc Chamot \cr
  \email{jchamot@u-paris10.fr}\cr
  Laboratoire "Sport & Culture" / "Sports & Culture" Laboratory \cr
  University of Paris 10 / Nanterre
}


\references{LaTeX web site \url{http://www.latex-project.org/}\cr
Data are available on line: \url{http://christophe.genolini.free.fr/EPO/EPO2007-Fraude.php}}



\seealso{
  \code{\link{r2lUniv-package}},
  \code{\link{rtluMainFile}},
  \code{\link{examCheating}},
  \code{\link{Sweave}},
  \code{\link[Hmisc]{latex}}
}

\examples{
 # # # # # # # # # # # # # # # # # # #
#   R to LaTeX, Univariate Analyses   #
 #             Examples              #
  #       rtlu single variable      #
   # # # # # # # # # # # # # # # # #

########################
###### Step 1: Create the data
par(ask=FALSE)
V1 <- factor(LETTERS[floor(runif(50,1,4))])
V2 <- rnorm(50,1,1)<0
V3 <- ordered(LETTERS[floor(runif(50,1,4))])


########################
###### Step 2: ordering variable
# nothing to do


########################
###### Step 3: running r2lu

### The following code will create some files.
### So we first move in a directories.

if(!file.exists("exampleSingle")){dir.create("exampleSingle")}else{}
setwd("exampleSingle")
try(rtlu(V1,fileOutput="first.tex",textBefore="\\section{Variable 1 to 3}",graphName="V1"))
try(rtlu(V2,fileOut="second.tex",graphName="V2"))
try(rtlu(V3,fileOut="third.tex",textBefore="This is variable 3",graphDir="P"))
rtluMainFile(text="\\input{first.tex}\n\\input{second.tex}\n\\input{third.tex}")
setwd("..")




 # # # # # # # # # # # # # # # # # # #
#   R to LaTeX, Univariate Analyses   #
 #          Real examples            #
  #        rtlu data.frame          #
   # # # # # # # # # # # # # # # # #

########################
###### Step 1: Create the data

data(examCheating)
str(examCheating)

########################
###### Step 2: ordering variable

examCheating$YearOfStudy <- ordered(examCheating$YearOfStudy,levels=c("L1","L2","L3","M1","M2"))
examCheating$Bac <- ordered(examCheating$Bac,levels=c("Remedial exam","Pass","Fairly good","Good","Very good","Summa cum laude"))
for(iColumn in 8:17){
    examCheating[,iColumn] <- ordered(examCheating[,iColumn],levels=c("Never","Rarely","Sometimes","Often","Always"))
}
str(examCheating)


########################
###### Step 3: running r2lu

### The following code will create some files.
### So we first move in a directories.

if(!file.exists("exampleReal")){dir.create("exampleReal")}else{}
setwd("exampleReal")

### Then we prepare the textBefore, for transition between variable

textBefore <- paste("\\subsection{",names(examCheating)[c(2:5,18:20)],"}",sep="")

text <- "\\tableofcontents
\\section{Survey}
  \\begin{enumerate}
    \\item What is your age?
    \\item What is your gender?
    \\item What is your level?
    \\item What is your field?
    \\item Did you cheat at Bac?
    \\item Did you cheat high scool?
    \\item Cheating score
  \\end{enumerate}
\\section{Univariate analysis}
  \\input{ExamCheat-univ.tex}

\\section{More information?}
For a detailled analysis, see
http://christophe.genolini.free.fr/EPO/2007 Fraude/EPO2007-Fraude-Rapport.pdf"

### We can run r2lu
try(rtlu(examCheating[,c(2:5,18:20)],fileOutput="ExamCheat-univ.tex",textBefore=textBefore))
rtluMainFile("ExamCheat-main.tex",text=text)
setwd("..")

### Then compile main.tex twice. It is ready !
}

\keyword{print}        % Printing
\keyword{classes}      % Data type
\keyword{programming}  % Programming
\keyword{interface}    % interface to other languages
\keyword{utilities}    % Utilities
\keyword{univar}       % Simple univariate statistics




