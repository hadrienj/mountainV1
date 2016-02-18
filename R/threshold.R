# Analyses from the "data" data frame
# Output data frame:
#    - data.threshold (all data concerning the frequency threshold task)
#    - thresholdsAllLong (thresh for each participant and condition)
#    - meanThresholdLong (mean thresh among participants for each condition)
#    - deltaFMeansLong (mean deltaF for each trial number)
#    - meanThresholdsSubjLong (mean threshold for each subj and each condition)
#    - thresholdAllPrepostLong (mean threshold pre and post for each
# participant and condition)



data.threshold <- subset(data, grepl("threshold", id) & sessionNumMount==1,
                         c(id, trialNum,sessionNum,sessionThreshNum,
                           reversal,  reversals,  task,  startTime,
                           tone1, tone2,	tone3, tone4, deltaF,
                           goodAnswer,	roving,	answer,	score, name,
                           trainSession, outlier))

############ THRESHOLD ANALYSES ############

# Calculate the frequency threshold of all participants and each session from deltaF
# The threshold is calculated with the mean of reversals
# The four first reversals are not taken into account in the mean
# trainsession == 0 is used to avoid to take data from longitudinal part
thresholdsAllLong <- aggregate(deltaF ~ name + sessionNum + task + roving + outlier,
                               FUN=mean,
                               data=subset(data.threshold, data.threshold$reversals > 4
                                           & data.threshold$reversal==TRUE
                                           & data.threshold$trainSession==0),
                               na.rm=T)

colnames(thresholdsAllLong)[2] <- "session"
colnames(thresholdsAllLong)[3] <- "condition"
colnames(thresholdsAllLong)[4] <- "roving"
colnames(thresholdsAllLong)[5] <- "outlier"
colnames(thresholdsAllLong)[6] <- "threshold"
thresholdsAllLong$session <- sapply(thresholdsAllLong$session,
                                    FUN = function(x) as.numeric(x) + 1)

# Assign pre or post value in function of session
thresholdsAllLong$prePost <- ifelse(thresholdsAllLong$session == 1 |
                                      thresholdsAllLong$session == 2,
                                    "Pre-test",
                                    "Post-test")
# Create a new data frame with the mean threshold by pre and post test
thresholdAllPrepostLong <- aggregate(threshold ~ name + prePost + condition
                                     + outlier + roving,
                                     FUN=mean,
                                     data=thresholdsAllLong,
                                     na.rm=T)
thresholdAllPrepostLong$prePost <- factor(thresholdAllPrepostLong$prePost,
                                          c("Pre-test", "Post-test"))
thresholdAllPrepostLong$outlier <- factor(thresholdAllPrepostLong$outlier,
                                          c("TRUE", "FALSE"))

# Assign value in function of position in the session (first is 1 and 3,
# second is 2 and 4)
thresholdsAllLong$prepre <- ifelse(thresholdsAllLong$session == 1 |
                                     thresholdsAllLong$session == 3,
                                   "first",
                                   "second")
# Create a new data frame with the mean threshold by first and second sessions
thresholdAllPrepreLong <- aggregate(threshold ~ name + prepre + condition,
                                     FUN=mean,
                                     data=thresholdsAllLong,
                                     na.rm=T)

# Create a new data frame with the mean threshold for roving and no roving
thresholdAllRovLong <- aggregate(threshold ~ name + roving + condition + outlier,
                                    FUN=mean,
                                    data=thresholdsAllLong,
                                    na.rm=T)

# Calculate the mean threshold for each session and each condition
meanThresholdLong <- aggregate(threshold ~ session + condition + roving,
                               FUN=function(x) c(mean=mean(x),
                                                 sem=sd(x)/sqrt(length(
                                                   levels(factor(thresholdsAllLong$name))))),
                               data=thresholdsAllLong)
meanThresholdLong <- do.call(data.frame, meanThresholdLong)
# Calculate the mean threshold for each participant and each condition
meanThresholdsSubjLong <- aggregate(threshold ~ name + condition + roving + outlier,
                               FUN=mean,
                               data=thresholdsAllLong,
                               na.rm=T)

# Factorize the `outlier` variable and set level's order
meanThresholdsSubjLong$outlier <- factor(meanThresholdsSubjLong$outlier,
                                         c("TRUE", "FALSE"))

# Calculate the progression in percent of the first session to avoid the
# high thresholds have more weight on the evolution of the mean
thresholdsAllPercentLong <- aggregate(threshold ~ name + condition,
                  FUN=function(i) {i/i[1]},
                  data=thresholdsAllLong)
thresholdsAllPercentLong <- do.call(data.frame, thresholdsAllPercentLong)
colnames(thresholdsAllPercentLong)[3:6] <- c(1, 2, 3, 4)
thresholdsAllPercentLong <- melt(thresholdsAllPercentLong,
             variable.name = "session", 
             value.name = "threshold")


# Calculate the mean threshold for each session
meanThresholdsPercent <- data.frame(session = as.numeric(
  levels(factor(thresholdsAllPercentLong$session))),
  tapply(thresholdsAllPercentLong$threshold,
         list(thresholdsAllPercentLong$session,
              thresholdsAllPercentLong$condition),
         mean))
# Reshape the data frame into long format
meanThresholdPercentLong <- melt(meanThresholdsPercent, id.var="session",
                          variable.name = "condition", 
                          value.name = "threshold")

# Create variable for roving and no roving conditions
thresholdsAllLongRov <- subset(thresholdsAllLong, roving == TRUE)
thresholdsAllLongNoRov <- subset(thresholdsAllLong, roving == FALSE)

# Calculate the mean threshold for each session and each condition
meanThresholdLongRov <- aggregate(threshold ~ session + condition + roving,
                               FUN=function(x) c(mean=mean(x),
                                                 sem=sd(x)/sqrt(length(
                                                   levels(factor(thresholdsAllLongRov$name))))),
                               data=thresholdsAllLongRov)
meanThresholdLongRov <- do.call(data.frame, meanThresholdLongRov)

# Calculate the mean threshold for each session and each condition
meanThresholdLongNoRov <- aggregate(threshold ~ session + condition + roving,
                               FUN=function(x) c(mean=mean(x),
                                                 sem=sd(x)/sqrt(length(
                                                   levels(factor(thresholdsAllLongNoRov$name))))),
                               data=thresholdsAllLongNoRov)
meanThresholdLongNoRov <- do.call(data.frame, meanThresholdLongNoRov)

######### ACCURACY WITH THRESHOLD MEANS
meanThresholdsLong <- data.frame(condition=
                                   levels(factor(meanThresholdsSubjLong$condition)),
                                 mean=
                                   tapply(meanThresholdsSubjLong$threshold,
                                          list(meanThresholdsSubjLong$condition,
                                            meanThresholdsSubjLong$roving),
                                          mean))
row.names(meanThresholdsLong) <- NULL
colnames(meanThresholdsLong)[2] <- "FALSE"
colnames(meanThresholdsLong)[3] <- "TRUE"

meanThresholdsLong <- melt(meanThresholdsLong, variable.name="roving")
colnames(meanThresholdsLong)[3] <- "mean"

############ DELTAF ANALYSES ############

# Compute the mean of deltaF between subjects
deltaFMeansLong <- aggregate(deltaF ~ trialNum + sessionNum + task,
                             data=data.threshold,
                             mean)
