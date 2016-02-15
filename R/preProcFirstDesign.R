# library(couchDB)
# test <- jsonlite::fromJSON(getURL("https://hhh:sclavis@audiitory.iriscouch.com/ab21/_all_docs?include_docs=true"))
# test1 <- test$rows$doc

rm(raw.data)

getJson <- function(name, nameFile=name, sessionNumMount = "1", trainSession = as.numeric(sessionNumMount)-1,
                    tonePosX = FALSE, tonePosY = FALSE, outlier = FALSE,
                    targetToneNoRoving = NA, roving = FALSE) {
  json <- jsonlite::fromJSON(paste0("./raw_data/", nameFile, ".txt"))$rows$doc
  json$name <- name
  json$sessionNumMount <- sessionNumMount
  json$trainSession <- trainSession
  if (tonePosX!=TRUE) {
    json$tonePosX <- NA
  }
  if (tonePosY!=TRUE) {
    json$tonePosY <- NA
  }
  json$outlier <- outlier
  json$targetToneNoRoving <- targetToneNoRoving
  json$roving <- roving
  if (!exists("raw.data")) {
    assign("raw.data", json, envir = .GlobalEnv) 
  } else {
    assign("raw.data", rbind(json, raw.data), envir = .GlobalEnv) 
  }
}


# getJson(name="sa20", roving=TRUE, tonePosX=TRUE, tonePosY=TRUE)
# getJson(name="ab22", roving=TRUE, tonePosX=TRUE, tonePosY=TRUE)
getJson(name="dd04", roving=TRUE)
# getJson(name="ap08", roving=TRUE)
# getJson(name="shr28", roving=TRUE)
# getJson(name="hj12", roving=TRUE)
getJson(name="ll07", nameFile="ll07_proc", roving=TRUE)
getJson(name="ab21", roving=TRUE, outlier=TRUE)
# getJson(name="jc08", roving=TRUE)
getJson(name="gw25", roving=TRUE)
getJson(name="mn15", roving=TRUE)
getJson(name="el20", roving=TRUE, outlier=TRUE)
# getJson(name="jd12", roving=TRUE)
# getJson(name="hp02", roving=TRUE)
getJson(name="ss28", roving=TRUE)
getJson(name="lj01", nameFile="lj01_proc", roving=TRUE)

getJson(name="va01", roving=TRUE, outlier=TRUE)
getJson(name="va01", nameFile="va01_2", sessionNumMount="2", roving=TRUE)
getJson(name="va01", nameFile="va01_3", sessionNumMount="3", roving=TRUE)
getJson(name="va01", nameFile="va01_4", sessionNumMount="4", roving=TRUE)
getJson(name="va01", nameFile="va01_5", sessionNumMount="5", roving=TRUE)

getJson(name="df22", roving=TRUE, outlier=TRUE)
getJson(name="df22", nameFile="df22_2", sessionNumMount="2", roving=TRUE)
getJson(name="df22", nameFile="df22_3", sessionNumMount="3", roving=TRUE)
getJson(name="df22", nameFile="df22_4", sessionNumMount="4", roving=TRUE)
getJson(name="df22", nameFile="df22_5", sessionNumMount="5", roving=TRUE)

########## Second longitudinal study ##########
getJson(name="dp02", roving=TRUE, outlier=TRUE)
getJson(name="dp02", nameFile="dp02_1", sessionNumMount="2", roving=TRUE)
getJson(name="dp02", nameFile="dp02_2", sessionNumMount="3", roving=TRUE)
getJson(name="dp02", nameFile="dp02_3", sessionNumMount="4", roving=TRUE)
getJson(name="dp02", nameFile="dp02_4", sessionNumMount="5", roving=TRUE)

getJson(name="el17", roving=TRUE)
getJson(name="el17", nameFile="el17_1", sessionNumMount="2", roving=TRUE)
getJson(name="el17", nameFile="el17_2", sessionNumMount="3", roving=TRUE)
getJson(name="el17", nameFile="el17_3", sessionNumMount="4", roving=TRUE)
getJson(name="el17", nameFile="el17_4", sessionNumMount="5", roving=TRUE)

getJson(name="kh13", nameFile="kh13_proc", roving=TRUE)
getJson(name="kh13", nameFile="kh13_1", sessionNumMount="2", roving=TRUE)
getJson(name="kh13", nameFile="kh13_2", sessionNumMount="3", roving=TRUE)
getJson(name="kh13", nameFile="kh13_3", sessionNumMount="4", roving=TRUE)
getJson(name="kh13", nameFile="kh13_4", sessionNumMount="5", roving=TRUE)

# getJson(name="ss10", nameFile="ss10_proc", roving=TRUE)
# getJson(name="ss10", nameFile="ss10_1", sessionNumMount="2", roving=TRUE)
# getJson(name="ss10", nameFile="ss10_2_proc", sessionNumMount="3", roving=TRUE)
# getJson(name="ss10", nameFile="ss10_3", sessionNumMount="4", roving=TRUE)
# getJson(name="ss10", nameFile="ss10_4", sessionNumMount="5", roving=TRUE)

getJson(name="vv17", roving=TRUE)
getJson(name="vv17", nameFile="vv17_1_proc", sessionNumMount="2", roving=TRUE)
getJson(name="vv17", nameFile="vv17_2_proc", sessionNumMount="3", roving=TRUE)
getJson(name="vv17", nameFile="vv17_3", sessionNumMount="4", roving=TRUE)
getJson(name="vv17", nameFile="vv17_4", sessionNumMount="5", roving=TRUE)

####### 20/01/16 No roving
getJson(name="bb17", targetToneNoRoving=979.8)
getJson(name="abh28", targetToneNoRoving=979.8)
getJson(name="ak28", targetToneNoRoving=979.8)
getJson(name="ss07", targetToneNoRoving=979.8)
getJson(name="sd19", targetToneNoRoving=979.8)
getJson(name="ab12", targetToneNoRoving=979.8, outlier=TRUE)
getJson(name="df14", targetToneNoRoving=979.8)
getJson(name="cm12", targetToneNoRoving=979.8)
getJson(name="mn17", targetToneNoRoving=979.8)
getJson(name="lg06", targetToneNoRoving=979.8)


# Change the column names
colnames(raw.data)[1] <- "id"
colnames(raw.data)[2] <- "rev"

# Remove unused rows (metaData and metaDataThresh are used to store data used in the app)
data <- raw.data[!(raw.data$id == "metaData"
                   | raw.data$id == "metaDataThresh"
                   | raw.data$id == "dummy"),]


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

# Too much session for gw25
data <- subset(data, !((grepl("threshold4", id))
                       & grepl("gw25", name)))

###### Second longitudinal study

## Remove some error trials

# Remove first dataTrials
data <- subset(data, !((grepl("^dataTrial[0-3]$", id))
                       & (grepl("dp02", name)
                          | grepl("kh13", name)
                          | grepl("vv17", name))
                       & sessionNumMount == 1))
data <- subset(data, !((grepl("^dataTrial1[3-7]$", id))
                       & grepl("ss10", name)
                       & sessionNumMount == 4))

# Remove dataTrial40 of dp02_3
data <- subset(data, !((grepl("dataTrial40", id))
                       & grepl("dp02", name)
                       & sessionNumMount == 4))


# Remove thresholds 1_1_27 to 1_1_32 created with error in PouchDB
data <- subset(data, !(data$name=="kh13"
              & (grepl("threshold1_1_2[7-9]", data$id)
                 | grepl("threshold1_1_3[0-2]", data$id))
              & sessionNumMount == 1))


# Correct sessionNum (problem with incrementation)
sessionNum <- function (name, session, sessionNumMount) {
  data$sessionNum[data$name == name
                            & grepl(paste("threshold", session, sep=''),
                                    data$id)
                            & data$sessionNumMount == sessionNumMount] <<- session
}

sessionNum("kh13", 0, 1)
sessionNum("kh13", 1, 1)
sessionNum("kh13", 2, 1)
sessionNum("kh13", 3, 1)

sessionNum("ss10", 2, 1)
sessionNum("ss10", 3, 1)

sessionNum("ss10", 2, 3)
sessionNum("ss10", 3, 3)

sessionNum("vv17", 2, 2)
sessionNum("vv17", 3, 2)
sessionNum("vv17", 2, 3)
sessionNum("vv17", 3, 3)

# Remove unused columns
data$rev <- NULL
row.names(data) <- NULL

# Merge the two time columns ('time' for trials and 'startTrial' for threshold)
data$startTime <- ifelse(is.na(data$time), data$startTrial, data$time)
data$time <- NULL
data$startTrial <- NULL

# Add duration variable in seconds
# Create function to extract the last value of each matrix (= each trial) from the CurXY
extractDur <- function(x) tail(x[,3], n=1)/1000
data$duration <- sapply(data$CurXY, extractDur)

data$duration <- as.numeric(data$duration)

# Sort the data according to time
data <- data[order(data$startTime),]

# Fix trial number
data <- ddply(data, .(name, condition, sessionNumMount),
              mutate, trialNumYAxis = 0:(length(result)-1))

####### 20/01/16 No roving

# Bad session number for bb17 in threshold because refresh page with going to 
# the frequency threshold page...
data$sessionNum[data$name=="bb17"] = gsub("3", "2",
                                          data$sessionNum[data$name=="bb17"])
data$sessionNum[data$name=="bb17"] = gsub("4", "3",
                                          data$sessionNum[data$name=="bb17"])
