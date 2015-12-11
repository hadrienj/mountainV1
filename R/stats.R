shap <- function(data, cond, sess, thresholdMax) {
  shapiro.test(subset(data,
                      condition==cond
                      & session==sess
                      & threshold<thresholdMax)
               $threshold)
}

