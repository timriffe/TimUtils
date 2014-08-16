TimUtils
========

Functions that I use for miscellaneous stuff, like package building. Just a place to stash them

Installation
============

To download the development version of TimUtils:

Download the [zip ball](https://github.com/timriffe/TimUtils/zipball/master) or [tar ball](https://github.com/timriffe/TimUtils/tarball/master), decompress and run `R CMD INSTALL` on it in the terminal command line, or use the **devtools** package to install the development version:

```r
# install.packages("devtools")

library(devtools)
install_github("timriffe/TimUtils", subdir = "TimUtils")

# then load as you would any package:
library(TimUtils)
```

**Note**: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.

**Note**: Mac users might be required to install the appropriate version [XTools](https://developer.apple.com/xcode/) from the [Apple Developer site](https://developer.apple.com/) in order to install the development version.  You may need to [register as an Apple developer](https://developer.apple.com/programs/register/).  An older version of XTools may also be required.

