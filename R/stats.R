shap <- function(data, cond, sess, thresholdMax) {
  shapiro.test(subset(data,
                      condition==cond
                      & session==sess
                      & threshold<thresholdMax)
               $threshold)
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



# t test
# ttestDetById <- t.test(meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='detection'],
#                        meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='identification'], paired=TRUE)

