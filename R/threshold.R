# Analyses from the "data" data frame
# Output data frame:
#    - data.threshold (all data concerning the frequency threshold task)
#    - thresholdsAllLong (thresh for each participant and condition)
#    - meanThresholdLong (mean thresh among participants for each condition)
#    - deltaFMeansLong (mean deltaF for each trial number)
#    - meanThresholdsSubjLong (mean threshold for each subj and each condition)
#
# Output plots:
#    - plotThresholds (thresh for each subject, condition and session)
#    - plotMeanThresholds (mean thresh for each condition and session)
#    - plotDetById (identification against detection thresh for each subject)
#    - plotDeltaF (deltaF against trials for each subject)
#    - plotDeltaFMeans (mean deltaF against trials)


data.threshold <- subset(data, grepl("threshold", id),
                         c(id, trialNum,sessionNum,sessionThreshNum,
                           reversal,  reversals,  task,	startTrial,
                           tone1, tone2,	tone3, tone4, deltaF,
                           goodAnswer,	roving,	answer,	score, name))

############ THRESHOLD ANALYSES ############

# Calculate the frequency threshold of all participants
thresholdsAllWide <- data.frame(tapply(
  data.threshold$deltaF[data.threshold$reversals > 4],
  list(data.threshold$name[data.threshold$reversals > 4],
       data.threshold$sessionNum[data.threshold$reversals > 4],
       data.threshold$task[data.threshold$reversals > 4]),
  mean))
thresholdsAllreshaped1 <- reshape(thresholdsAllWide, direction= "long",
                                  varying=list(1:4, 5:8),
                                  ids=row.names(thresholdsAllWide),
                                  idvar="name",
                                  timevar="session",
                                  times=list("1","2",
                                             "3","4"))
thresholdsAllLong <- reshape(thresholdsAllreshaped1, direction= "long",
                             varying=list(2:3),
                             times=list("detection","identification"))
# Remove unused columns
thresholdsAllLong$id <- NULL
row.names(thresholdsAllLong) <- NULL
# Rename columns
colnames(thresholdsAllLong)[3] <- "condition"
colnames(thresholdsAllLong)[4] <- "threshold"

# Calculate the mean threshold for each session
meanThresholds <- data.frame(session = as.numeric(
  levels(factor(thresholdsAllLong$session))),
                             tapply(thresholdsAllLong$threshold,
                                    list(thresholdsAllLong$session,
                                         thresholdsAllLong$condition),
                                    mean))
# Reshape the data frame into long format
meanThresholdLong <- melt(meanThresholds, id.var="session",
                          variable.name = "condition", 
                          value.name = "threshold")

# Calculate the mean threshold for each participant and each condition
meanThresholdsSubj <- data.frame(name = levels(
  factor(thresholdsAllLong$name)),
                                tapply(thresholdsAllLong$threshold,
                                       list(thresholdsAllLong$name,
                                            thresholdsAllLong$condition),
                                       mean))
meanThresholdsSubjLong <- melt(meanThresholdsSubj, id.var="name",
                               variable.name = "condition", 
                               value.name = "threshold")

# Prepare plots

plotThresholds <- ggplot(data=thresholdsAllLong,
                         aes(x=as.numeric(session),
                             y=threshold,
                             color=name,
                             linetype=condition),
                         alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ ., scales="free") +
  theme(panel.margin = unit(3.5, "mm"))

plotMeanThresholds <- ggplot(data=meanThresholdLong,
                             aes(x=session,
                                 y=threshold,
                                 linetype=condition),
                             alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions")

plotDetById <- ggplot(thresholdsAllLong, aes(
      x=threshold[condition=="detection"],
      y=threshold[condition=="identification"],
      color=name[condition=="identification"]),
      log10="y") +
    geom_point(aes(shape=session[condition=="identification"])) +
    geom_abline(intercept = 0, slope = 1) +
    scale_colour_discrete(name = "Participants") +
    scale_shape(name = "Sessions") +
    scale_x_continuous(limits=c(10, 400)) +
    scale_y_continuous(limits=c(10, 400)) +
    xlab("Detection threshold") +
    ylab("Identification threshold") +
    ggtitle("Detection against identification thresholds
            \n for all subjects and all sessions")



############ DELTAF ANALYSES ############

# Compute the mean of deltaF between subjects
# The list is the factors used (the function is applied to each levels)
deltaFMeans <- data.frame(tapply(data.threshold$deltaF,
                                 list(data.threshold$trialNum,
                                      data.threshold$sessionNum,
                                      data.threshold$task),
                                 mean))

deltaFMeansreshaped1 <- reshape(deltaFMeans, direction= "long",
                                varying=list(1:4, 5:8),
                                ids=row.names(deltaFMeans),
                                idvar="trialNum",
                                timevar="session",
                                times=list("1","2",
                                           "3","4"))

deltaFMeansLong <- reshape(deltaFMeansreshaped1, direction= "long",
                           varying=list(2:3),
                           times=list("detection","identification"))
# Remove unused columns
deltaFMeansLong$id <- NULL
row.names(deltaFMeansLong) <- NULL
# Rename columns
colnames(deltaFMeansLong)[3] <- "condition"
colnames(deltaFMeansLong)[4] <- "threshold"
row.names(deltaFMeansLong) <- NULL

# Prepare plots

plotDeltaF <- ggplot(data=data.threshold,
                     aes(x=trialNum,
                         y=deltaF,
                         color=factor(sessionNum)),
                     alpha = 0.4) +
  xlab("Trials") +
  ylab("DeltaF (cents)") +
  geom_line() +
  scale_color_discrete(name="Session") +
  facet_grid(name ~ task, scales="free") +
  theme(panel.margin = unit(3.5, "mm"))

plotDeltaFMeans <- ggplot(data=deltaFMeansLong,
                          aes(x=as.numeric(trialNum),
                              y=threshold,
                              color=factor(session)),
                              alpha = 0.4) +
  geom_line() +
  scale_color_discrete(name="Session") +
  facet_grid(. ~ condition) +
  xlab("Trials") +
  ylab("DeltaF (cents)") +
  ggtitle("Mean of deltaF")

