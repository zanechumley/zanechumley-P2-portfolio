# Troubleshooting file for tidy tuesday

# This section manually goes through the ZCTT.checkit function to debug it.

# Function ZCTT.checkit removes columns from a passed matrix that is missing a pre-selected amount of data.  
# Before-and-after information about the passed matrix is displayed.
# Display brief overview of passed matrix
ZCTT.checkthis <- ZCTT.auditions
str(ZCTT.checkthis)
# arbitrarily deciding columns missing information in more than 20% of rows should be discarded
ZCTT.cutoff <- 0.2
ZCTT.checkrows <- nrow(ZCTT.checkthis)
ZCTT.threshold <- ZCTT.cutoff*ZCTT.checkrows
# Remove columns exceeding threshold of missing data 
ZCTT.keepthis <- ZCTT.checkthis
ZCTT.checkcols <- ncol(ZCTT.checkthis)
for (ZCTT.thiscolumn in 1:ZCTT.checkcols) {
  ZCTT.NAs <- sum(is.na(ZCTT.checkthis[[ZCTT.thiscolumn]]))
  if (ZCTT.NAs > ZCTT.threshold) {
    ZCTT.keepthis <- ZCTT.keepthis[,-ZCTT.thiscolumn]
  } 
}
# Display brief overview of returned matrix
str(ZCTT.keepthis)
