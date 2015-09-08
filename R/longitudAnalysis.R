# This file requires the R file threshold.R
# threshold.R has to be executed before longitudAnalysis.R


se <- function(x) sqrt(var(x)/length(x))


# va01 and df22 did the longitudinal experiment
data.threshold.longi <- subset(data, (grepl("threshold", id))
                                      & ((grepl("va", name))
                                      | (grepl("df", name))),
                               c(id, trialNum,sessionNum,sessionThreshNum,
                                 reversal,  reversals,  task,  startTrial,
                                 tone1, tone2,  tone3, tone4, deltaF,
                                 goodAnswer,	roving,	answer,	score, name,
                                 trainSession))

# Add the total session number (through the different days of training)
data.threshold.longi$sessionTot <- (as.numeric(data.threshold.longi$sessionNum)
                                    + 1) +
  as.numeric(data.threshold.longi$trainSession) * 4



thresholdsLongiAllWide <- data.frame(tapply(
  data.threshold.longi$deltaF[data.threshold.longi$reversals > 4
                              & data.threshold.longi$reversal==TRUE],
  list(data.threshold.longi$name[data.threshold.longi$reversals > 4
                                 & data.threshold.longi$reversal==TRUE],
       data.threshold.longi$sessionTot[data.threshold.longi$reversals > 4
                                       & data.threshold.longi$reversal==TRUE],
       data.threshold.longi$task[data.threshold.longi$reversals > 4
                                 & data.threshold.longi$reversal==TRUE]),
  mean))
thresholdsLongiAllreshaped1 <- reshape(thresholdsLongiAllWide, direction= "long",
                                  varying=list(1:20, 21:40),
                                  ids=row.names(thresholdsLongiAllWide),
                                  idvar="name",
                                  timevar="session",
                                  times=list("1","2","3","4",
                                             "5","6","7","8",
                                             "9","10","11","12",
                                             "13","14","15","16",
                                             "17","18","19","20"))
thresholdsLongiAllLong <- reshape(thresholdsLongiAllreshaped1, direction= "long",
                             varying=list(2:3),
                             times=list("detection","identification"))
# Remove unused columns
thresholdsLongiAllLong$id <- NULL
row.names(thresholdsLongiAllLong) <- NULL
# Rename columns
colnames(thresholdsLongiAllLong)[3] <- "condition"
colnames(thresholdsLongiAllLong)[4] <- "threshold"

# Mean of thresholds
thresholdsLongiMean <- data.frame(session=as.numeric(
  levels(factor(thresholdsLongiAllLong$session))),
  threshold=tapply(thresholdsLongiAllLong$threshold,
                   list(thresholdsLongiAllLong$session,
                        thresholdsLongiAllLong$condition),
                   mean))
# Remove unused columns
row.names(thresholdsLongiMean) <- NULL
colnames(thresholdsLongiMean)[2] <- "detection"
colnames(thresholdsLongiMean)[3] <- "identification"

thresholdsLongiMeanLong <- melt(thresholdsLongiMean, id.var="session",
                               variable.name = "condition", 
                               value.name = "threshold")
# Sort data by session number
thresholdsLongiMeanLong <- thresholdsLongiMeanLong[order(
  thresholdsLongiMeanLong$condition, thresholdsLongiMeanLong$session),]

# Calculate the progression in percent of the first session to avoid the
# high thresholds have more weight on the evolution of the mean
thresholdsLongiAllPercent <- data.frame(apply(
  thresholdsLongiAllWide[,1:20],
  2,
  function(i){i/thresholdsLongiAllWide[1]}),
  apply(
    thresholdsLongiAllWide[,21:40],
    2,
    function(i){i/thresholdsLongiAllWide[21]}))

thresholdsLongiAllPercentReshape1 <- reshape(thresholdsLongiAllPercent,
                                             direction= "long",
                                        varying=list(1:20, 21:40),
                                        ids=row.names(thresholdsLongiAllPercent),
                                        idvar="name",
                                        timevar="session",
                                        times=list("1","2","3","4",
                                                   "5","6","7","8",
                                                   "9","10","11","12",
                                                   "13","14","15","16",
                                                   "17","18","19","20"))
thresholdsLongiAllPercentLong <- reshape(thresholdsLongiAllPercentReshape1,
                                        direction= "long",
                                    varying=list(2:3),
                                    times=list("detection","identification"))
# Remove unused columns
thresholdsLongiAllPercentLong$id <- NULL
row.names(thresholdsLongiAllPercentLong) <- NULL
# Rename columns
colnames(thresholdsLongiAllPercentLong)[3] <- "condition"
colnames(thresholdsLongiAllPercentLong)[4] <- "threshold"

# Calculate the mean threshold for each session
meanThresholdsLongiPercent <- data.frame(session = as.numeric(
  levels(factor(thresholdsLongiAllPercentLong$session))),
  tapply(thresholdsLongiAllPercentLong$threshold,
         list(thresholdsLongiAllPercentLong$session,
              thresholdsLongiAllPercentLong$condition),
         mean))
# Reshape the data frame into long format
meanThresholdLongiPercentLong <- melt(meanThresholdsLongiPercent, id.var="session",
                                 variable.name = "condition", 
                                 value.name = "threshold")


# Prepare plots
plotThresholdsLongi <- ggplot(data=thresholdsLongiAllLong,
                         aes(x=as.numeric(session),
                             y=threshold,
                             color=name,
                             linetype=condition),
                         alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(3.5, "mm")) +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 500)) +
  geom_vline(xintercept = c(5, 9, 13, 17),
                            linetype="longdash",
                            color="azure4")

plotThresholdsLongiMean <- ggplot(data=thresholdsLongiMeanLong,
                              aes(x=as.numeric(session),
                                  y=threshold,
                                  linetype=condition),
                              alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 500)) +
  geom_vline(xintercept = c(5, 9, 13, 17), linetype="longdash", color="azure4")

plotThresholdsLongiPercent <- ggplot(data=thresholdsLongiAllPercentLong,
                                aes(x=as.numeric(session),
                                    y=threshold,
                                    color=name,
                                    linetype=condition),
                                alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 2.5)) +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(3.5, "mm")) +
  geom_vline(xintercept = c(5, 9, 13, 17), linetype="longdash", color="azure4")

plotMeanThresholdsLongiPercent <- ggplot(data=meanThresholdLongiPercentLong,
                                    aes(x=session,
                                        y=threshold,
                                        linetype=condition),
                                    alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 2.5)) +
  ggtitle("Mean threshold for detection and identification conditions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6)) +
  geom_vline(xintercept = c(5, 9, 13, 17), linetype="longdash", color="azure4")


#################### Y axis analysis ######################
# Same procedure as for yAxis anlysis but without excluding
# the sessions after the first
data.mountain.yAxis.longi <- subset(data,
                                    ((grepl("va", name))
                                     | (grepl("df", name)))
                                    & grepl("yAxis", condition),
                                    c(id, yTopDist, targetTone, CurXY, trialNumYAxis,
                                      result, totalScore, sessionNum, name, duration,
                                      time, score, sessionNumMount))

# Sort the data according to time then to trial number
data.mountain.yAxis.longi <- data.mountain.yAxis.longi[order(
  data.mountain.yAxis.longi$time, data.mountain.yAxis.longi$trialNumYAxis),]

row.names(data.mountain.yAxis.longi) <- NULL

# Extract trial score and replace the score values if it exists (it exists for all except sa20 and ab22)
data.mountain.yAxis.longi$score <-
  ((1 / (((data.mountain.yAxis.longi$duration/100)+1)^2)) + 1) *
  (600*(((100-data.mountain.yAxis.longi$result)/100)^2))


# Make moving average for scores
zooYAxisAccuracyLongi <- zoo(data.mountain.yAxis.longi$result)
data.mountain.yAxis.longi$YAxisAccuracyRoll <- as.numeric(
  ave(data.mountain.yAxis.longi$result,
      data.mountain.yAxis.longi$name,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
# Make moving average for durations
zooYAxisDurLongi <- zoo(data.mountain.yAxis.longi$duration)
data.mountain.yAxis.longi$YAxisDurRoll <- as.numeric(
  ave(data.mountain.yAxis.longi$duration,
      data.mountain.yAxis.longi$name,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
# Make moving average for scores
zooYAxisScoreLongi <- zoo(data.mountain.yAxis.longi$score)
data.mountain.yAxis.longi$YAxisScoresRoll <- as.numeric(
  ave(data.mountain.yAxis.longi$score,
      data.mountain.yAxis.longi$name,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))


# # Create long data frame for durations
# yAxisDur <- subset(data.mountain.yAxis.longi,
#                    select = c(id, duration, YAxisDurRoll, name, trialNumYAxis))
# yAxisDurLong <- melt(yAxisDur, c("id", "name", "trialNumYAxis"))
# # Create long data frame for scores
# yAxisScores <- subset(data.mountain.yAxis.longi,
#                       select = c(id, score, YAxisScoresRoll, name, trialNumYAxis))
# yAxisScoresLong <- melt(yAxisScores, c("id", "name", "trialNumYAxis"))
# # Create long data frame for accuracy
# yAxisAcc <- subset(data.mountain.yAxis.longi,
#                    select = c(id, result, YAxisAccuracyRoll, name, trialNumYAxis))
# yAxisAccLong <- melt(yAxisAcc, c("id", "name", "trialNumYAxis"))


trialNumTot <- data.frame(name=levels(factor(data.mountain.yAxis.longi$name)),
                          trialNum=tapply(data.mountain.yAxis.longi$result,
                                 data.mountain.yAxis.longi$name,
                                 length))
row.names(trialNumTot) <- NULL

data.mountain.yAxis.longi$trialNumTot[data.mountain.yAxis.longi$name=="va01"] <-
  0:(trialNumTot$trialNum[trialNumTot$name=="va01"]-1)
data.mountain.yAxis.longi$trialNumTot[data.mountain.yAxis.longi$name=="df22"] <-
  0:(trialNumTot$trialNum[trialNumTot$name=="df22"]-1)

# Calculate the total scores for each participant and each session
totalScores <- data.frame(name=levels(factor(data.mountain.yAxis.longi$name)),
                          tapply(data.mountain.yAxis.longi$totalScore,
                                 list(data.mountain.yAxis.longi$name,
                                      data.mountain.yAxis.longi$sessionNumMount),
                                 max))
totalScoresLong <- reshape(totalScores, direction= "long",
                           varying=list(2:4),
                           v.names="totalScore",
                           timevar="session",
                           times=list("1","2","3"))
totalScoresLong$id <- NULL
row.names(totalScoresLong) <- NULL

# Calculate the mean accuracy of trials from the mean result
meanAccuracy = data.frame(name=levels(factor(data.mountain.yAxis.longi$name)),
                          meanAcc=tapply(data.mountain.yAxis.longi$result,
                                         data.mountain.yAxis.longi$name,
                                         function(i) {
                                           600*((100-mean(i))/100)^6
                                         }
                          ))


# Create long data frame for durations
yAxisDurLongi <- subset(data.mountain.yAxis.longi,
                   select = c(id, duration, YAxisDurRoll, name, trialNumTot))
yAxisDurLongiLong <- melt(yAxisDurLongi, c("id", "name", "trialNumTot"))
# Create long data frame for scores
yAxisScoresLongi <- subset(data.mountain.yAxis.longi,
                      select = c(id, score, YAxisScoresRoll, name, trialNumTot))
yAxisScoresLongiLong <- melt(yAxisScoresLongi, c("id", "name", "trialNumTot"))
# Create long data frame for accuracy
yAxisAccLongi <- subset(data.mountain.yAxis.longi,
                   select = c(id, result, YAxisAccuracyRoll, name, trialNumTot))
yAxisAccLongiLong <- melt(yAxisAccLongi, c("id", "name", "trialNumTot"))




# Prepare plots
plotAccLongi <- ggplot(data=yAxisAccLongiLong,
                  aes(x=trialNumTot,
                      y=value,
                      alpha = variable,
                      color=name)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_line() +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm"))

plotDurLongi <- ggplot(data=yAxisDurLongiLong,
                  aes(x=trialNumTot,
                      y=value,
                      alpha = variable,
                      color=name)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Duration (in seconds)") +
  geom_line() +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm"))

plotScoresLongi <- ggplot(data=yAxisScoresLongiLong,
                     aes(x=trialNumTot,
                         y=value,
                         alpha = variable,
                         color=name)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Scores (in points)") +
  geom_line() +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm"))

