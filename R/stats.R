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

# t test
# ttestDetById <- t.test(meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='detection'],
#                        meanThresholdsSubjLong$threshold[
#   meanThresholdsSubjLong$condition=='identification'], paired=TRUE)