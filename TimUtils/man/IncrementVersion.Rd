\name{IncrementVersion}
\alias{IncrementVersion}
\title{increment package version minor number for a given patch or update.}
\usage{
  IncrementVersion(package.path, major.version = "01",
    package.origin = "2011-01-01")
}
\arguments{
  \item{package.path}{file path to package folder, ending
  in package name.}

  \item{major.version}{major version number. Change this
  manually only when there is a major change}

  \item{package.origin}{the package birth date, used to
  infer package age, which determines the minor number. If
  you want the minor number to reset to 0 when a major
  version increment happens, then change this date when you
  make a major increment. It's also OK to just leave it
  referenced to the primary package birth date.}
}
\value{
  nothing is returned. Package called for the side effect
  of modifying the date and version elements of the
  \code{DESCRIPTION} file.
}
\description{
  This function should allow for more regular minor version
  number increments. Previously this was done manually and
  so usually forgotten. Include a call to this in the build
  script for each package.
}

