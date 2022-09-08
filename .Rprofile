cat('Loading default .Rprofile...\n')

### Do you want to automatically convert strings to factor variables in a data.frame?
### WARNING!!! This makes your code less portable/reproducible.
options(stringsAsFactors = FALSE)

## Single character shortcuts for summary() and head().
.env <- new.env()
.env$s <- base::summary
.env$h <- utils::head

### ht==headtail, i.e., show the first and last 10 items of an object
.env$ht <- function(d) rbind(head(d,10),tail(d,10))

## Show the first 5 rows and first 10 columns of a data frame or matrix
.env$hh <- function(d) if(inherits(d,"matrix")|inherits(d,"data.frame")) d[1:min(5, nrow(d)),1:min(10,ncol(d))]

### Speed up loading
utils::rc.settings(ipck=TRUE)
attach(.env)
Sys.setenv(TAR = '/usr/bin/tar')

### Start-up items
auto_loads = c(
  'data.table',
  'plyr',
  'tibble',
  'tidyverse',
  'janitor',
  'patchwork',
  'fs',
  'datapasta',
  'vroom',
  'kpjmisc'
)

options(
    defaultPackages = c(getOption('defaultPackages'), auto_loads),
    tidyverse.quiet = T,
    datatable.verbose = F
    )

like <- function(vector, pattern)
{
  # Intended for use with a data.table 'where'
  # Don't use * or % like SQL's like.  Uses regexpr syntax - more powerful.
  if (is.factor(vector)) {
    as.integer(vector) %in% grep(pattern,levels(vector))
  } else {
    # most usually character, but integer and numerics will be silently coerced by grepl
    grepl(pattern,vector)
  }
  # returns 'logical' so can be combined with other where clauses.
}

"%like%" = like

#### Negates %in%
'%nin%' = Negate('%in%')
'%lik%' = '%like%'
'%l%' = '%like%'

#### Convenience functions
lu = function(vector_in) { length(unique(vector_in ))}
len = length

# Safe header on wide objects
# h <- function(x, ...) {
#   if (ncol(x) > 30) {
#     x[1:10, 1:10]
#   } else {
#     head(x, ...)
#   }
# }

# Set ggplot theme
#theme_set(theme_bwmin)
cat('...done!\n')
# LanguageServer Setup Start (do not change this chunk)
# to remove this, run languageserversetup::remove_from_rprofile
if (requireNamespace('languageserversetup', quietly = TRUE)) {
  options(langserver_library = '/Users/PJonsson/languageserver-library')
  languageserversetup::languageserver_startup()
  unloadNamespace('languageserversetup')
}
# LanguageServer Setup End

# For radian
options(radian.color_scheme = "colorful")
options(radian.auto_match = TRUE)
options(radian.highlight_matching_bracket = TRUE)
