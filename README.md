TimUtils
========

Functions that I use for miscellaneous stuff, like package building. Just a place to stash them. Actually now there's just an automatic version increment function that takes care of both DESCRIPTION file and README.md (assuming there's such a README with a badge from [badger](https://github.com/GuangchuangYu/badger) of the form: 

```
[![](https://img.shields.io/badge/devel%20version-00.00.000-yellow.svg)](https://github.com/username/package)
```
in which case the string `00.00.000` gets updated to match the DESCRIPTION field.

Installation
============


```r
# install.packages("remotes")

remotes::install_github("timriffe/TimUtils")

# then load as you would any package:
library(TimUtils)
```


