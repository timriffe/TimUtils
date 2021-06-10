#' @title increment package version number for a given patch or update.
#' 
#' @description Increment the version number, and update the DESCRIPTION and README.md files accordingly.
#' @details Note higher order version increments reset the counter to lower order version increments. So, \code{major = TRUE} sets the middle and final version numbers to 0s. The default version digit structure follows this format: \code{"00.00.000"}, but you can alter the field widths using the \code{maxdigits} argument. The README badge assumes that you have a line of the form: \code{[![](https://img.shields.io/badge/devel%20version-0.6.113-yellow.svg)](https://github.com/timriffe/DemoTools)} in your README (as produced by the badger package). The version number just gets swapped out in that case. If you don't have a README, or if the README doesn't already containt such a badge, then it's ignored.
#' 
#' @param wd file path to package folder, ending in package name.
#' @param major logical. Shall we increment the major version number? Default FALSE
#' @param mid logical. Shall we increment the middle version number? Default FALSE
#' @param minor logical. Shall we increment the minor version number? Default TRUE
#' @param maxdigits integer vector of length 3, default \code{c(2,2,3)}.
#' @param README logical. Update the development version badge in the README, see details. Default TRUE.
#' 
#' @return nothing is returned. Package called for the side effect of modifying the date and version elements of the \code{DESCRIPTION} file and possibly the \code{README.md} file.
#' 
#' @export
#' 
versionIncrement <- function(wd = getwd(), 
                             major=FALSE,
                             mid=FALSE,
                             minor=TRUE,
                             maxdigits=c(2,2,3),
		README = TRUE){
	dpath <- file.path(wd,"DESCRIPTION")
	rpath <- file.path(wd,"README.md")
	# scrape present version
	DESCRIPTION <- readLines(dpath)
	
	vLine  <- grepl(pattern = "Version: ",DESCRIPTION)
	dLine  <- grepl(pattern = "Date: ",DESCRIPTION)
	VLINE  <- DESCRIPTION[vLine]
	Vin    <- gsub(VLINE, pattern = "Version: ", replacement = "")
	Vparts <- strsplit(Vin,split="\\.")[[1]]
	
	if (minor){
		regstr      <- paste0("%0",maxdigits[2],"d")
		Vparts[3] <- sprintf(regstr, as.integer(Vparts[3]) + 1)
	}
	if (mid){
		Vparts[3] <- paste0(rep("0", maxdigits[3]), collapse = "")
		regstr      <- paste0("%0",maxdigits[2],"d")
		Vparts[2] <- sprintf(regstr, as.integer(Vparts[2]) + 1)
	}
	if (major){
		Vparts[2] <- paste0(rep("0", maxdigits[2]), collapse = "")
		Vparts[3] <- paste0(rep("0", maxdigits[3]), collapse = "")
		regstr      <- paste0("%0",maxdigits[1],"d")
		Vparts[1] <- sprintf(regstr, as.integer(Vparts[1]) + 1)
	}
	
	# get new version string
	vNew     <- paste(unlist(Vparts),collapse = ".")
	vLINEnew <- paste0("Version: ", vNew)
	DESCRIPTION[vLine] <- vLINEnew
	
	# also increment date
	DESCRIPTION[dLine] <- paste0("Date: ",Sys.Date())
	
	# write new description:
	writeLines(DESCRIPTION,dpath)
	
	if (README){
		# update README badge:
		README     <- readLines("README.md")
		badgei     <- grepl("devel%20version",README)
		dLine      <- grepl(pattern = "Date: ",README)
		if (any(dLine)){
			README[dLine] <- paste0("Date: ",Sys.Date())
		}
		if (sum(badgei) == 1){
			badgenow   <- README[badgei]
			badgeparts <- strsplit(badgenow,split = "-")
			badgeparts[[1]][2] <- vNew
			badegeout  <- paste0(unlist(badgeparts),collapse = "-")
			# insert
			README[badgei] <- badegeout
			
			# write new description:
			writeLines(README,"README.md")
		}
	}
}
