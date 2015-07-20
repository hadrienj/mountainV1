library("rjson")

# Import Json file
json.file.sa20 <- "./raw_data/sa20.txt"
json.data.sa20 <- jsonlite::fromJSON(json.file.sa20)
# Put data in a data frame
raw.data.sa20 <- json.data.sa20$rows$doc
raw.data.sa20$name <-"sa20"

# Import Json file
json.file.ab22 <- "./raw_data/ab22.txt"
json.data.ab22 <- jsonlite::fromJSON(json.file.ab22)
# Put data in a data frame
raw.data.ab22 <- json.data.ab22$rows$doc
raw.data.ab22$name <-"ab22"

# Import Json file
json.file.dd04 <- "./raw_data/dd04.txt"
json.data.dd04 <- jsonlite::fromJSON(json.file.dd04)
# Put data in a data frame
raw.data.dd04 <- json.data.dd04$rows$doc
raw.data.dd04$name <-"dd04"
raw.data.dd04$tonePosX <- NA
raw.data.dd04$tonePosY <- NA

# Import Json file
json.file.ap08 <- "./raw_data/ap08.txt"
json.data.ap08 <- jsonlite::fromJSON(json.file.ap08)
# Put data in a data frame
raw.data.ap08 <- json.data.ap08$rows$doc
raw.data.ap08$name <-"ap08"
raw.data.ap08$tonePosX <- NA
raw.data.ap08$tonePosY <- NA

# Import Json file
json.file.shr28 <- "./raw_data/shr28.txt"
json.data.shr28 <- jsonlite::fromJSON(json.file.shr28)
# Put data in a data frame
raw.data.shr28 <- json.data.shr28$rows$doc
raw.data.shr28$name <-"shr28"
raw.data.shr28$tonePosX <- NA
raw.data.shr28$tonePosY <- NA

# Import Json file
json.file.hj12 <- "./raw_data/hj12.txt"
json.data.hj12 <- jsonlite::fromJSON(json.file.hj12)
# Put data in a data frame
raw.data.hj12 <- json.data.hj12$rows$doc
raw.data.hj12$name <-"hj12"
raw.data.hj12$tonePosX <- NA
raw.data.hj12$tonePosY <- NA

# Import Json file
json.file.ll07_proc <- "./raw_data/ll07_proc.txt"
json.data.ll07_proc <- jsonlite::fromJSON(json.file.ll07_proc)
# Put data in a data frame
raw.data.ll07_proc <- json.data.ll07_proc$rows$doc
raw.data.ll07_proc$name <-"ll07"
raw.data.ll07_proc$tonePosX <- NA
raw.data.ll07_proc$tonePosY <- NA

# Import Json file
json.file.va01 <- "./raw_data/va01.txt"
json.data.va01 <- jsonlite::fromJSON(json.file.va01)
# Put data in a data frame
raw.data.va01 <- json.data.va01$rows$doc
raw.data.va01$name <-"va01"
raw.data.va01$tonePosX <- NA
raw.data.va01$tonePosY <- NA

# Import Json file
json.file.df22 <- "./raw_data/df22.txt"
json.data.df22 <- jsonlite::fromJSON(json.file.df22)
# Put data in a data frame
raw.data.df22 <- json.data.df22$rows$doc
raw.data.df22$name <-"df22"
raw.data.df22$tonePosX <- NA
raw.data.df22$tonePosY <- NA

raw.data <- rbind(raw.data.sa20, raw.data.ab22, raw.data.dd04, raw.data.ap08,
                  raw.data.shr28, raw.data.hj12, raw.data.ll07_proc, raw.data.va01,
                  raw.data.df22)

# Change the column names
colnames(raw.data)[1] <- "id"
colnames(raw.data)[2] <- "rev"

# Remove unused rows (metaData and metaDataThresh are used to store data used in the app)
data <- raw.data[!(raw.data$id == "metaData"
                   | raw.data$id == "metaDataThresh"
                   | raw.data$id == "dummy"),]

# Sort the data according to time
data <- data[order(data$startTrial),]


# Forwarding reversal values to correct bug in the data collect for the subject sa20 and ab22
for (i in 0:length(data$reversal[data$name=="sa20" | data$name=="ab22"])) {
  data$reversal[
    data$name=="sa20" | data$name=="ab22"][i]=data$reversal[
      data$name=="sa20" | data$name=="ab22"][i+1]
}
for (i in 0:length(data$reversal[data$name=="sa20" | data$name=="ab22"])) {
  data$reversals[
    data$name=="sa20" | data$name=="ab22"][i]=data$reversals[
      data$name=="sa20" | data$name=="ab22"][i+1]
}

# Too much trials in the threshold task before training: sessions 0, 1, 2, 3 are before.
# Remove the session 2 and 3 and convert name of sessions 4 and 5 by 2 and 3 respectively
data <- subset(data, !((grepl("threshold2", id)
                        | grepl("threshold3", id))
                       & grepl("shr28", name)))
data$id[data$name=="shr28"] = gsub("threshold4", "threshold2",
                                   data$id[data$name=="shr28"])
data$id[data$name=="shr28"] = gsub("threshold5", "threshold3",
                                   data$id[data$name=="shr28"])
# Also in sessionNum
data$sessionNum[data$name=="shr28"] = gsub("4", "2",
                                           data$sessionNum[data$name=="shr28"])
data$sessionNum[data$name=="shr28"] = gsub("5", "3",
                                           data$sessionNum[data$name=="shr28"])

# No session 0 for ap08 and first session post-test with bug so remove it
data <- subset(data, !(grepl("threshold3", id)
                       & grepl("ap08", name)))

data$id[data$name=="ap08"] = gsub("threshold1", "threshold0",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold2", "threshold1",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold4", "threshold2",
                                  data$id[data$name=="ap08"])
data$id[data$name=="ap08"] = gsub("threshold5", "threshold3",
                                  data$id[data$name=="ap08"])
# Also in sessionNum
data$sessionNum[data$name=="ap08"] = gsub("1", "0",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("2", "1",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("4", "2",
                                          data$sessionNum[data$name=="ap08"])
data$sessionNum[data$name=="ap08"] = gsub("5", "3",
                                          data$sessionNum[data$name=="ap08"])

# Bad session number for ll07 because of re-start of the app
# in the middle of the experiment (names corrected with couchdb)
data$sessionNum[data$name=="ll07"
                & grepl("threshold2",
                        data$id)] = gsub("0", "2",
                                         data$sessionNum[data$name=="ll07"
                                                         & grepl("threshold2",
                                                                 data$id)])
data$sessionNum[data$name=="ll07"] = gsub("4", "3",
                                          data$sessionNum[data$name=="ll07"])


# Remove unused columns
data$rev <- NULL
row.names(data) <- NULL

# Add duration variable in seconds
# Create function to extract the last value of each matrix (= each trial) from the CurXY
extractDur <- function(x) tail(x[,3], n=1)/1000
data$duration <- sapply(data$CurXY, extractDur)

data$duration <- as.numeric(data$duration)

