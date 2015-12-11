library(psyphy)

test <- aggregate(score ~ deltaF, data=subset(data.threshold,
                                              reversals>4
                                              & name=="ss28"
                                              & task=="detection"
                                              & (sessionNum==0
                                                 | sessionNum==1)),
                  FUN=mean)
test1 <- aggregate(score ~ deltaF, data=subset(data.threshold,
                                               reversals>4
                                               & name=="ss28"
                                               & task=="detection"
                                               & (sessionNum==2
                                                  | sessionNum==3)),
                   FUN=mean)

test <- aggregate(score ~ deltaF + name + task,
                  data.threshold,
                  FUN=function(x) x)

test <- subset(data.threshold,
               sessionNum==0
               | sessionNum==1,
               select=c(deltaF, score, task, name, sessionNum))
row.names(test) <- NULL



model.det.ab21 <- glm(score ~ log10(deltaF),
                      family=binomial(mafc.logit(2)),
                      subset(test, name=="ab21" & task=="detection"))
predi.det.ab21 <- predict(model.det.ab21,
                          subset(test, name=="ab21" & task=="detection"),
                          type="response",
                          se=TRUE)

model.det.ss28.pre <- glm(score ~ log10(deltaF),
                          family=binomial(mafc.logit(2)),
                          subset(test, name=="ss28" & task=="detection"
                                 & (sessionNum==0 | sessionNum==1)))
predi.det.ss28.pre <- predict(model.det.ss28.pre,
                              subset(test, name=="ss28" & task=="detection"
                                     & (sessionNum==0 | sessionNum==1)),
                              type="response",
                              se=TRUE)
det.ss28.pre.means <- with(subset(test, name=="ss28" & task=="detection"
                                  & (sessionNum==0 | sessionNum==1)),
                           data.frame(score=tapply(score, deltaF, mean)))
det.ss28.pre.means <- data.frame(deltaF=rownames(det.ss28.pre.means),
                                 det.ss28.pre.means)
row.names(det.ss28.pre.means) <- NULL

model.det.ss28.post <- glm(score ~ log10(deltaF),
                           family=binomial(mafc.logit(2)),
                           subset(test, name=="ss28" & task=="detection"
                                  & (sessionNum==2 | sessionNum==3)))
predi.det.ss28.post <- predict(model.det.ss28.post,
                               subset(test, name=="ss28" & task=="detection"
                                      & (sessionNum==2 | sessionNum==3)),
                               type="response",
                               se=TRUE)
det.ss28.post.means <- with(subset(test, name=="ss28" & task=="detection"
                                   & (sessionNum==2 | sessionNum==3)),
                            data.frame(score=tapply(score, deltaF, mean)))
det.ss28.post.means <- data.frame(deltaF=rownames(det.ss28.post.means),
                                  det.ss28.post.means)
row.names(det.ss28.post.means) <- NULL



model<-glm(score ~ log10(deltaF),
           family=binomial(mafc.logit(2)),
           subset(test, name==name))
model[[2]]<-glm(score ~ log10(deltaF),
                family=binomial(mafc.logit(2)),
                test)

function(x) {
  model[[x]]<-glm(score ~ log10(deltaF),
                  family=binomial(mafc.logit(2)),
                  test)
}
predicted.data <- predict(test, newdata = test, type="response", se=TRUE)

testMeans <- with(test, data.frame(score=tapply(score, deltaF, mean)))
testMeans <- data.frame(deltaF=rownames(testMeans),
                        testMeans)
row.names(testMeans) <- NULL

ggplot() +
  geom_point(aes(x=as.numeric(levels(det.ss28.post.means$deltaF)),
                 y=det.ss28.post.means$score)) +
  geom_line(aes(x=subset(test, name=="ss28" & task=="detection"
                         & (sessionNum==2 | sessionNum==3))$deltaF,
                y=predi.det.ss28.post$fit)) +
  scale_x_continuous(limits=c(0, 50))



data.threshold.mod <- subset(data.threshold,
                             (sessionNum==0
                              | sessionNum==1
                              | sessionNum==2
                              | sessionNum==3),
                             select=c(deltaF, score,
                                      task, name, sessionNum))
data.threshold.mod$sessionNum <- factor(data.threshold.mod$sessionNum)
levels(data.threshold.mod$sessionNum) <- c("pre", "pre", "post", "post")

modeling <- function(name1, task1, session) {
  predict(
    glm(score ~ log10(deltaF),
        family=binomial(mafc.logit(2)),
        subset(data.threshold.mod,
               name==name1
               & task==task1
               & sessionNum==session)),
    newdata = subset(data.threshold.mod,
                     name==name1
                     & task==task1
                     & sessionNum==session),
    type="response",
    se=TRUE)
}

modeling1 <- function(dF, sco) {
  predict(
    glm(sco ~ log10(dF),
        family=binomial(mafc.logit(2)),
        data.threshold.mod),
    newdata = data.threshold.mod,
    type="response",
    se=TRUE)
}
modeling2 <- function(data) {
  predict(
    glm(data$score ~ log10(data$deltaF),
        family=binomial(mafc.logit(2)),
        data),
    newdata = data,
    type="response",
    se=TRUE)
}

modeling2(subset(ab, name=="ss28"
                 & sessionNum=="post"
                 & task=="detection"))

sapply(1:11,
       FUN=function(x) modeling2(subset(ab, name==ddply(data.threshold.mod, c("name",
                                                                              "task",
                                                                              "sessionNum"),
                                                        function(y) colnames(y))[x,1]
                                        & sessionNum==ddply(data.threshold.mod, c("name",
                                                                                  "task",
                                                                                  "sessionNum"),
                                                            function(y) colnames(y))[x,3]
                                        & task==ddply(data.threshold.mod, c("name",
                                                                            "task",
                                                                            "sessionNum"),
                                                      function(y) colnames(y))[x,2])))

ab <- data.frame(ddply(data.threshold.mod, c("name",
                                             "task",
                                             "sessionNum"),
                       function(x) cbind(x, modeling1(x[[1]], x[[2]]))))

a <- data.frame(aggregate(data.threshold.mod$deltaF,
                          list(data.threshold.mod$name,
                               data.threshold.mod$task,
                               data.threshold.mod$sessionNum),
                          FUN=function(x) x))
colnames(a) <- c("name", "task", "sessionNum", "deltaF")

b <- data.frame(aggregate(data.threshold.mod$score,
                          list(data.threshold.mod$name,
                               data.threshold.mod$task,
                               data.threshold.mod$sessionNum),
                          FUN=function(x) x))
colnames(b) <- c("name", "task", "sessionNum", "score")

ab <- cbind(a, b)

test <- data.frame(name=rep(levels(factor(data.threshold.mod$name)),
                            2),
                   task=c(rep("detection", 8),
                          rep("identification", 8)),
                   sessionNum=c(rep("pre", 16), rep("post", 16)),
                   t(mapply(modeling1,
                            ab$deltaF, ab$score)))
row.names(test) <- NULL

c <- list(ss28.det.pre=modeling1(subset(ab, name=="ss28"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(ab, name=="ss28"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          ss28.det.post=modeling1(subset(ab, name=="ss28"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(ab, name=="ss28"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit)

ggplot() +
  geom_point(data=data.threshold.mod,
             aes(x=deltaF,
                 y=score,
                 color=sessionNum)) +
  geom_line(aes(x=subset(data.threshold.mod,
                         name=="ss28"
                         & task=="identification"
                         & sessionNum=="pre")$deltaF,
                y=modeling1(subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="pre"
                                   & task=="identification",
                                   select=deltaF)[[1]],
                            subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="pre"
                                   & task=="identification",
                                   select=score)[[1]])$fit)) +
  geom_line(aes(x=subset(data.threshold.mod,
                         name=="ss28"
                         & task=="identification"
                         & sessionNum=="post")$deltaF,
                y=modeling1(subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="post"
                                   & task=="identification",
                                   select=deltaF)[[1]],
                            subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="post"
                                   & task=="identification",
                                   select=score)[[1]])$fit), color="red") +
  scale_x_continuous(limits=c(0, 100))




modeling1(subset(ab, name=="ss28"
                 & sessionNum=="pre"
                 & task=="detection",
                 select=deltaF)[[1]][[1]],
          subset(ab, name=="ss28"
                 & sessionNum=="pre"
                 & task=="detection",
                 select=score)[[1]][[1]])$fit



subThresh <- function(name, task, sessions)
  subset(data.threshold,
         name==name
         & task==task
         & (sessionNum==sessions[[1]]
            | sessionNum==sessions[[2]]),
         select=c(deltaF, score, task, name, sessionNum))



test <- subset(data.threshold,
               sessionNum==0
               | sessionNum==1,
               select=c(deltaF, score, task, name, sessionNum))


test$deltaFBin <- stats.bin(test$deltaF,test$deltaF,10)
test$scoreBin <- stats.bin(test$score,test$score,10)

ave(test$deltaF,
    cut(test$deltaF,10),
    FUN=mean)


model1<-glm(test1$score ~ test1$deltaF, family=binomial(probit))
predicted.data1 <- predict(model1, newdata = test1, type="link", se=TRUE)

new.data <- cbind(test, predicted.data)
new.data1 <- cbind(test1, predicted.data1)

# Calculate confidence intervals
std <- qnorm(0.95 / 2 + 0.5)
new.data$ymin <- model$family$linkinv(new.data$fit - std * new.data$se)
new.data$ymax <- model$family$linkinv(new.data$fit + std * new.data$se)
new.data$fit <- model$family$linkinv(new.data$fit)  # Rescale to 0-1

new.data1$ymin <- model1$family$linkinv(new.data1$fit - std * new.data1$se)
new.data1$ymax <- model1$family$linkinv(new.data1$fit + std * new.data1$se)
new.data1$fit <- model$family$linkinv(new.data1$fit)  # Rescale to 0-1

ggplot() +
  geom_point(data=new.data,
             aes(x=deltaF,
                 y=score),
             alpha = 0.4) +
  geom_line(data=new.data,
            aes(x=deltaF,
                y=fit,
                ymin=ymin,
                ymax=ymax,
                linetype="solid"), alpha=0.5) +
  geom_line(data=new.data1,
            aes(x=deltaF,
                y=fit,
                ymin=ymin,
                ymax=ymax,
                linetype="dashed"), alpha=0.5) +
  xlab("DeltaF (cents)") +
  ylab("Proportion correct") +
  ggtitle("Psychometric function") +
  scale_x_continuous(limits=c(0, 100)) +
  theme(plot.title = element_text(vjust=2, lineheight=.6))


ggplot() +
  geom_line(aes(x=x$deltaF,
                y=normcdf(param,x)))


test <- subset(data.threshold,
               name=="ss28"
               & task=="detection"
               & (sessionNum==0
                  | sessionNum==1),
               select=c(deltaF, score))
test$deltaF <- stats.bin(test$deltaF,test$deltaF,10)
test$score <- stats.bin(test$deltaF,test$score,10)



c <- list(ss28.det.pre=modeling1(subset(data.threshold.mod, name=="ss28"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="ss28"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          ss28.det.post=modeling1(subset(data.threshold.mod, name=="ss28"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="ss28"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          lj01.det.pre=modeling1(subset(data.threshold.mod, name=="lj01"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="lj01"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          lj01.det.post=modeling1(subset(data.threshold.mod, name=="lj01"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="lj01"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          ab21.det.pre=modeling1(subset(data.threshold.mod, name=="ab21"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="ab21"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          ab21.det.post=modeling1(subset(data.threshold.mod, name=="ab21"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="ab21"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          ll07.det.pre=modeling1(subset(data.threshold.mod, name=="ll07"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="ll07"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          ll07.det.post=modeling1(subset(data.threshold.mod, name=="ll07"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="ll07"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          df22.det.pre=modeling1(subset(data.threshold.mod, name=="df22"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="df22"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          df22.det.post=modeling1(subset(data.threshold.mod, name=="df22"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="df22"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          gw25.det.pre=modeling1(subset(data.threshold.mod, name=="gw25"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="gw25"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          gw25.det.post=modeling1(subset(data.threshold.mod, name=="gw25"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="gw25"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          mn15.det.pre=modeling1(subset(data.threshold.mod, name=="mn15"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="mn15"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          mn15.det.post=modeling1(subset(data.threshold.mod, name=="mn15"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="mn15"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          el20.det.pre=modeling1(subset(data.threshold.mod, name=="el20"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="el20"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          el20.det.post=modeling1(subset(data.threshold.mod, name=="el20"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="el20"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit,
          dd04.det.pre=modeling1(subset(data.threshold.mod, name=="dd04"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=deltaF)[[1]],
                                 subset(data.threshold.mod, name=="dd04"
                                        & sessionNum=="pre"
                                        & task=="detection",
                                        select=score)[[1]])$fit,
          dd04.det.post=modeling1(subset(data.threshold.mod, name=="dd04"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=deltaF)[[1]],
                                  subset(data.threshold.mod, name=="dd04"
                                         & sessionNum=="post"
                                         & task=="detection",
                                         select=score)[[1]])$fit)


ggplot() +
  geom_point(data=data.threshold.mod,
             aes(x=deltaF,
                 y=score,
                 color=sessionNum)) +
  geom_line(aes(x=subset(data.threshold.mod,
                         name=="ss28"
                         & sessionNum=="pre")$deltaF,
                y=modeling1(subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="pre",
                                   select=deltaF)[[1]],
                            subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="pre",
                                   select=score)[[1]])$fit)) +
  geom_line(aes(x=subset(data.threshold.mod,
                         name=="ss28"
                         & sessionNum=="post")$deltaF,
                y=modeling1(subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="post",
                                   select=deltaF)[[1]],
                            subset(data.threshold.mod, name=="ss28"
                                   & sessionNum=="post",
                                   select=score)[[1]])$fit), color="red") +
  scale_x_continuous(limits=c(0, 100))


