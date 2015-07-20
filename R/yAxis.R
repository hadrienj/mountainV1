data.mountain.yAxis <- subset(data, grepl("yAxis", condition),
                              c(id, yTopDist, targetTone, CurXY, trialNumYAxis,
                                result, name, duration, time, score))

# Sort the data according to time then to trial number
data.mountain.yAxis <- data.mountain.yAxis[order(
  data.mountain.yAxis$time, data.mountain.yAxis$trialNumYAxis),]

row.names(data.mountain.yAxis) <- NULL

# Extract trial score and replace the score values if it exists (it exists for all except sa20 and ab22)
data.mountain.yAxis$score <-
  ((1 / (((data.mountain.yAxis$duration/100)+1)^2)) + 1) *
  (600*(((100-data.mountain.yAxis$result)/100)^2))


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

# Prepare plots
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
  facet_grid(name ~ ., scales="free")

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
  facet_grid(name ~ ., scales="free")

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
  facet_grid(name ~ ., scales="free")

# Accuracy by duration
plotAccByDur <- ggplot(data=data.mountain.yAxis,
                       aes(x=result,
                           y=duration,
                           color=name)) +
  geom_point() +
  xlab("Scores (percentage error)") +
  ylab("Duration (in seconds)") +
  ggtitle("Score in function of duration")

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
  geom_line() +
  facet_grid(name ~ ., scales="free") +
  ggtitle("Accuracy in the mountain task with thresholds 
          \nfrom the frequency threshold task")

# Accuracy by frequency
plotAccByFreq <- ggplot(data=data.mountain.yAxis,
                       aes(x=result,
                           y=targetTone,
                           color=name)) +
  geom_point() +
  xlab("Scores (percentage error)") +
  ylab("Frequency of the target tone (in Hz)") +
  ggtitle("Score in function of frequency of the target tone")
