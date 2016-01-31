
# Prepare plots
plotThresholds <- ggplot(data=thresholdsAllLong,
                         aes(x=as.numeric(session),
                             y=threshold,
                             color=name,
                             linetype=condition),
                         alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ ., scale='free') +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsRov <- ggplot(data=thresholdsAllLongRov,
                         aes(x=as.numeric(session),
                             y=threshold,
                             color=name,
                             linetype=condition),
                         alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ ., scale='free') +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsNoRov <- ggplot(data=thresholdsAllLongNoRov,
                            aes(x=as.numeric(session),
                                y=threshold,
                                color=name,
                                linetype=condition),
                            alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ ., scale='free') +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsOneLog <- ggplot(data=thresholdsAllLong,
                               aes(x=as.numeric(session),
                                   y=threshold,
                                   color=name,
                                   linetype=condition),
                               alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_y_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsOneLogRov <- ggplot(data=thresholdsAllLongRov,
                               aes(x=as.numeric(session),
                                   y=threshold,
                                   color=name,
                                   linetype=condition),
                               alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  scale_y_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  theme(panel.margin = unit(3.5, "mm"))

plotThresholdsPercent <- ggplot(data=thresholdsAllPercentLong,
                                aes(x=as.numeric(session),
                                    y=threshold,
                                    color=name,
                                    linetype=condition),
                                alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(3.5, "mm"))

plotMeanThresholds <- ggplot(data=meanThresholdLong,
                             aes(x=session,
                                 y=threshold.mean,
                                 linetype=condition,
                                 colour=roving),
                             alpha = 0.3) +
  geom_line() +
  geom_ribbon(aes(ymin=threshold.mean-threshold.sem,
                  ymax=threshold.mean+threshold.sem,
                  fill=roving),
              alpha =0.15,
              colour=NA) +
  scale_colour_discrete(name="Experimental\nCondition",
                      breaks=c("ctrl", "trt1"),
                      labels=c("Control", "Treatment 1")) +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
#   annotate("text",
#            label = paste("n = ", length(levels(factor(thresholdsAllLong$name)))),
#            x = 3.5, y = 250, size = 4) +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotMeanThresholdsRov <- ggplot(data=meanThresholdLongRov,
                             aes(x=session,
                                 y=threshold.mean,
                                 linetype=condition),
                             alpha = 0.3) +
  geom_line() +
  geom_ribbon(aes(ymin=threshold.mean-threshold.sem,
                  ymax=threshold.mean+threshold.sem),
              alpha =0.2) +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  #   annotate("text",
  #            label = paste("n = ", length(levels(factor(thresholdsAllLong$name)))),
  #            x = 3.5, y = 250, size = 4) +
  theme(plot.title = element_text(vjust=2, lineheight=.6))


plotMeanThresholdsNoRov <- ggplot(data=meanThresholdLongNoRov,
                             aes(x=session,
                                 y=threshold.mean,
                                 linetype=condition),
                             alpha = 0.3) +
  geom_line() +
  geom_ribbon(aes(ymin=threshold.mean-threshold.sem,
                  ymax=threshold.mean+threshold.sem),
              alpha =0.2) +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  #   annotate("text",
  #            label = paste("n = ", length(levels(factor(thresholdsAllLong$name)))),
  #            x = 3.5, y = 250, size = 4) +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Mean thresholds in percentage of error
plotMeanThresholdsPerc <- ggplot(data=meanThresholdLong,
                             aes(x=session,
                                 y=(2^(threshold.mean/1200)-1)*100,
                                 linetype=condition),
                             alpha = 0.3) +
  geom_line() +
  geom_ribbon(aes(ymin=(2^(threshold.mean/1200)-1)*100-(2^(threshold.sem/1200)-1)*100,
                  ymax=(2^(threshold.mean/1200)-1)*100+(2^(threshold.sem/1200)-1)*100),
              alpha =0.2) +
  xlab("Sessions") +
  ylab("Thresholds (percentage of error)") +
  ggtitle("Mean threshold for detection and identification conditions") +
  #   annotate("text",
  #            label = paste("n = ", length(levels(factor(thresholdsAllLong$name)))),
  #            x = 3.5, y = 250, size = 4) +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotMeanThresholdInd <- ggplot(data=meanThresholdLong,
                               aes(x=session,
                                   y=threshold.mean,
                                   linetype=condition),
                               alpha = 0.3) +
  geom_line() +
  geom_ribbon(aes(ymin=threshold.mean-threshold.sem,
                  ymax=threshold.mean+threshold.sem),
              alpha =0.2) +
  geom_point(data=thresholdsAllLong,
             aes(x=session,
                 y=threshold,
                 color=condition),
             size=3.5) +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotMeanThresholdsPercent <- ggplot(data=meanThresholdPercentLong,
                                    aes(x=session,
                                        y=threshold,
                                        linetype=condition),
                                    alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  ggtitle("Mean threshold for detection and identification conditions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotDetByIdAll <- ggplot(meanThresholdsSubjLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(size=3.5) +
  coord_fixed() +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape(name = "Sessions") +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n for all subjects and all sessions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotDetById <- ggplot(thresholdsAllLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(aes(shape=as.character(session[condition=="identification"])),
             size=3.5) +
  coord_fixed() +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape(name = "Sessions") +
  scale_x_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(10, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n for all subjects and all sessions") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotDetByIdPrepost <- ggplot(thresholdAllPrepostLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(aes(shape=prepost[condition=="identification"]),
             size=3.5) +
  coord_fixed() +
  geom_path(arrow=arrow(length=unit(0.3,"cm"), ends = "first"),
            size=0.4, aes(group=name[condition=="identification"])) +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape_manual(name = "Sessions", values=c(1, 16),
                     breaks=c("pre-test","post-test")) +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n Pre vs. Post test") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotDetByIdPrepre <- ggplot(thresholdAllPrepreLong, aes(
  x=threshold[condition=="detection"],
  y=threshold[condition=="identification"],
  color=name[condition=="identification"])) +
  geom_point(aes(shape=prepre[condition=="identification"]),
             size=3.5) +
  coord_fixed() +
  geom_path(arrow=arrow(length=unit(0.3,"cm"), ends = "last"),
            size=0.4, aes(group=name[condition=="identification"])) +
  geom_abline(intercept = 0, slope = 1) +
  scale_colour_discrete(name = "Participants") +
  scale_shape_manual(name = "Sessions", values=c(16, 1),
                     breaks=c("first","second")) +
  scale_x_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  scale_y_continuous(trans=log_trans(),
                     limits=c(5, 600),
                     breaks=c(5, 10, 20, 50, 100, 200, 500)) +
  xlab("Detection threshold") +
  ylab("Identification threshold") +
  ggtitle("Detection against identification thresholds
          \n First vs. Second test") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))



# Prepare plots
## TrainSession==0 to avoid all the data of the longitudinal testing
plotDeltaF <- ggplot(data=data.threshold[data.threshold$trainSession==0,],
                     aes(x=trialNum,
                         y=deltaF,
                         color=factor(sessionNum)),
                     alpha = 0.4) +
  xlab("Trials") +
  ylab("DeltaF (cents)") +
  geom_line() +
  scale_color_discrete(name="Session") +
  facet_grid(name ~ task) +
  theme(panel.margin = unit(3.5, "mm")) +
  ggtitle("DeltaF of each participant and each session") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotDeltaFMeans <- ggplot(data=deltaFMeansLong,
                          aes(x=as.numeric(trialNum),
                              y=deltaF,
                              color=factor(sessionNum)),
                          alpha = 0.4) +
  geom_line() +
  scale_color_discrete(name="Session") +
  facet_grid(. ~ task) +
  xlab("Trials") +
  ylab("DeltaF (cents)") +
  ggtitle("Mean of deltaF") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))






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
  facet_grid(name ~ .) +
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


plotAccMean <- ggplot(data=yAxisMeanLong,
                      aes(x=trialNumYAxis,
                          y=valueAcc,
                          alpha = variableAcc)) +
  scale_alpha_manual(name="Display", labels=c("Raw values",
                                              "Rolling mean \n(10 values)"),
                     values=c(0.3, 1)) +
  scale_x_continuous(limits=c(0, 75)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_line()

plotDurMean <- ggplot(data=subset(yAxisMeanLong,
                                  valueAcc<3
                                  & trialNumYAxis>1),
                      aes(x=trialNumYAxis,
                          y=valueDur)) +
  scale_x_continuous(limits=c(0, 75)) +
  guides(color=FALSE) +
  xlab("Trials") +
  ylab("Duration (in seconds)") +
  geom_line()

# Accuracy by duration
plotAccByDur <- ggplot(data=data.mountain.yAxis,
                       aes(x=result,
                           y=duration,
                           color=name)) +
  geom_point(size=3.5) +
  xlab("Scores (percentage error)") +
  ylab("Duration (in seconds)") +
  ggtitle("Score in function of duration") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

# Path length by duration
plotLengthByDur <- ggplot(data=data.mountain.yAxis,
                          aes(x=pathLength,
                              y=duration,
                              color=name)) +
  geom_point(data = data.mountain.yAxis, aes(y = duration),
             size=3.5) +
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
  geom_point(size=3.5) +
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
  theme(panel.margin = unit(4.5, "mm")) +
  geom_hline(aes(yintercept=(2^(threshold/1200)-1)*100,
                 linetype=condition),
             meanThresholdsSubjLong,
             show_guide=TRUE) +
  guides(linetype = guide_legend("Frequency thresholds"))





plotAccThreshMean <- ggplot(data=yAxisAccMean,
                            aes(x=trialNumYAxis)) +
  scale_x_continuous(limits=c(0, 72)) +
  scale_y_continuous(limits=c(-5, 17)) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_line(aes(y=result,
                color = "Raw mean")) +
  geom_line(aes(y=YAxisAccuracyRoll,
                color='Rolling mean \n(10 values)')) +
  geom_line(aes(y=sdMean,
                color='Rolling SD \n(10 values)')) +
  geom_ribbon(aes(ymin=result-sd,
                  ymax=result+sd),
              alpha =0.2) +
  # legend
  geom_hline(aes(yintercept=(2^(mean/1200)-1)*100,
                 linetype="Detection"),
             meanThresholdsLong[meanThresholdsLong$condition == "detection",],
             show_guide=FALSE) +
  geom_hline(aes(yintercept=(2^(mean/1200)-1)*100,
                 linetype="Identification"),
             meanThresholdsLong[meanThresholdsLong$condition == "identification",],
             show_guide=FALSE) +
  geom_text(data=meanThresholdsLong[meanThresholdsLong$condition == "detection",],
            aes(68, (2^(mean/1200)-1)*100, label = 'Detection', vjust = -1), size = 4) +
  geom_text(data=meanThresholdsLong[meanThresholdsLong$condition == "identification",],
            aes(68, (2^(mean/1200)-1)*100, label = 'Identification', vjust = -1), size = 4) +
  scale_colour_manual("", 
                      breaks = c("Raw mean", "Rolling mean \n(10 values)", 'Rolling SD \n(10 values)'),
                      values = c("grey", "black", "royalblue1")) +
  theme(legend.text=element_text(size=12),
        legend.title=element_text(size=12),
        axis.title=element_text(size=12),
        legend.key.height=unit(2,"line"))



####### Accuracy by frequency
plotAccByFreq <- ggplot(data=data.mountain.yAxis,
                        aes(x=result,
                            y=targetTone,
                            color=name)) +
  geom_point(size=3.5) +
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
  geom_point(size=3.5) +
  facet_grid(name ~ .) +
  theme(panel.margin = unit(4.5, "mm")) +
  scale_y_continuous(limits=c(0, 5000))


plotPathCoord <- ggplot(data=subset(pathLength,
                                    trialNumYAxis==seq(1, 100, 20)),
                        aes(x=time,
                            y=YNorm,
                            color=trialNumYAxis)) +
  geom_line(size = 0.8) +
  xlab("Time (in milliseconds)") +
  ylab("Y path (in pixels)") +
  scale_y_continuous(limits=c(-700, 700)) +
  scale_x_continuous(limits=c(0, 30000)) +
  #   geom_hline(aes(yintercept=yTopDist, color=as.character(trialNumYAxis))) +
  facet_grid(name ~ .) +
  ggtitle("Normalize Y path in function of time") +
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

plotCrossNumMean <- ggplot(data=crossNumMean,
                           aes(x=trialNum,
                               y=result)) +
  xlab("Trials") +
  ylab("Accuracy (in percent error)") +
  geom_line()


plotSdDiff <- ggplot(data=yAxisEff,
                     aes(x=trialNum,
                         y=se,
                         color=name)) +
  scale_y_continuous(limits=c(0, 2)) +
  scale_x_continuous(limits=c(0, 75)) +
  ylab("Standard deviation from the mean") +
  xlab("Trials") +
  geom_line()


plotSdDiffMean <- ggplot(data=yAxisLongMean,
                         aes(x=trialNum,
                             y=se)) +
  xlab("Trials") +
  ylab("Standard deviation") +
  scale_x_continuous(limits=c(0, 75)) +
  geom_line()



# Accuracy by detection threshold
plotMountainByThreshDet <- ggplot(data=mountainByThresh,
                                  aes(x=mountain,
                                      y=detection)) +
  geom_point(size=3.5) +
  #   scale_y_continuous(limits=c(0, 75)) +
  #   scale_x_continuous(limits=c(0.5, 2)) +
  geom_smooth(method=lm) +
  xlab("Mountain accuracy (percentage error)") +
  ylab("Detection threshold") +
  ggtitle("Mountain accuracy by detection threshold") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

plotMountainByThreshId <- ggplot(data=mountainByThresh,
                                 aes(x=mountain,
                                     y=identification)) +
  geom_point(size=3.5) +
  #   scale_y_continuous(limits=c(0, 75)) +
  #   scale_x_continuous(limits=c(0.5, 2)) +
  geom_smooth(method=lm) +
  xlab("Mountain accuracy (percentage error)") +
  ylab("Identification threshold") +
  ggtitle("Mountain accuracy by identification threshold") +
  theme(plot.title = element_text(vjust=2, lineheight=.6))

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
  scale_y_continuous(limits=c(0, 600)) +
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
  ylab("Thresholds (in cents)") +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 500)) +
  geom_vline(xintercept = c(5, 9, 13, 17), linetype="longdash", color="azure4")

# Threshold in percentage of error
plotThresholdsLongiMeanPerc <- ggplot(data=thresholdsLongiMeanLong,
                                  aes(x=as.numeric(session),
                                      y=(2^(threshold/1200)-1)*100,
                                      linetype=condition),
                                  alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds (in percentage of error)") +
  scale_x_continuous(breaks=seq(0, 21, 1)) +
  scale_y_continuous(limits=c(0, 20)) +
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
  scale_y_continuous(limits=c(0, 10)) +
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

###### Test for interactive charts

n1 <- nPlot(threshold ~ session,
            data = thresholdsAllLongNoRov,
            group = 'name',
            type = "lineChart")
n1$addFilters("condition")
n1

nplotThresholdsNoRov <- nPlot(data=thresholdsAllLongNoRov,
       aes(x=as.numeric(session),
           y=threshold,
           color=name,
           linetype=condition),
       alpha = 0.4) +
  geom_line() +
  xlab("Sessions") +
  ylab("Thresholds") +
  facet_grid(name ~ ., scale='free') +
  theme(panel.margin = unit(3.5, "mm"))
