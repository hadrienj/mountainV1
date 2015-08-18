# Analyses from the "data" data frame
# Output data frame:
#    - data.threshold (all data concerning the frequency threshold task)
#    - thresholdsAllLong (thresh for each participant and condition)
#    - meanThresholdLong (mean thresh among participants for each condition)
#    - deltaFMeansLong (mean deltaF for each trial number)
#    - meanThresholdsSubjLong (mean threshold for each subj and each condition)
#    - thresholdAllPrepostLong (mean threshold pre and post for each
# participant and condition)
#
# Output plots:
#    - plotThresholds (thresh for each subject, condition and session)
#    - plotMeanThresholds (mean thresh for each condition and session)
#    - plotDetById (identification against detection thresh for each subject)
#    - plotDeltaF (deltaF against trials for each subject)
#    - plotDeltaFMeans (mean deltaF against trials)


data.threshold <- subset(data, grepl("threshold", id) & sessionNumMount==1,
                         c(id, trialNum,sessionNum,sessionThreshNum,
                           reversal,  reversals,  task,  startTrial,
                           tone1, tone2,	tone3, tone4, deltaF,
                           goodAnswer,	roving,	answer,	score, name,
                           trainSession))

############ THRESHOLD ANALYSES ############

# Calculate the frequency threshold of all participants
thresholdsAllWide <- data.frame(tapply(
  data.threshold$deltaF[data.threshold$reversals > 4
                        & data.threshold$trainSession==0],
  list(data.threshold$name[data.threshold$reversals > 4
                           & data.threshold$trainSession==0],
       data.threshold$sessionNum[data.threshold$reversals > 4
                                 & data.threshold$trainSession==0],
       data.threshold$task[data.threshold$reversals > 4
                           & data.threshold$trainSession==0]),
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

# Assign pre or post value in function of session
thresholdsAllLong$prePost <- ifelse(thresholdsAllLong$session == 1 |
                                      thresholdsAllLong$session == 2, "pre", "post")
# Create a new data frame with the mean threshold by pre and post test
thresholdAllPrepost <- data.frame(tapply(thresholdsAllLong$threshold,
                                         list(thresholdsAllLong$prePost,
                                              thresholdsAllLong$name,
                                              thresholdsAllLong$condition),
                                         mean))
thresholdAllPrepostReshape1 <- reshape(thresholdAllPrepost,
                                       direction= "long",
                                       varying=list(1:(length(thresholdAllPrepost)/2),
                                                    ((length(thresholdAllPrepost)/2)+1):length(thresholdAllPrepost)),
                                       ids=row.names(thresholdAllPrepost),
                                       idvar="prepost",
                                       timevar="name",
                                       times=levels(factor(thresholdsAllLong$name)))
thresholdAllPrepostLong <- reshape(thresholdAllPrepostReshape1,
                                   direction= "long",
                                   varying=list(2:3),
                                   timevar="condition",
                                   times=list("detection","identification"))

colnames(thresholdAllPrepostLong)[4] <- "threshold"
row.names(thresholdAllPrepostLong) <- NULL
thresholdAllPrepostLong$id <- NULL


# Assign value in function of position in the session (first is 1 and 3, second is 2 and 4)
thresholdsAllLong$prePre <- ifelse(thresholdsAllLong$session == 1 |
                                     thresholdsAllLong$session == 3, "first", "second")
# Create a new data frame with the mean threshold by pre and post test
thresholdAllPrePre <- data.frame(tapply(thresholdsAllLong$threshold,
                                        list(thresholdsAllLong$prePre,
                                             thresholdsAllLong$name,
                                             thresholdsAllLong$condition),
                                        mean))
thresholdAllPrepreReshape1 <- reshape(thresholdAllPrePre,
                                      direction= "long",
                                      varying=list(1:(length(thresholdAllPrePre)/2),
                                                   ((length(thresholdAllPrePre)/2)+1):length(thresholdAllPrePre)),
                                      ids=row.names(thresholdAllPrePre),
                                      idvar="prepre",
                                      timevar="name",
                                      times=levels(factor(thresholdsAllLong$name)))
thresholdAllPrepreLong <- reshape(thresholdAllPrepreReshape1,
                                  direction= "long",
                                  varying=list(2:3),
                                  timevar="condition",
                                  times=list("detection","identification"))

colnames(thresholdAllPrepreLong)[4] <- "threshold"
row.names(thresholdAllPrepreLong) <- NULL
thresholdAllPrepreLong$id <- NULL

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

# Calculate the progression in percent of the first session to avoid the
# high thresholds have more weight on the evolution of the mean
thresholdsAllPercent <- data.frame(apply(
  thresholdsAllWide[,1:4],
  2,
  function(i){i/thresholdsAllWide[1]}),
  apply(
    thresholdsAllWide[,5:8],
    2,
    function(i){i/thresholdsAllWide[5]}))

thresholdsAllPercentReshape1 <- reshape(thresholdsAllPercent, direction= "long",
                                        varying=list(1:4, 5:8),
                                        ids=row.names(thresholdsAllPercent),
                                        idvar="name",
                                        timevar="session",
                                        times=list("1","2",
                                                   "3","4"))
thresholdsAllPercentLong <- reshape(thresholdsAllPercentReshape1, direction= "long",
                                   varying=list(2:3),
                                   times=list("detection","identification"))
# Remove unused columns
thresholdsAllPercentLong$id <- NULL
row.names(thresholdsAllPercentLong) <- NULL
# Rename columns
colnames(thresholdsAllPercentLong)[3] <- "condition"
colnames(thresholdsAllPercentLong)[4] <- "threshold"

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

plotThresholdsPercent <- ggplot(data=thresholdsAllPercentLong,
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

plotMeanThresholdsPercent <- ggplot(data=meanThresholdPercentLong,
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
  color=name[condition=="identification"])) +
  geom_point(aes(shape=session[condition=="identification"])) +
  coord_fixed() +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape(name = "Sessions") +
  scale_x_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n for all subjects and all sessions")

plotDetByIdPrepost <- ggplot(thresholdAllPrepostLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(aes(shape=prepost[condition=="identification"])) +
  coord_fixed() +
  geom_path(arrow=arrow(length=unit(0.3,"cm"), ends = "first"),
            size=0.4, aes(group=name[condition=="identification"])) +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape_manual(name = "Sessions", values=c(1, 16),
                     breaks=c("pre","post")) +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n Pre vs. Post test")

plotDetByIdPrepre <- ggplot(thresholdAllPrepreLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(aes(shape=prepre[condition=="identification"])) +
  coord_fixed() +
  geom_path(arrow=arrow(length=unit(0.3,"cm"), ends = "last"),
            size=0.4, aes(group=name[condition=="identification"])) +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape_manual(name = "Sessions", values=c(16, 1),
                     breaks=c("first","second")) +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n First vs. Second test")



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
## TrainSession==0 to avoid all the data of the longitudinal testing
plotDeltaF <- ggplot(data=data.threshold[data.threshold$trainSession==0,],
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

