# Create data frame with the circles condition's variables only
data.mountain.circles <- data[,c("id", "time", "trialNum","CurXY",
                                 "trialNumCircles", "trialNumTotal",
                                 "tonePosX", "tonePosY", "sessionNum",
                                 "condition",  "result",	"targetTone",
                                 "screenWidth", "screenHeight")]
# Remove rows corresponding to the other conditions (condition
# column not containing the string 'circles')
data.mountain.circles <- data.mountain.circles[grep("circles",
                                                    data$condition),]
# Sort the data according to time
data.mountain.circles <- data.mountain.circles[order(
  data.mountain.circles$trialNumCircles),]

# Add duration variable to circles
# Create function to extract the last value of each matrix (= each trial)
# See above: extractDur <- function(x) tail(x[,3], n=1)
# Extract duration from the CurXY
data.mountain.circles$duration <- sapply(data.mountain.circles$CurXY, extractDur)

# Extract trial score if it doesn't exist
data.mountain.circles$scores <-
  (1 / (((data.mountain.circles$duration/100)+1)^2) + 1) *
  (600*(((100-data.mountain.circles$result)/100)^2))

# Convert to zoo type
zooCirclesAccuracy <- zoo(data.mountain.circles$result)
# Make moving average
data.mountain.circles$circlesAccuracyRoll <-rollmean(
  zooCirclesAccuracy,
  20,
  fill = NA,
  partial = FALSE,
  align="center")

# Convert to zoo type
zooCirclesDur <- zoo(data.mountain.circles$duration)
# Make moving average
data.mountain.circles$circlesDurRoll <- rollmean(
  zooCirclesDur,
  20,
  fill = NA,
  partial = FALSE,
  align="center")

# Convert to zoo type
zooCirclesScores <- zoo(data.mountain.circles$scores)
# Make moving average
data.mountain.circles$circlesScoresRoll <- rollmean(
  zooCirclesScores,
  20,
  fill = NA,
  partial = FALSE,
  align="center")

# Prepare accuracy plots
plotCirclesAccuracyRoll <- geom_line(data=data.mountain.circles,
                                     aes(x=trialNumCircles,
                                         y=circlesAccuracyRoll,
                                         color="Circles"))
plotCirclesAccuracy <- geom_line(data=data.mountain.circles,
                                 aes(x=trialNumCircles,
                                     y=result,
                                     color="Circles"),
                                 alpha=0.4)
# Prepare duration plots
plotCirclesDurRoll <- geom_line(data=data.mountain.circles,
                                aes(x=trialNumCircles,
                                    y=circlesDurRoll,
                                    color="Circles"))
plotCirclesDur <- geom_line(data=data.mountain.circles,
                            aes(x=trialNumCircles,
                                y=duration,
                                color="Circles"),
                            alpha=0.4)
# Prepare score plot
plotCirclesScoresRoll <- geom_line(data=data.mountain.circles,
                                   aes(x=trialNumCircles,
                                       y=circlesScoresRoll,
                                       color="Circles"))
plotCirclesScores <- geom_line(data=data.mountain.circles,
                               aes(x=trialNumCircles,
                                   y=scores,
                                   color="Circles"),
                               alpha=0.4)