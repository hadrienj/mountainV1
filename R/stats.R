shap <- function(data, cond, sess, thresholdMax) {
  shapiro.test(subset(data,
                      condition==cond
                      & session==sess
                      & threshold<thresholdMax)
               $threshold)
}
cent2Perc <- function(cent) {
  percent <- (2^(cent/1200)-1)*100
  return(percent)
}

# Comparison of identification and detection thresholds

## Conditions to use parametric test
### Variance comparison
varDetById <- var.test(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'],
         meanThresholdsSubjLong$threshold[
    meanThresholdsSubjLong$condition=='identification'])

var1Vs2 <- var.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2])

varPrepre <- var.test(thresholdAllPrepreLong$threshold[
  thresholdAllPrepreLong$prepre=='first'],
  thresholdAllPrepreLong$threshold[
    thresholdAllPrepreLong$prepre=='second'])


## Different variances = use non parametric tests
wiltestDetById <- wilcox.test(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'],
            meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='identification'], paired=TRUE)

wiltestDetByIdRov <- wilcox.test(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'
  & meanThresholdsSubjLong$roving==TRUE],
  meanThresholdsSubjLong$threshold[
    meanThresholdsSubjLong$condition=='identification'
    & meanThresholdsSubjLong$roving==TRUE],
  paired=TRUE)

wiltestDetByIdNoRov <- wilcox.test(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'
  & meanThresholdsSubjLong$roving==FALSE],
  meanThresholdsSubjLong$threshold[
    meanThresholdsSubjLong$condition=='identification'
    & meanThresholdsSubjLong$roving==FALSE],
  paired=TRUE)

cent2Perc(mean(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'
  & meanThresholdsSubjLong$roving==FALSE]))
cent2Perc(mean(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='identification'
  & meanThresholdsSubjLong$roving==FALSE]))

cent2Perc(mean(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'
  & meanThresholdsSubjLong$roving==TRUE]))
cent2Perc(mean(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='identification'
  & meanThresholdsSubjLong$roving==TRUE]))

# With roving
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1],
                    thresholdsAllLong$threshold[
  thresholdsAllLong$session==2],
                    paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdAllPrepostLong$threshold[
  thresholdAllPrepostLong$prepost=='pre'],
                     thresholdAllPrepostLong$threshold[
  thresholdAllPrepostLong$prepost=='post'],
                       paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdAllPrepreLong$threshold[
  thresholdAllPrepreLong$prepre=='first'],
  thresholdAllPrepreLong$threshold[
    thresholdAllPrepreLong$prepre=='second'],
  paired=TRUE)

# Without roving
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==FALSE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==FALSE],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==FALSE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==FALSE],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==FALSE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==FALSE],
  paired=TRUE)

# With roving
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==TRUE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==TRUE],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==TRUE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==TRUE],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==TRUE],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==TRUE],
  paired=TRUE)

# With roving, identification
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)

# With roving, detection
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==TRUE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==TRUE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)

# Without roving, detection
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='detection'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='detection'],
  paired=TRUE)

# Without roving, identification
## test procedural learning (session 1 vs. 2)
wilProc <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$session==1
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$session==2
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)
## test audio motor learning (sessions 1 and 2 vs. 3 and 4)
wilAM <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepost=='pre'
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepost=='post'
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)
## test threshold task learning (sessions 1 and 3 vs. 2 and 4)
wilTask <- wilcox.test(thresholdsAllLong$threshold[
  thresholdsAllLong$prepre=='first'
  & thresholdsAllLong$roving==FALSE
  & thresholdsAllLong$condition=='identification'],
  thresholdsAllLong$threshold[
    thresholdsAllLong$prepre=='second'
    & thresholdsAllLong$roving==FALSE
    & thresholdsAllLong$condition=='identification'],
  paired=TRUE)


# Comparison of roving and no roving mountain
var <- var.test(yAxisAccNoRovMean$result,
                yAxisAccRovMean$result)
wilTask <- wilcox.test(yAxisAcc$result[
  yAxisAcc$roving==TRUE],
  yAxisAcc$result[
    yAxisAcc$roving==FALSE],
  paired=FALSE)


# Mountain
## Without roving
### Don't take the first 3 trials into account
### Take only trials with all subjects (until trial 60)
wilMountNoRov <- wilcox.test(data.mountain.yAxis$result[
    data.mountain.yAxis$roving==FALSE &
    data.mountain.yAxis$trialNumYAxis<18 &
    data.mountain.yAxis$trialNumYAxis>2],
  data.mountain.yAxis$result[
    data.mountain.yAxis$roving==FALSE &
    data.mountain.yAxis$trialNumYAxis>45 &
    data.mountain.yAxis$trialNumYAxis<61],
  paired=TRUE) 

## With roving
### Don't take the first 3 trials into account
### Take only trials with all subjects (until trial 60)
wilMountRov <- wilcox.test(data.mountain.yAxis$result[
  data.mountain.yAxis$roving==TRUE &
    data.mountain.yAxis$trialNumYAxis<21 &
    data.mountain.yAxis$trialNumYAxis>2],
  data.mountain.yAxis$result[
    data.mountain.yAxis$roving==TRUE &
      data.mountain.yAxis$trialNumYAxis>54 &
      data.mountain.yAxis$trialNumYAxis<73],
  paired=TRUE)



wilMountRovFromMean <- wilcox.test(yAxisAccRovMean$result[
  yAxisAccRovMean$trialNumYAxis<21 &
    yAxisAccRovMean$trialNumYAxis>2],
  yAxisAccRovMean$result[
    yAxisAccRovMean$roving==TRUE &
      yAxisAccRovMean$trialNumYAxis>54 &
      yAxisAccRovMean$trialNumYAxis<73],
  paired=TRUE)

# Roving vs. no roving
rovMean <- data.mountain.yAxis %>%
  filter(roving==TRUE) %>%
  group_by(name) %>%
  summarise(mean=mean(result))
noRovMean <- data.mountain.yAxis %>%
  filter(roving==FALSE) %>%
  group_by(name) %>%
  summarise(mean=mean(result))
wilMountRovVsNoRov <- wilcox.test(rovMean$mean, noRovMean$mean, paired=FALSE)


# Compare first 25% with last 25% for each subject
begEnd <- data.frame(beg=cbind(by(list(data.mountain.yAxis$trialNumYAxis,
                                        data.mountain.yAxis$name),
                                   data.mountain.yAxis$name,
                                   function(x) {
                                     list(data.mountain.yAxis$result[
                                       data.mountain.yAxis$trialNumYAxis>2
                                       & data.mountain.yAxis$trialNumYAxis<(round((max(x[1])*25)/100))
                                       & data.mountain.yAxis$name==x[,2]])
                                   }
                                   )
                                ),
                   end=cbind(by(list(data.mountain.yAxis$trialNumYAxis,
                                     data.mountain.yAxis$name),
                                data.mountain.yAxis$name,
                                function(x) {
                                  list(data.mountain.yAxis$result[
                                    data.mountain.yAxis$trialNumYAxis<=max(x[1])
                                    & data.mountain.yAxis$trialNumYAxis>
                                      (max(x[1])-round((max(x[1])*25)/100)+3)
                                    & data.mountain.yAxis$name==x[,2]])
                                }
                   ))
                   )
begEnd <- data.frame(name=rownames(begEnd), begEnd)
begEnd <- cbind(unnest(begEnd, beg), unnest(begEnd, end))
begEnd[3] <- NULL

# Compare the mean of the first 25% with the mean of the last 25%
begEndMean <- data.frame(beg=cbind(by(list(data.mountain.yAxis$trialNumYAxis,
                                       data.mountain.yAxis$name),
                                  data.mountain.yAxis$name,
                                  function(x) {
                                    mean(data.mountain.yAxis$result[
                                      data.mountain.yAxis$trialNumYAxis>2
                                      & data.mountain.yAxis$trialNumYAxis<(round((max(x[1])*25)/100))
                                      & data.mountain.yAxis$name==x[,2]])
                                  }
                    )
                    ),
                    end=cbind(by(list(data.mountain.yAxis$trialNumYAxis,
                                      data.mountain.yAxis$name),
                                 data.mountain.yAxis$name,
                                 function(x) {
                                   mean(data.mountain.yAxis$result[
                                     data.mountain.yAxis$trialNumYAxis<=max(x[1])
                                     & data.mountain.yAxis$trialNumYAxis>
                                       (max(x[1])-round((max(x[1])*25)/100)+3)
                                     & data.mountain.yAxis$name==x[,2]])
                                 }
                    ))
                    )

wilcox.test(begEndMean$beg, begEndMean$end, paired=TRUE)

# Interactions roving det/id
detIdRov <- data.frame(cbind(
  by(list(thresholdsAllLong$threshold[thresholdsAllLong$roving==TRUE],
          thresholdsAllLong$condition[thresholdsAllLong$roving==TRUE]),
     list(thresholdsAllLong$name[thresholdsAllLong$roving==TRUE],
          thresholdsAllLong$session[thresholdsAllLong$roving==TRUE]),
     function(x) {
       abs(x[1][x[2]=='detection'] - x[1][x[2]=='identification'])
     })))
detIdRov <- melt(detIdRov, variable.name = "session", 
                 value.name = "rov")

detIdNoRov <- data.frame(cbind(
  by(list(thresholdsAllLong$threshold[thresholdsAllLong$roving==FALSE],
          thresholdsAllLong$condition[thresholdsAllLong$roving==FALSE]),
     list(thresholdsAllLong$name[thresholdsAllLong$roving==FALSE],
          thresholdsAllLong$session[thresholdsAllLong$roving==FALSE]),
     function(x) {
       abs(x[1][x[2]=='detection'] - x[1][x[2]=='identification'])
     })))
detIdNoRov <- melt(detIdNoRov, variable.name = "session", 
                 value.name = "noRov")

detId <- cbind(detIdRov, detIdNoRov)

wilcox.test(detIdNoRov$noRov, detIdRov$rov, paired=FALSE)

# t test
# ttestDetById <- t.test(meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='detection'],
#                        meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='identification'], paired=TRUE)

