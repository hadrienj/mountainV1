data.mountain.yAxis <- subset(data,
                              grepl("yAxis", condition) & sessionNumMount==1,
                              c(id, yTopDist, targetTone, CurXY, trialNumYAxis,
                                result, totalScore, sessionNum, name, duration,
                                time, score, sessionNumMount))


# Sort the data according to time then to trial number
data.mountain.yAxis <- data.mountain.yAxis[order(
  data.mountain.yAxis$time, data.mountain.yAxis$trialNumYAxis),]
row.names(data.mountain.yAxis) <- NULL


# Extract trial score and replace the score values
# if it exists (it exists for all except sa20 and ab22)
data.mountain.yAxis$score <-
  ((1 / (((data.mountain.yAxis$duration/100)+1)^2)) + 1) *
  (600*(((100-data.mountain.yAxis$result)/100)^2))


# Make moving average for accuracy
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
data.mountain.yAxis$YAxisScoresRoll <- as.numeric(
  ave(data.mountain.yAxis$score,
      data.mountain.yAxis$name,
  FUN = function(x) rollapply(
    x,
    width = 10,
    FUN = mean,
    fill = NA,
    partial = FALSE)))

##################
# data.mountain.yAxis$trialNumYAxis <- factor(data.mountain.yAxis$trialNumYAxis)
# test <- ggplot(data=data.mountain.yAxis,
#                aes(x=factor(trialNumYAxis),
#                    y=duration,
#                    alpha = YAxisDurRoll,
#                    color=name)) +
#   scale_alpha_manual(name="Display", labels=c("Raw values",
#                                               "Rolling mean \n(10 values)"),
#                      values=c(0.3, 1)) +
#   guides(color=FALSE) +
#   xlab("Trials") +
#   ylab("Scores (in points)") +
#   geom_line() +
#   facet_grid(name ~ .) +
#   theme(panel.margin = unit(4.5, "mm"))
##################

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

# Calculate meanand duration by trial
yAxisAccMean <- data.frame(trialNumYAxis=as.numeric(levels(factor(yAxisAcc$trialNumYAxis))),
                           result=tapply(yAxisAcc$result,
                                         yAxisAcc$trialNumYAxis,
                                         mean))
yAxisDurMean <- data.frame(trialNumYAxis=as.numeric(levels(factor(yAxisDur$trialNumYAxis))),
                           result=tapply(yAxisDur$duration,
                                         yAxisDur$trialNumYAxis,
                                         mean))
row.names(yAxisAccMean) <- NULL
row.names(yAxisDurMean) <- NULL
# Make moving average for mean accuracy and duration
yAxisAccMean$YAxisAccuracyRoll <- as.numeric(
  ave(yAxisAccMean$result,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
yAxisDurMean$YAxisDurRoll <- as.numeric(
  ave(yAxisDurMean$result,
      FUN = function(x) rollapply(
        x,
        width = 10,
        FUN = mean,
        fill = NA,
        partial = FALSE)))
# Create long data frame for mean accuracy and duration
yAxisAccMeanLong <- melt(yAxisAccMean, "trialNumYAxis")
yAxisDurMeanLong <- melt(yAxisDurMean, "trialNumYAxis")

colnames(yAxisAccMeanLong)[2] <- "variableAcc"
colnames(yAxisAccMeanLong)[3] <- "valueAcc"
colnames(yAxisDurMeanLong)[2] <- "variableDur"
colnames(yAxisDurMeanLong)[3] <- "valueDur"

# Merge both data frame
yAxisMeanLong <- cbind(yAxisDurMeanLong, yAxisAccMeanLong)

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

pathLength$trialNumYAxis <- factor(pathLength$trialNumYAxis)

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



################# PATH Y ############################################
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
# Remove trial with strange value: 211 reversals...
crossNum$reversal[crossNum$name=="df22" & crossNum$trialNum==69] <- NA

# Calculate crossing mean by trial
# Attention: only the trials with all participants are taken (how to do na.omit ?)
crossNumMean <- data.frame(trialNum=as.numeric(levels(factor(crossNum$trialNum))),
                           result=tapply(crossNum$reversals,
                                         crossNum$trialNum,
                                         mean))
row.names(crossNumMean) <- NULL


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
# std <- function(x) sd(x)/sqrt(length(x))

yAxisEffPrep <- data.frame(tapply(yAxisAccLong$value[
  yAxisAccLong$variable=="result"],
  list(yAxisAccLong$trialNumYAxis[
    yAxisAccLong$variable=="result"],
    yAxisAccLong$name[
      yAxisAccLong$variable=="result"]),
  mean))

yAxisEffPrep1 <- cbind(trialNum = row.names(yAxisEffPrep), yAxisEffPrep)

yAxisEff <- melt(yAxisEffPrep1, value.name="accuracy")
colnames(yAxisEff)[2] <- "name"

# Remove NA
yAxisEff <- na.omit(yAxisEff)

yAxisEff$trialNum  <- as.numeric(levels(yAxisEff$trialNum))[yAxisEff$trialNum]

yAxisEff <- yAxisEff[yAxisEff$trialNum>2,]


# Create a vector with the cumulative mean of accuracy for each participant
yAxisEff <- yAxisEff %>%
  group_by(name) %>%
  mutate(
    roll=cummean(accuracy),
    mean=mean(accuracy),
    sd=sd(accuracy),
    se=abs(roll-mean)/sd)



# Calculate the mean inter participants for each trial
yAxisLongMean <- data.frame(accuracy=
                              tapply(yAxisAccLong$value[yAxisAccLong$variable=="result"],
                                     yAxisAccLong$trialNumYAxis[
                                       yAxisAccLong$variable=="result"],
                                     mean),
                            duration=
                              tapply(yAxisDurLong$value[yAxisDurLong$variable=="duration"],
                                     yAxisDurLong$trialNumYAxis[
                                       yAxisDurLong$variable=="duration"],
                                     mean))

yAxisLongMean <- cbind(trialNum = row.names(yAxisLongMean), yAxisLongMean)
yAxisLongMean$trialNum  <- as.numeric(levels(yAxisLongMean$trialNum))[yAxisLongMean$trialNum]
row.names(yAxisLongMean) <- NULL

# Calculate mean from first value to x
yAxisLongMean$accRoll <- sapply(1:length(yAxisLongMean$trialNum),
                               function(x) mean(yAxisLongMean$accuracy[1:x]))
yAxisLongMean$durRoll <- sapply(1:length(yAxisLongMean$trialNum),
                                function(x) mean(yAxisLongMean$duration[1:x]))
# Calculate the difference with the global mean in sd
yAxisLongMean$accSe <- sapply(1:length(yAxisLongMean$trialNum),
                                 function(x) abs(yAxisLongMean$accRoll[x]
                                                 -mean(yAxisLongMean$accuracy))
                           /sd(yAxisLongMean$accuracy))
yAxisLongMean$durSe <- sapply(1:length(yAxisLongMean$trialNum),
                              function(x) abs(yAxisLongMean$durRoll[x]
                                              -mean(yAxisLongMean$duration))
                              /sd(yAxisLongMean$duration))
yAxisLongMean <- melt(yAxisLongMean, "trialNum")


######### ACCURACY WITH THRESHOLD MEANS
meanThresholdsLong <- data.frame(condition=
                                   levels(factor(meanThresholdsSubjLong$condition)),
                                 mean=
                                   tapply(meanThresholdsSubjLong$threshold,
                                          meanThresholdsSubjLong$condition,
                                          mean))
row.names(meanThresholdsLong) <- NULL


test <- data.frame(mountainThresh
                   =tapply(yAxisAccLong$value[yAxisAccLong$trialNum>2],
                           yAxisAccLong$name[yAxisAccLong$trialNum>2],
                           mean,
                           na.rm=TRUE),
                   thresholdId=(2^(meanThresholdsSubjLong$threshold[
                     meanThresholdsSubjLong$condition
                     =="identification"]/1200)-1)*100,
                   thresholdDet=(2^(meanThresholdsSubjLong$threshold[
                     meanThresholdsSubjLong$condition
                     =="detection"]/1200)-1)*100)
test <- data.frame(name=rownames(test), test)
test <- melt(test)


## Scatter plots mountain by thresholds
mountainByThresh <- data.frame(meanThresholdsSubj,
                               mountain=
                                 tapply(data.mountain.yAxis$result,
                                   data.mountain.yAxis$name,
                                   mean),
                               mountainPre=
                                 tapply(data.mountain.yAxis$result[
                                   data.mountain.yAxis$trialNumYAxis<25],
                                        data.mountain.yAxis$name[
                                          data.mountain.yAxis$trialNumYAxis<25],
                                        mean),
                               mountainPost=
                                 tapply(data.mountain.yAxis$result[
                                   data.mountain.yAxis$trialNumYAxis>50
                                   & data.mountain.yAxis$trialNumYAxis<75],
                                   data.mountain.yAxis$name[
                                     data.mountain.yAxis$trialNumYAxis>50
                                     & data.mountain.yAxis$trialNumYAxis<75],
                                   mean))
row.names(mountainByThresh) <- NULL
