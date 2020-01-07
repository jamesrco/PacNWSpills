# DEQ_ERIS_SQLfetcher.R
# Created 01-06-2020 by Jamie Collins, collins.jamie@deq.state.or.us
# Used for fetching legacy DEQ spills program data from the ERIS database. ERIS
# is obsolete, but the data still reside # on a DEQ SQL server. I created this
# script to pull data directly from the database because the existing .csv
# export file I received from DEQ HQ didn't contain complete information about
# many incidents, and it contained several duplicate entries.

library(RODBC)

# Connect to the ERIS SQL database; return table information and generate list
# of table names
DEQSQL1.con <- odbcDriverConnect('driver={SQL Server};server=DEQSQL1\\PROD;database=ERIS;trusted_connection=true')
ERIS_SQLtables <- sqlQuery(DEQSQL1.con,paste("select * from ERIS.INFORMATION_SCHEMA.TABLES;"))
odbcClose(DEQSQL1.con)

ERIS_TableNames <- as.character(ERIS_SQLtables$TABLE_NAME)

# Retrieve data; store
DEQSQL1.con <- odbcDriverConnect('driver={SQL Server};server=DEQSQL1\\PROD;database=ERIS;trusted_connection=true;')
ERIS.DB <- lapply(ERIS_TableNames[c(1:12,14:18,20:26,28)], sqlFetch, channel = DEQSQL1.con)
odbcClose(DEQSQL1.con)

# Name the elements of our result list appropriately

names(ERIS.DB) <- ERIS_TableNames[c(1:12,14:18,20:26,28)]

# Retrieve problematic tables

# For some reason, couldn't retrieve data from tables 13, 19, or 27 with this
# method. These are the "Image", "MaterialType", and "dtproperties" tables.
# Per some good advice on StackOverflow, can try retrieving these using the
# additional argument rows_at_time = 1. We don't even really need the "Image"
# table, so we'll skip that one.

ERIS_TableNames[c(13,19,27)]

DEQSQL1.con <- odbcDriverConnect('driver={SQL Server};server=DEQSQL1\\PROD;database=ERIS;trusted_connection=true;')
ERIS.DB$MaterialType <- sqlFetch(channel = DEQSQL1.con, sqtable = "MaterialType", rows_at_time = 1)
ERIS.DB$dtproperties <- sqlFetch(channel = DEQSQL1.con, sqtable = "dtproperties", rows_at_time = 1)
odbcClose(DEQSQL1.con)

# Save the database we've retrieved as an R object so we don't have to run this
# script again

save(ERIS.DB, file = "data/raw/DEQ/ERIS.DB_20200107.Rdata")