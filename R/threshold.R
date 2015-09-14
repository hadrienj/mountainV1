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

# Calculate the frequency threshold of all participants and each session from deltaF
# The threshold is calculated with the mean of reversals
# The four first reversals are not taken into account in the mean
# trainsession == 0 is used to avoid to take data from longitudinal part
thresholdsAllLong <- aggregate(deltaF ~ name + sessionNum + task,
                               FUN=mean,
                               data=subset(data.threshold, data.threshold$reversals > 4
                                           & data.threshold$reversal==TRUE
                                           & data.threshold$trainSession==0),
                               na.rm=T)

colnames(thresholdsAllLong)[2] <- "session"
colnames(thresholdsAllLong)[3] <- "condition"
colnames(thresholdsAllLong)[4] <- "threshold"
thresholdsAllLong$session <- sapply(thresholdsAllLong$session,
                                    FUN = function(x) as.numeric(x) + 1)

# Assign pre or post value in function of session
thresholdsAllLong$prepost <- ifelse(thresholdsAllLong$session == 1 |
                                      thresholdsAllLong$session == 2,
                                    "pre",
                                    "post")
# Create a new data frame with the mean threshold by pre and post test
thresholdAllPrepostLong <- aggregate(threshold ~ name + prepost + condition,
                                     FUN=mean,
                                     data=thresholdsAllLong,
                                     na.rm=T)

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

# Calculate the mean threshold for each session and each condition
meanThresholdLong <- aggregate(threshold ~ session + condition,
                               FUN=mean,
                               data=thresholdsAllLong,
                               na.rm=T)
# Calculate the mean threshold for each participant and each condition
meanThresholdsSubjLong <- aggregate(threshold ~ name + condition,
                               FUN=mean,
                               data=thresholdsAllLong,
                               na.rm=T)

test <- do.call(data.frame, melt(aggregate(threshold ~ name + condition,
                  data=thresholdsAllLong,
                  FUN=function(i) {i/i[1]})))

ddply(thresholdsAllLong, .(name, condition),function(x) x$threshold/x$threshold[1])

test <- thresholdsAllLong %>% 
  group_by(name, condition) %>% 
  mutate(function(x) {x$threshold/x$threshold[1]})

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
  facet_grid(name ~ ., scale='free') +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsOneLog <- ggplot(data=thresholdsAllLong,
                               aes(x=as.numeric(session),
                                   y=threshold,
                                   color=name,
                                   linetype=condition),
                               alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_y_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
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
  facet_grid(name ~ .) +
  theme(panel.margin = unit(3.5, "mm"))

plotMeanThresholds <- ggplot(data=meanThresholdLong,
                             aes(x=session,
                                 y=threshold,
                                 linetype=condition),
                             alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotMeanThresholdsPercent <- ggplot(data=meanThresholdPercentLong,
                             aes(x=session,
                                 y=threshold,
                                 linetype=condition),
                             alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

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
          \n for all subjects and all sessions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

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
                     breaks=c("pre-test","post-test")) +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n Pre vs. Post test") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

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
          \n First vs. Second test") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))



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
  facet_grid(name ~ task) +
  theme(panel.margin = unit(3.5, "mm")) +
  ggtitle("DeltaF of each participant and each session") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

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
  ggtitle("Mean of deltaF") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

