data.mountain.yAxis <- subset(data,
                              grepl("yAxis", condition) & sessionNumMount==1,
                              c(id, yTopDist, targetTone, CurXY, trialNumYAxis,
                                result, totalScore, sessionNum, name, duration,
                                time, score, sessionNumMount))

# Sort the data according to time then to trial number
data.mountain.yAxis <- data.mountain.yAxis[order(
  data.mountain.yAxis$time, data.mountain.yAxis$trialNumYAxis),]

row.names(data.mountain.yAxis) <- NULL

# Extract trial score and replace the score values if it exists (it exists for all except sa20 and ab22)
data.mountain.yAxis$score <-
  ((1 / (((data.mountain.yAxis$duration/100)+1)^2)) + 1) *
  (600*(((100-data.mountain.yAxis$result)/100)^2))


# Calculate mean by participants
yAxisAccMean <- data.frame(trialNumYAxis=as.numeric(levels(factor(yAxisAcc$trialNumYAxis))),
                           result=tapply(yAxisAcc$result,
                                         yAxisAcc$trialNumYAxis,
                                         mean))
row.names(yAxisAccMean) <- NULL


# Make moving average for scores
zooYAxisAccuracy <- zoo(data.mountain.yAxis$result)
data.mountain.yAxis$YAxisAccuracyRoll <- as.numeric(
  ave(data.mountain.yAxis$result,
      data.mountain.yAxis$name,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
# Make moving average for durations
zooYAxisDur <- zoo(data.mountain.yAxis$duration)
data.mountain.yAxis$YAxisDurRoll <- as.numeric(
  ave(data.mountain.yAxis$duration,
      data.mountain.yAxis$name,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
# Make moving average for scores
zooYAxisScore <- zoo(data.mountain.yAxis$score)
data.mountain.yAxis$YAxisScoresRoll <- as.numeric(
  ave(data.mountain.yAxis$score,
      data.mountain.yAxis$name,
  FUN = function(x) rollapply(
    x,
    width = 10,
    FUN = mean,
    fill = NA,
    partial = FALSE)))
# Make moving average for mean accuracy
zooYAxisAccMean <- zoo(yAxisAccMean)
yAxisAccMean$YAxisAccuracyRoll <- as.numeric(
  ave(yAxisAccMean$result,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))


# Create long data frame for durations
yAxisDur <- subset(data.mountain.yAxis,
                   select = c(id, duration, YAxisDurRoll, name, trialNumYAxis))
yAxisDurLong <- melt(yAxisDur, c("id", "name", "trialNumYAxis"))
# Create long data frame for scores
yAxisScores <- subset(data.mountain.yAxis,
                      select = c(id, score, YAxisScoresRoll, name, trialNumYAxis))
yAxisScoresLong <- melt(yAxisScores, c("id", "name", "trialNumYAxis"))
# Create long data frame for accuracy
yAxisAcc <- subset(data.mountain.yAxis,
                   select = c(id, result, YAxisAccuracyRoll, name, trialNumYAxis))
yAxisAccLong <- melt(yAxisAcc, c("id", "name", "trialNumYAxis"))
# Create long data frame for mean accuracy
yAxisAccMeanLong <- melt(yAxisAccMean, "trialNumYAxis")



#### Extract path length ###
pathLengthprep <- data.frame(t(sapply(data.mountain.yAxis$CurXY,
                             function(x) data.frame(rbind(x)))),
                    name=data.mountain.yAxis$name,
                    trialNumYAxis=data.mountain.yAxis$trialNum,
                    startTrial=data.mountain.yAxis$time,
                    yTopDist=data.mountain.yAxis$yTopDist)
pathLength <- data.frame(X=unlist(data.frame(pathLengthprep)$X1),
                    Y=unlist(data.frame(pathLengthprep)$X2),
                    time=unlist(data.frame(pathLengthprep)$X3),
                    name = rep(pathLengthprep$name,
                               sapply(data.frame(pathLengthprep)$X1,
                                      length)),
                    trialNumYAxis=rep(pathLengthprep$trialNumYAxis,
                                 sapply(data.frame(pathLengthprep)$X1,
                                        length)),
                    startTrial=rep(pathLengthprep$startTrial,
                                 sapply(data.frame(pathLengthprep)$X1,
                                        length)),
                    yTopDist=rep(pathLengthprep$yTopDist,
                                 sapply(data.frame(pathLengthprep)$X1,
                                        length)))

zooPathY <- zoo(pathLength$Y)
pathLength$pathYRoll <- as.numeric(
  ave(pathLength$Y,
      FUN = function(x) rollapply(
        x,
        width = 2,
        FUN = diff,
        fill = NA,
        partial = FALSE)))

# Prepare the data frame with path length for all particpants and all trials
pathLengthAllprep <- data.frame(tapply(abs(pathLength$pathYRoll),
                          list(pathLength$trialNumYAxis, pathLength$name),
                          sum))
# Add row names as real vector
pathLengthAll <- data.frame(trialNumYAxis=rownames(pathLengthAllprep),
                            pathLengthAllprep)

# Remove one NA (first trial of ll07) to merge data.frame with other
pathLengthAll$ll07[[1]] <- 0

pathLengthAllLong <- melt(pathLengthAll,
                          "trialNumYAxis",
                          value.name="pathLength")

# Remove row.names
row.names(pathLengthAll) <- NULL
colnames(pathLengthAllLong)[2] <- "name"
pathLengthAllLong$trialNumYAxis <- as.numeric(
  as.character(pathLengthAllLong$trialNumYAxis))


# Make moving average for path length
# zooYAxisPath <- zoo(pathLengthAllLong$pathLength)
# pathLengthAllLongRoll$pathLengthRoll <- as.numeric(
#   ave(pathLengthAllLong$pathLength,
#       pathLengthAllLong$name,
#       FUN = function(x) rollapply(
#         x,
#         width = 10,
#         FUN = mean,
#         fill = NA,
#         partial = FALSE)))

pathLengthAllLongRoll <- melt(pathLengthAllLong,
                          c("name", "trialNumYAxis"))

pathLengthAllLongRoll$name <- as.character(pathLengthAllLongRoll$name)
pathLengthAllLongRoll$trialNumYAxis <- as.numeric(
  as.character(pathLengthAllLongRoll$trialNumYAxis))

# Sort the data according to time
pathLengthAllLongRoll <- pathLengthAllLongRoll[order(pathLengthAllLongRoll$name,
                                                     pathLengthAllLongRoll$variable,
                                                     pathLengthAllLongRoll$trialNumYAxis),]

data.mountain.yAxis <- merge(data.mountain.yAxis,
                             pathLengthAllLong,
                             by=c("trialNumYAxis", "name"))

# Sort the data according to time then to trial number
data.mountain.yAxis <- data.mountain.yAxis[order(
  data.mountain.yAxis$time, data.mountain.yAxis$trialNumYAxis),]

# Remove row.names
row.names(data.mountain.yAxis) <- NULL

#### Path X by Y ####
# Normalize Y
pathLength$YNorm <- pathLength$Y - pathLength$yTopDist
# Create categorical variable from time
pathLength$cat <- cut(pathLength$time, seq(0,40000,5))

# Extract the first Y value of each trial and put it in a new column
# named firstY (repeat this first value all along the trial)
pathLength <- pathLength %>%
  group_by(name, trialNumYAxis) %>%
  mutate(
    firstY=Y[1])

# Extract the first YNorm value of each trial and put it in a new column
# named firstYNorm (repeat this first value all along the trial)
# pathLength <- pathLength %>%
#   group_by(name, trialNumYAxis) %>%
#   mutate(
#     firstYNorm=YNorm[1],
#     numb=seq_along(dirChange))

# Calculate if the first Y value was higher or lower than the target
# in order to further separate the trials into two categories
pathLength$firstPositif <- (pathLength$firstY - pathLength$yTopDist)>0

pathLength$positif <- (pathLength$Y - pathLength$yTopDist)>0


# Calculate direction changes
# Create vector with TRUE if the n value sign is different
# of the n+1 value sign
pathLength$dirChange <- sapply(1:length(pathLength$YNorm),
                               function(x) sign(pathLength$YNorm[x])
                               !=sign(pathLength$YNorm[x-1]))
# Convert first value of each trial to FALSE to avoid counting
# changing sign between trials
pathLength <- pathLength %>%
  group_by(name, trialNumYAxis) %>%
  mutate(dirChange = replace(dirChange, 1, FALSE))

# Calculate the number of reversals for each participant and each trial
crossNumPrep <- data.frame(t(tapply(pathLength$dirChange,
                              list(pathLength$name,
                                   pathLength$trialNumYAxis),
                              function(x) length(x[x==TRUE]))))

crossNumPrep1 <- cbind(trialNum = row.names(crossNumPrep), crossNumPrep)
crossNumPrep1$trialNum  <- as.numeric(levels(crossNumPrep1$trialNum))[crossNumPrep1$trialNum]
row.names(crossNumPrep1) <- NULL

crossNum <- melt(crossNumPrep1, "trialNum", value.name="reversals")
colnames(crossNum)[2] <- "name"


# Create data frame with the mean for
# pathLength$Y > pathLength$yTopDist (for each time category)
pathLengthMean <- data.frame(mean=tapply(pathLength$YNorm[
  pathLength$positif==TRUE],
  pathLength$cat[pathLength$positif==TRUE],
  mean))
# Add time variable
pathLengthMean <- data.frame(pathLengthMean,
                             time=5*(1:length(pathLengthMean$mean)))


#### Evaluate efficiency of audio mountain as frequency threhold
std <- function(x) sd(x)/sqrt(length(x))
# Calculate the mean inter participant for each trial
yAxisLongMean <- data.frame(accuracy
                            =tapply(yAxisAccLong$value[yAxisAccLong$variable=="result"],
       yAxisAccLong$trialNumYAxis[yAxisAccLong$variable=="result"],
       mean))


yAxisLongMean <- cbind(trialNum = row.names(yAxisLongMean), yAxisLongMean)
yAxisLongMean$trialNum  <- as.numeric(levels(yAxisLongMean$trialNum))[yAxisLongMean$trialNum]
row.names(yAxisLongMean) <- NULL

# Calculate mean from first value to x
yAxisLongMean$meanRoll <- sapply(1:length(yAxisLongMean$trialNum),
                               function(x) mean(yAxisLongMean$accuracy[1:x]))
# Calculate the difference with the global mean in sd
yAxisLongMean$se <- sapply(1:length(yAxisLongMean$trialNum),
                                 function(x) abs(yAxisLongMean$meanRoll[x]
                                                 -mean(yAxisLongMean$accuracy))
                           *sd(yAxisLongMean$accuracy))

plotSeDiff <- ggplot(data=yAxisLongMean,
                  aes(x=trialNum,
                      y=se)) +
  xlab("Trials") +
  ylab("Standard error") +
  geom_line()


# yAxisAccLong$meanRoll <- tapply(1:length(yAxisLongMean$trialNum),
#                                 yAxisLongMean$name,
#                                 function(x) 
#                                   mean(yAxisLongMean$accuracy[1:x]))


############     PLOTS     ##########################
plotAcc <- ggplot(data=yAxisAccLong,
                  aes(x=trialNumYAxis,
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
#   facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm"))

plotAccOne <- ggplot(data=yAxisAccLong,
                  aes(x=trialNumYAxis,
                      y=value,
                      alpha = variable,
                      color=name)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  scale_y_continuous(limits=c(0, 20)) +
  geom_line() +
  theme(panel.margin = unit(4.5, "mm"))

plotDur <- ggplot(data=yAxisDurLong,
                     aes(x=trialNumYAxis,
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

plotScores <- ggplot(data=yAxisScoresLong,
                  aes(x=trialNumYAxis,
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

plotAccMean <- ggplot(data=yAxisAccMeanLong,
                  aes(x=trialNumYAxis,
                      y=value,
                      alpha = variable)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_line()

# Accuracy by duration
plotAccByDur <- ggplot(data=data.mountain.yAxis,
                       aes(x=result,
                           y=duration,
                           color=name)) +
  geom_point() +
  xlab("Scores (percentage error)") +
  ylab("Duration (in seconds)") +
  ggtitle("Score in function of duration") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Path length by duration
plotLengthByDur <- ggplot(data=data.mountain.yAxis,
                       aes(x=pathLength,
                           y=duration,
                           color=name)) +
  geom_point(data = data.mountain.yAxis, aes(y = duration)) +
  xlab("Path length (in pixels)") +
  ylab("Duration (in seconds)") +
  scale_x_continuous(limits=c(0, 10000)) +
  ggtitle("Path length in function of duration") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Path length by accuracy
plotLengthByAcc <- ggplot(data=data.mountain.yAxis,
                          aes(x=pathLength,
                              y=result,
                              color=name)) +
  geom_point() +
  xlab("Path length (in pixels)") +
  ylab("Accuracy (in percent error)") +
  scale_x_continuous(limits=c(0, 10000)) +
  ggtitle("Path length in function of duration") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Accuracy with thresholds
plotAccThresh <- ggplot(data=yAxisAccLong,
                        aes(x=trialNumYAxis,
                            y=value,
                            alpha = variable,
                            color=name)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  scale_y_continuous(limits=c(0, 35)) +
  geom_line() +
  facet_grid(name ~ .) +
  ggtitle("Accuracy in the mountain task with thresholds 
          \nfrom the frequency threshold task") +
  theme(plot.title = element_text(vjust=2, lineheight=.6)) +
  theme(panel.margin = unit(4.5, "mm"))

# Accuracy by frequency
plotAccByFreq <- ggplot(data=data.mountain.yAxis,
                       aes(x=result,
                           y=targetTone,
                           color=name)) +
  geom_point() +
  xlab("Scores (percentage error)") +
  ylab("Frequency of the target tone (in Hz)") +
  ggtitle("Score in function of frequency of the target tone") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))


plotPathLength <- ggplot(data=pathLengthAllLong,
                         aes(x=trialNumYAxis,
                             y=pathLength,
                             #                              alpha = variable,
                             color=name)) +
  #   scale_alpha_manual(name="Display", labels=c("Raw values",
  #                                               "Rolling mean \n(10 values)"),
  #                      values=c(0.3, 1)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_point() +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm")) +
  scale_y_continuous(limits=c(0, 5000))


plotPathCoord <- ggplot(data=subset(pathLength,
                                    trialNumYAxis==seq(0, 100, 10)),
                          aes(x=time,
                              y=YNorm,
                              color=as.character(trialNumYAxis))) +
  geom_line(size = 0.8) +
  xlab("Time (in milliseconds)") +
  ylab("Y path (in pixels)") +
  scale_y_continuous(limits=c(-700, 700)) +
  scale_x_continuous(limits=c(0, 30000)) +
#   geom_hline(aes(yintercept=yTopDist, color=as.character(trialNumYAxis))) +
  facet_grid(name ~ .) +
  ggtitle("Normalize Y path draw by participants in function of time") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Plot crossing number
plotCrossNum <- ggplot(data=crossNum,
                     aes(x=trialNum,
                         y=reversals,
                         color=name)) +
  geom_line(size = 0.8) +
  xlab("Trial number") +
  ylab("Number of target crossing") +
  scale_y_continuous(limits=c(0, 20)) +
#   scale_x_continuous(limits=c(0, 20000)) +
  #   geom_hline(aes(yintercept=yTopDist, color=as.character(trialNumYAxis))) +
  facet_grid(name ~ .) +
  ggtitle("Number of target crossing for each participant and each trial") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))
