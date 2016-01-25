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

## Different variances = use non parametric tests
wiltestDetById <- wilcox.test(meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='detection'],
            meanThresholdsSubjLong$threshold[
  meanThresholdsSubjLong$condition=='identification'], paired=TRUE)

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




# t test
# ttestDetById <- t.test(meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='detection'],
#                        meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='identification'], paired=TRUE)

