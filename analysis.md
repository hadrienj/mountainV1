---
title: "Auditory Mountain"
output:
  html_document:
    toc: yes
    css: style.css
date: "November 28 2015"
---

<!--pandoc
t: html
s:
mathjax:
o: analysis.html
-->


















# Individual analyses

## Frequency threshold task

The frequency thresholds are calculated from an adaptive procedure where deltaF is decreased when a wrong answer is provided and increased for a right answer.

### Detection and identification deltaF

The evolution of the delta F values across trials for the detection and identification tasks is ploted bellow:

<a name="plotDeltaF"></a>![](figures/plotDeltaF-1.svg) 

 on the figure <a href="#plotDeltaF">1</a>
 
### Thresholds

#### Each participant among sessions

The thresholds are calculated from the DeltaF values corresponding to the last 10 reversals. The procedure was repeated two times before training (sessions 1 and 2) and two times after (sessions 3 and 4). The figure bellow shows these thresholds across sessions for the detection and identification conditions:    

![](figures/plotThresholds-1.svg) 

![](figures/plotThresholdsOneLog-1.svg) 

#### Each participant among sessions in percent of the first session

![](figures/plotThresholdsPercent-1.svg) 

### Detection threshold in function of identification threshold

#### For each session

![](figures/plotDetById-1.svg) 

#### Pre vs. post tests

The threshold scores are the means of the four sessions (two pre-test and two post-test)

![](figures/plotDetByIdPrepost-1.svg) 

#### First vs. second tests

![](figures/plotDetByIdPrepre-1.svg) 

## Auditory mountain task

Here are the plots of scores, accuracy and duration in function of trials. The accuracy is the difference between the choosen tone and the highest tone. The duration is the length in seconds of each trial from the begining of the sound to the answer. The score is a mixed value calculated from accuracy and duration according to this equation:

$$ (\frac{1}{(\frac{duration}{100}+1)^2} + 1) \times 600 \times (\frac{accuracy}{100})^2 $$

***

Thus, the time score is a multiplier between 1 for a very long trial and 2 for a very short one (few seconds). Thus, the accuracy score can be doubled with speed. 

The accuracy score is 600 maximum (the idea was to make a score in order to have the pleasure to cross 1000 points when the performance is good). For accuracy and time, the power function is used to provide the maximum of points near the perfect score and have a lot of difference when it is harder.

UPDATE:

The equation used from va01 (20/07/15) was modified to have a more steeper curve and invite people to be more accurate and avoid the strategy to make a lot of trial quickly and win a lot of points:

$$ (\frac{1}{(\frac{duration}{100}+1)^2} + 1) \times 600 \times (\frac{accuracy}{100})^6 $$

### Participant's scores

![](figures/plotScores-1.svg) 

### Accuracy of trials

![](figures/plotAcc-1.svg) 

![](figures/plotAccOne-1.svg) 

### Durations of trials

![](figures/plotDur-1.svg) 

### Path coordinates

![](figures/plotPathCoord-1.svg) 

### Number of target crossings

The number of target crossing in the auditory mountain is the number of time the participant cross the target.

![](figures/plotCrossNum-1.svg) 

### Accuracy in function of duration for each trial

The variability of the results is not associated with duration. Each point is a trial.

![](figures/plotAccByDur-1.svg) 

### Path length in function of duration for each trial

A correlation seems to exists between the length of the displacement on the screen and the duration of the trial

![](figures/plotLengthByDur-1.svg) 

### Accuracy in function of frequency of the target tone

The frequencies used in the mountain task are randomly taken from 400 Hz to 2400 Hz.

![](figures/plotAccByFreq-1.svg) 

### Comparison of frequency thresholds and accuracy

![](figures/plotAccThresh-1.svg) 

![](figures/plotAccThreshMean-1.svg) 


# Global analyses

## Frequency threshold task



### Mean of participant's thresholds

The mean thresholds are calculated from all participant's deltaF for each session (first and second in pre-test and third and fourth in post-test) and condition (detection and identification).


![](figures/plotMeanThresholds-1.svg) 

### Mean of participant's thresholds (percent of the first session)

Thresholds are also calculated in percent of the first session deltaF.

![](figures/plotMeanThresholdsPercent-1.svg) 

## Auditory mountain task

### Mean accuracy of trials

![](figures/plotAccMean-1.svg) 

### Correlation between mountain task accuracy and frequency thresholds

#### Identification frequency threhsold

![](figures/plotMountainByThreshId-1.svg) 

#### Detection frequency threhsold

![](figures/plotMountainByThreshDet-1.svg) 

# Longitudinal analysis

Two participants (va01 and df22) who did the experiment were invited to do four other sessions (one a day) identical to the the first session (pre-test, training, post-test).

The protocol was also identical but the participants were told that the better one could win 10 euros more and that the total score would be calculated from all the training sessions and all the threshold measures.

Thus, the equation used to calculate the total score take into account the global scores to the mountain task of each session, the mean accuracy of all mountain task sessions and the results to each threshold tasks in this way:

$$ ScoreTotal + (1000 \times meanAccuracy) + \frac{20 000 000}{deltaFIdentification} + \frac{20 000 000}{deltaFDetection} $$



#### va01: {.lessEmphasized}

$$ 0 + (1000 \times ) + \frac{20 000 000}{NaN} + \frac{20 000 000}{NaN} =  $$

#### df22: {.lessEmphasized}
$$ 0 + (1000 \times ) + \frac{20 000 000}{NaN} + \frac{20 000 000}{NaN} =  $$

## Frequency threshold task

The frequency threshold tests are done before and after each training session. The dotted vertical lines correspond to each first threshold task.

### All Subjects

![](figures/plotThresholdsLongi-1.svg) 

#### Mean

![](figures/plotThresholdsLongiMean-1.svg) 

### All Subjects percent

![](figures/plotThresholdsLongiPercent-1.svg) 

### Mean percent

![](figures/plotMeanThresholdsLongiPercent-1.svg) 

## Auditory mountain task

### Participant's scores

![](figures/plotScoresLongi-1.svg) 

### Accuracy of trials

![](figures/plotAccLongi-1.svg) 

### Durations of trials

![](figures/plotDurLongi-1.svg) 


# Auditory mountain as a frequency threshold measure

We calculated the efficiency of the auditory mountain task to give an estimate of the frequency threshold. It represents for each trial and each participant the difference between the whole mean of accuracy and the mean from trial 1 to the one presented. This difference is expressed in standard deviation (calculated with the whole trials of each participant). For instance, the value of the trial 21 for mn15 is around one standard deviation. This means that for this participant, the mean of the 21 first trials is away of the global mean by one standard deviation.

**Reference:** Schlauch, R. S., & Rose, R. M. (1990). Two‐, three‐, and four‐interval forced‐choice staircase procedures: Estimator bias and efficiency. *The Journal of the Acoustical Society of America*, 88(2), 732–740.


Here is the code used to compute these sd:


```r
# Create a vector with the cumulative mean of accuracy for each participant
yAxisEff <- yAxisEff %>%
  group_by(name) %>%
  mutate(
    roll=cummean(accuracy),
    mean=mean(accuracy),
    sd=sd(accuracy),
    # For each observation the difference between the cumulative mean
    # and the mean is calculated in sd
    se=abs(roll-mean)/sd)
```

and here is the form of the table created with the code above:


-------------------------------------------------------
 trialNum   name   accuracy   roll   mean   sd     se  
---------- ------ ---------- ------ ------ ----- ------
    3       ab21    51.77    51.77  6.212  7.599 5.996 

    4       ab21    1.667    26.72  6.212  7.599 2.699 

    5       ab21    6.267     19.9  6.212  7.599 1.802 

    6       ab21     1.75    15.36  6.212  7.599 1.205 

    7       ab21    0.1227   12.32  6.212  7.599 0.8033

    8       ab21    29.76    15.22  6.212  7.599 1.186 
-------------------------------------------------------

Table: yAxisEff

![](figures/plotSdDiff-1.svg) 

The same thing can be done with the mean among participants for each trial.



# Statistical tests

Test of normality for each session and condition


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.5


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.8, p-value = 0.1


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.5


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.1


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.8, p-value = 0.02


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.6


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.08


	Shapiro-Wilk normality test

data:  subset(data, condition == cond & session == sess & threshold <     thresholdMax)$threshold
W = 0.9, p-value = 0.08

<link rel='stylesheet' href=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/css/nv.d3.css>
<link rel='stylesheet' href=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/css/rNVD3.css>
<script type='text/javascript' src=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/js/jquery-1.8.2.min.js></script>
<script type='text/javascript' src=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/js/d3.v3.min.js></script>
<script type='text/javascript' src=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/js/nv.d3.min-new.js></script>
<script type='text/javascript' src=/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/nvd3/js/fisheye.js></script> 
 <style>
  .rChart {
    display: block;
    margin-left: auto; 
    margin-right: auto;
    width: 800px;
    height: 400px;
  }  
  </style>
<div id = 'chart10a562554dd1f' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart10a562554dd1f()
    });
    function drawchart10a562554dd1f(){  
      var opts = {
 "dom": "chart10a562554dd1f",
"width":    800,
"height":    400,
"x": "trialNumYAxis",
"y": "value",
"group": "name",
"type": "lineChart",
"id": "chart10a562554dd1f" 
},
        data = [
 {
 "id": "dataTrial0",
"name": "dd04",
"trialNumYAxis": 0,
"variable": "result",
"value": 3.466756303067 
},
{
 "id": "dataTrial1",
"name": "dd04",
"trialNumYAxis": 2,
"variable": "result",
"value": 4.819175205993 
},
{
 "id": "dataTrial2",
"name": "dd04",
"trialNumYAxis": 3,
"variable": "result",
"value": 2.358364658692 
},
{
 "id": "dataTrial3",
"name": "dd04",
"trialNumYAxis": 4,
"variable": "result",
"value": 0.9752166380795 
},
{
 "id": "dataTrial4",
"name": "dd04",
"trialNumYAxis": 5,
"variable": "result",
"value": 1.474396774621 
},
{
 "id": "dataTrial5",
"name": "dd04",
"trialNumYAxis": 6,
"variable": "result",
"value": 9.308752468386 
},
{
 "id": "dataTrial6",
"name": "dd04",
"trialNumYAxis": 7,
"variable": "result",
"value": 1.723201588774 
},
{
 "id": "dataTrial7",
"name": "dd04",
"trialNumYAxis": 8,
"variable": "result",
"value": 1.011057039621 
},
{
 "id": "dataTrial8",
"name": "dd04",
"trialNumYAxis": 9,
"variable": "result",
"value": 2.851143513961 
},
{
 "id": "dataTrial9",
"name": "dd04",
"trialNumYAxis": 10,
"variable": "result",
"value": 3.949565347557 
},
{
 "id": "dataTrial10",
"name": "dd04",
"trialNumYAxis": 11,
"variable": "result",
"value": 13.49889259071 
},
{
 "id": "dataTrial11",
"name": "dd04",
"trialNumYAxis": 12,
"variable": "result",
"value": 2.479044623406 
},
{
 "id": "dataTrial12",
"name": "dd04",
"trialNumYAxis": 13,
"variable": "result",
"value": 6.631507198486 
},
{
 "id": "dataTrial13",
"name": "dd04",
"trialNumYAxis": 14,
"variable": "result",
"value": 1.491930279442 
},
{
 "id": "dataTrial14",
"name": "dd04",
"trialNumYAxis": 15,
"variable": "result",
"value": 13.34740170003 
},
{
 "id": "dataTrial15",
"name": "dd04",
"trialNumYAxis": 16,
"variable": "result",
"value": 18.94309192416 
},
{
 "id": "dataTrial16",
"name": "dd04",
"trialNumYAxis": 17,
"variable": "result",
"value": 0.9944954791673 
},
{
 "id": "dataTrial17",
"name": "dd04",
"trialNumYAxis": 18,
"variable": "result",
"value": 8.647788197104 
},
{
 "id": "dataTrial18",
"name": "dd04",
"trialNumYAxis": 19,
"variable": "result",
"value": 1.018311607826 
},
{
 "id": "dataTrial19",
"name": "dd04",
"trialNumYAxis": 20,
"variable": "result",
"value": 11.70379121784 
},
{
 "id": "dataTrial20",
"name": "dd04",
"trialNumYAxis": 21,
"variable": "result",
"value": 2.162355061196 
},
{
 "id": "dataTrial21",
"name": "dd04",
"trialNumYAxis": 22,
"variable": "result",
"value": 7.832801858244 
},
{
 "id": "dataTrial22",
"name": "dd04",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.448655556121 
},
{
 "id": "dataTrial23",
"name": "dd04",
"trialNumYAxis": 24,
"variable": "result",
"value": 3.557251663365 
},
{
 "id": "dataTrial24",
"name": "dd04",
"trialNumYAxis": 25,
"variable": "result",
"value": 8.200885858408 
},
{
 "id": "dataTrial25",
"name": "dd04",
"trialNumYAxis": 26,
"variable": "result",
"value": 20.63057204586 
},
{
 "id": "dataTrial26",
"name": "dd04",
"trialNumYAxis": 27,
"variable": "result",
"value": 9.602473583345 
},
{
 "id": "dataTrial27",
"name": "dd04",
"trialNumYAxis": 28,
"variable": "result",
"value": 0.6906926866563 
},
{
 "id": "dataTrial28",
"name": "dd04",
"trialNumYAxis": 29,
"variable": "result",
"value": 4.594910892559 
},
{
 "id": "dataTrial29",
"name": "dd04",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.4864714029165 
},
{
 "id": "dataTrial30",
"name": "dd04",
"trialNumYAxis": 31,
"variable": "result",
"value": 3.186065543381 
},
{
 "id": "dataTrial31",
"name": "dd04",
"trialNumYAxis": 32,
"variable": "result",
"value": 3.179361556408 
},
{
 "id": "dataTrial32",
"name": "dd04",
"trialNumYAxis": 33,
"variable": "result",
"value": 1.602539052906 
},
{
 "id": "dataTrial33",
"name": "dd04",
"trialNumYAxis": 34,
"variable": "result",
"value": 7.032644371872 
},
{
 "id": "dataTrial34",
"name": "dd04",
"trialNumYAxis": 35,
"variable": "result",
"value": 10.21354646179 
},
{
 "id": "dataTrial35",
"name": "dd04",
"trialNumYAxis": 36,
"variable": "result",
"value": 3.547850046539 
},
{
 "id": "dataTrial36",
"name": "dd04",
"trialNumYAxis": 37,
"variable": "result",
"value": 2.613536680628 
},
{
 "id": "dataTrial37",
"name": "dd04",
"trialNumYAxis": 38,
"variable": "result",
"value": 2.849388441825 
},
{
 "id": "dataTrial38",
"name": "dd04",
"trialNumYAxis": 39,
"variable": "result",
"value": 12.23938987688 
},
{
 "id": "dataTrial39",
"name": "dd04",
"trialNumYAxis": 40,
"variable": "result",
"value": 0.374160035593 
},
{
 "id": "dataTrial40",
"name": "dd04",
"trialNumYAxis": 41,
"variable": "result",
"value": 0.01175677783321 
},
{
 "id": "dataTrial41",
"name": "dd04",
"trialNumYAxis": 42,
"variable": "result",
"value": 12.79100495772 
},
{
 "id": "dataTrial42",
"name": "dd04",
"trialNumYAxis": 43,
"variable": "result",
"value": 10.49094405081 
},
{
 "id": "dataTrial43",
"name": "dd04",
"trialNumYAxis": 44,
"variable": "result",
"value": 1.128373834301 
},
{
 "id": "dataTrial44",
"name": "dd04",
"trialNumYAxis": 45,
"variable": "result",
"value":  5.23778205159 
},
{
 "id": "dataTrial45",
"name": "dd04",
"trialNumYAxis": 46,
"variable": "result",
"value": 3.431574331418 
},
{
 "id": "dataTrial46",
"name": "dd04",
"trialNumYAxis": 47,
"variable": "result",
"value": 5.269040000227 
},
{
 "id": "dataTrial47",
"name": "dd04",
"trialNumYAxis": 48,
"variable": "result",
"value": 11.01038702261 
},
{
 "id": "dataTrial48",
"name": "dd04",
"trialNumYAxis": 49,
"variable": "result",
"value": 2.001917553946 
},
{
 "id": "dataTrial49",
"name": "dd04",
"trialNumYAxis": 50,
"variable": "result",
"value": 13.27390908742 
},
{
 "id": "dataTrial50",
"name": "dd04",
"trialNumYAxis": 51,
"variable": "result",
"value": 6.616887310751 
},
{
 "id": "dataTrial51",
"name": "dd04",
"trialNumYAxis": 52,
"variable": "result",
"value": 7.976776700068 
},
{
 "id": "dataTrial52",
"name": "dd04",
"trialNumYAxis": 53,
"variable": "result",
"value": 5.419729604517 
},
{
 "id": "dataTrial53",
"name": "dd04",
"trialNumYAxis": 54,
"variable": "result",
"value": 7.763836138578 
},
{
 "id": "dataTrial54",
"name": "dd04",
"trialNumYAxis": 55,
"variable": "result",
"value": 1.682201529001 
},
{
 "id": "dataTrial55",
"name": "dd04",
"trialNumYAxis": 56,
"variable": "result",
"value": 6.549697189487 
},
{
 "id": "dataTrial56",
"name": "dd04",
"trialNumYAxis": 57,
"variable": "result",
"value": 11.96748392496 
},
{
 "id": "dataTrial57",
"name": "dd04",
"trialNumYAxis": 58,
"variable": "result",
"value": 2.046725711665 
},
{
 "id": "dataTrial58",
"name": "dd04",
"trialNumYAxis": 59,
"variable": "result",
"value": 18.18521179745 
},
{
 "id": "dataTrial59",
"name": "dd04",
"trialNumYAxis": 60,
"variable": "result",
"value": 12.69288229291 
},
{
 "id": "dataTrial60",
"name": "dd04",
"trialNumYAxis": 61,
"variable": "result",
"value": 8.814339364375 
},
{
 "id": "dataTrial61",
"name": "dd04",
"trialNumYAxis": 62,
"variable": "result",
"value": 1.510512578006 
},
{
 "id": "dataTrial62",
"name": "dd04",
"trialNumYAxis": 63,
"variable": "result",
"value": 7.164603114785 
},
{
 "id": "dataTrial63",
"name": "dd04",
"trialNumYAxis": 64,
"variable": "result",
"value": 6.324655992147 
},
{
 "id": "dataTrial64",
"name": "dd04",
"trialNumYAxis": 65,
"variable": "result",
"value": 6.988500192531 
},
{
 "id": "dataTrial65",
"name": "dd04",
"trialNumYAxis": 66,
"variable": "result",
"value": 3.158262438903 
},
{
 "id": "dataTrial66",
"name": "dd04",
"trialNumYAxis": 67,
"variable": "result",
"value": 13.45806219018 
},
{
 "id": "dataTrial67",
"name": "dd04",
"trialNumYAxis": 68,
"variable": "result",
"value": 5.005045072325 
},
{
 "id": "dataTrial68",
"name": "dd04",
"trialNumYAxis": 69,
"variable": "result",
"value": 5.420048870428 
},
{
 "id": "dataTrial69",
"name": "dd04",
"trialNumYAxis": 70,
"variable": "result",
"value": 4.677913597763 
},
{
 "id": "dataTrial70",
"name": "dd04",
"trialNumYAxis": 71,
"variable": "result",
"value": 2.731794566415 
},
{
 "id": "dataTrial71",
"name": "dd04",
"trialNumYAxis": 72,
"variable": "result",
"value": 7.408375013755 
},
{
 "id": "dataTrial72",
"name": "dd04",
"trialNumYAxis": 73,
"variable": "result",
"value": 6.634697025495 
},
{
 "id": "dataTrial73",
"name": "dd04",
"trialNumYAxis": 74,
"variable": "result",
"value": 6.820392164213 
},
{
 "id": "dataTrial74",
"name": "dd04",
"trialNumYAxis": 75,
"variable": "result",
"value":  3.23936320714 
},
{
 "id": "dataTrial75",
"name": "dd04",
"trialNumYAxis": 76,
"variable": "result",
"value": 9.511999473626 
},
{
 "id": "dataTrial76",
"name": "dd04",
"trialNumYAxis": 77,
"variable": "result",
"value": 0.7075507158772 
},
{
 "id": "dataTrial77",
"name": "dd04",
"trialNumYAxis": 78,
"variable": "result",
"value": 12.81094246907 
},
{
 "id": "dataTrial78",
"name": "dd04",
"trialNumYAxis": 79,
"variable": "result",
"value": 5.270011211238 
},
{
 "id": "dataTrial79",
"name": "dd04",
"trialNumYAxis": 80,
"variable": "result",
"value": 2.002155361337 
},
{
 "id": "dataTrial80",
"name": "dd04",
"trialNumYAxis": 81,
"variable": "result",
"value": 1.354266996988 
},
{
 "id": "dataTrial81",
"name": "dd04",
"trialNumYAxis": 82,
"variable": "result",
"value": 5.655998529618 
},
{
 "id": "dataTrial82",
"name": "dd04",
"trialNumYAxis": 83,
"variable": "result",
"value": 14.63118279844 
},
{
 "id": "dataTrial83",
"name": "dd04",
"trialNumYAxis": 84,
"variable": "result",
"value": 2.405621098935 
},
{
 "id": "dataTrial84",
"name": "dd04",
"trialNumYAxis": 85,
"variable": "result",
"value": 1.316117130959 
},
{
 "id": "dataTrial85",
"name": "dd04",
"trialNumYAxis": 86,
"variable": "result",
"value": 4.622339610658 
},
{
 "id": "dataTrial86",
"name": "dd04",
"trialNumYAxis": 87,
"variable": "result",
"value": 4.592978845317 
},
{
 "id": "dataTrial87",
"name": "dd04",
"trialNumYAxis": 88,
"variable": "result",
"value": 6.554336625028 
},
{
 "id": "dataTrial88",
"name": "dd04",
"trialNumYAxis": 89,
"variable": "result",
"value": 7.018396451406 
},
{
 "id": "dataTrial89",
"name": "dd04",
"trialNumYAxis": 90,
"variable": "result",
"value": 8.596588182304 
},
{
 "id": "dataTrial90",
"name": "dd04",
"trialNumYAxis": 91,
"variable": "result",
"value": 6.011689071775 
},
{
 "id": "dataTrial91",
"name": "dd04",
"trialNumYAxis": 92,
"variable": "result",
"value": 3.494665727203 
},
{
 "id": "dataTrial92",
"name": "dd04",
"trialNumYAxis": 93,
"variable": "result",
"value": 4.142567017309 
},
{
 "id": "dataTrial93",
"name": "dd04",
"trialNumYAxis": 94,
"variable": "result",
"value": 0.4644525847696 
},
{
 "id": "dataTrial94",
"name": "dd04",
"trialNumYAxis": 95,
"variable": "result",
"value": 1.253271574005 
},
{
 "id": "dataTrial95",
"name": "dd04",
"trialNumYAxis": 96,
"variable": "result",
"value": 13.23612820512 
},
{
 "id": "dataTrial96",
"name": "dd04",
"trialNumYAxis": 97,
"variable": "result",
"value": 8.633034638207 
},
{
 "id": "dataTrial97",
"name": "dd04",
"trialNumYAxis": 98,
"variable": "result",
"value": 10.59103617023 
},
{
 "id": "dataTrial98",
"name": "dd04",
"trialNumYAxis": 99,
"variable": "result",
"value": 4.679547430576 
},
{
 "id": "dataTrial99",
"name": "dd04",
"trialNumYAxis": 100,
"variable": "result",
"value": 15.88196395295 
},
{
 "id": "dataTrial100",
"name": "dd04",
"trialNumYAxis": 101,
"variable": "result",
"value": 3.511425921035 
},
{
 "id": "dataTrial101",
"name": "dd04",
"trialNumYAxis": 102,
"variable": "result",
"value": 4.003687705792 
},
{
 "id": "dataTrial102",
"name": "dd04",
"trialNumYAxis": 103,
"variable": "result",
"value": 2.748078270632 
},
{
 "id": "dataTrial1",
"name": "ll07",
"trialNumYAxis": 2,
"variable": "result",
"value": 36.02557004342 
},
{
 "id": "dataTrial2",
"name": "ll07",
"trialNumYAxis": 3,
"variable": "result",
"value": 1.037192136603 
},
{
 "id": "dataTrial3",
"name": "ll07",
"trialNumYAxis": 4,
"variable": "result",
"value": 2.003570842472 
},
{
 "id": "dataTrial4",
"name": "ll07",
"trialNumYAxis": 5,
"variable": "result",
"value": 0.6446873593582 
},
{
 "id": "dataTrial5",
"name": "ll07",
"trialNumYAxis": 6,
"variable": "result",
"value": 1.141246421727 
},
{
 "id": "dataTrial6",
"name": "ll07",
"trialNumYAxis": 7,
"variable": "result",
"value": 3.699970686937 
},
{
 "id": "dataTrial7",
"name": "ll07",
"trialNumYAxis": 8,
"variable": "result",
"value":  1.04651221272 
},
{
 "id": "dataTrial8",
"name": "ll07",
"trialNumYAxis": 9,
"variable": "result",
"value": 1.929707998912 
},
{
 "id": "dataTrial9",
"name": "ll07",
"trialNumYAxis": 10,
"variable": "result",
"value": 1.020639171542 
},
{
 "id": "dataTrial10",
"name": "ll07",
"trialNumYAxis": 11,
"variable": "result",
"value": 2.225760574808 
},
{
 "id": "dataTrial11",
"name": "ll07",
"trialNumYAxis": 12,
"variable": "result",
"value": 2.422512136713 
},
{
 "id": "dataTrial12",
"name": "ll07",
"trialNumYAxis": 13,
"variable": "result",
"value": 2.549704239395 
},
{
 "id": "dataTrial13",
"name": "ll07",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.8106510229431 
},
{
 "id": "dataTrial14",
"name": "ll07",
"trialNumYAxis": 15,
"variable": "result",
"value": 1.525828465248 
},
{
 "id": "dataTrial15",
"name": "ll07",
"trialNumYAxis": 16,
"variable": "result",
"value": 0.3435773997652 
},
{
 "id": "dataTrial16",
"name": "ll07",
"trialNumYAxis": 17,
"variable": "result",
"value": 1.100448764712 
},
{
 "id": "dataTrial17",
"name": "ll07",
"trialNumYAxis": 18,
"variable": "result",
"value": 1.017016889759 
},
{
 "id": "dataTrial18",
"name": "ll07",
"trialNumYAxis": 19,
"variable": "result",
"value": 1.801258258636 
},
{
 "id": "dataTrial19",
"name": "ll07",
"trialNumYAxis": 20,
"variable": "result",
"value": 4.606597354976 
},
{
 "id": "dataTrial20",
"name": "ll07",
"trialNumYAxis": 21,
"variable": "result",
"value": 0.7661154292245 
},
{
 "id": "dataTrial21",
"name": "ll07",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.7557820257188 
},
{
 "id": "dataTrial22",
"name": "ll07",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.9212112483404 
},
{
 "id": "dataTrial23",
"name": "ll07",
"trialNumYAxis": 24,
"variable": "result",
"value": 0.990409528707 
},
{
 "id": "dataTrial24",
"name": "ll07",
"trialNumYAxis": 25,
"variable": "result",
"value": 2.989118623183 
},
{
 "id": "dataTrial25",
"name": "ll07",
"trialNumYAxis": 26,
"variable": "result",
"value": 0.8929017716583 
},
{
 "id": "dataTrial26",
"name": "ll07",
"trialNumYAxis": 27,
"variable": "result",
"value": 0.06096350252479 
},
{
 "id": "dataTrial27",
"name": "ll07",
"trialNumYAxis": 28,
"variable": "result",
"value": 4.553185113134 
},
{
 "id": "dataTrial28",
"name": "ll07",
"trialNumYAxis": 29,
"variable": "result",
"value": 2.251511793915 
},
{
 "id": "dataTrial29",
"name": "ll07",
"trialNumYAxis": 30,
"variable": "result",
"value": 1.662622217795 
},
{
 "id": "dataTrial30",
"name": "ll07",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.08156792531871 
},
{
 "id": "dataTrial31",
"name": "ll07",
"trialNumYAxis": 32,
"variable": "result",
"value": 0.03834738613924 
},
{
 "id": "dataTrial32",
"name": "ll07",
"trialNumYAxis": 33,
"variable": "result",
"value": 0.7270492979872 
},
{
 "id": "dataTrial33",
"name": "ll07",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.3163616772159 
},
{
 "id": "dataTrial34",
"name": "ll07",
"trialNumYAxis": 35,
"variable": "result",
"value": 0.1298263152804 
},
{
 "id": "dataTrial35",
"name": "ll07",
"trialNumYAxis": 36,
"variable": "result",
"value": 2.399237596441 
},
{
 "id": "dataTrial36",
"name": "ll07",
"trialNumYAxis": 37,
"variable": "result",
"value": 1.907773562219 
},
{
 "id": "dataTrial37",
"name": "ll07",
"trialNumYAxis": 38,
"variable": "result",
"value": 1.379994853155 
},
{
 "id": "dataTrial38",
"name": "ll07",
"trialNumYAxis": 39,
"variable": "result",
"value": 0.02120296801795 
},
{
 "id": "dataTrial39",
"name": "ll07",
"trialNumYAxis": 40,
"variable": "result",
"value": 3.606308641649 
},
{
 "id": "dataTrial40",
"name": "ll07",
"trialNumYAxis": 41,
"variable": "result",
"value": 0.9555077665544 
},
{
 "id": "dataTrial41",
"name": "ll07",
"trialNumYAxis": 42,
"variable": "result",
"value": 3.422658097171 
},
{
 "id": "dataTrial42",
"name": "ll07",
"trialNumYAxis": 43,
"variable": "result",
"value": 1.205580360933 
},
{
 "id": "dataTrial43",
"name": "ll07",
"trialNumYAxis": 44,
"variable": "result",
"value": 0.7517746854943 
},
{
 "id": "dataTrial44",
"name": "ll07",
"trialNumYAxis": 45,
"variable": "result",
"value": 1.126102973312 
},
{
 "id": "dataTrial45",
"name": "ll07",
"trialNumYAxis": 46,
"variable": "result",
"value": 1.518283111704 
},
{
 "id": "dataTrial46",
"name": "ll07",
"trialNumYAxis": 47,
"variable": "result",
"value": 1.459327057385 
},
{
 "id": "dataTrial47",
"name": "ll07",
"trialNumYAxis": 48,
"variable": "result",
"value": 0.0484914080009 
},
{
 "id": "dataTrial48",
"name": "ll07",
"trialNumYAxis": 49,
"variable": "result",
"value": 2.460871668818 
},
{
 "id": "dataTrial49",
"name": "ll07",
"trialNumYAxis": 50,
"variable": "result",
"value": 1.783169038404 
},
{
 "id": "dataTrial50",
"name": "ll07",
"trialNumYAxis": 51,
"variable": "result",
"value": 0.3858015138256 
},
{
 "id": "dataTrial51",
"name": "ll07",
"trialNumYAxis": 52,
"variable": "result",
"value": 2.668632526863 
},
{
 "id": "dataTrial52",
"name": "ll07",
"trialNumYAxis": 53,
"variable": "result",
"value": 0.3273090556117 
},
{
 "id": "dataTrial53",
"name": "ll07",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.5605438546254 
},
{
 "id": "dataTrial54",
"name": "ll07",
"trialNumYAxis": 55,
"variable": "result",
"value": 1.234169839189 
},
{
 "id": "dataTrial55",
"name": "ll07",
"trialNumYAxis": 56,
"variable": "result",
"value": 1.378634808557 
},
{
 "id": "dataTrial56",
"name": "ll07",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.202555097358 
},
{
 "id": "dataTrial57",
"name": "ll07",
"trialNumYAxis": 58,
"variable": "result",
"value": 1.319214686522 
},
{
 "id": "dataTrial58",
"name": "ll07",
"trialNumYAxis": 59,
"variable": "result",
"value": 0.05745743744315 
},
{
 "id": "dataTrial59",
"name": "ll07",
"trialNumYAxis": 60,
"variable": "result",
"value": 0.8311781207927 
},
{
 "id": "dataTrial60",
"name": "ll07",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.1163452671491 
},
{
 "id": "dataTrial61",
"name": "ll07",
"trialNumYAxis": 62,
"variable": "result",
"value": 0.6542157425396 
},
{
 "id": "dataTrial62",
"name": "ll07",
"trialNumYAxis": 63,
"variable": "result",
"value": 0.5342146290776 
},
{
 "id": "dataTrial63",
"name": "ll07",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.9233029934246 
},
{
 "id": "dataTrial64",
"name": "ll07",
"trialNumYAxis": 65,
"variable": "result",
"value": 0.6882599146742 
},
{
 "id": "dataTrial65",
"name": "ll07",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.4626678819025 
},
{
 "id": "dataTrial66",
"name": "ll07",
"trialNumYAxis": 67,
"variable": "result",
"value": 2.240357975641 
},
{
 "id": "dataTrial67",
"name": "ll07",
"trialNumYAxis": 68,
"variable": "result",
"value": 0.6548508734672 
},
{
 "id": "dataTrial68",
"name": "ll07",
"trialNumYAxis": 69,
"variable": "result",
"value": 1.594021754231 
},
{
 "id": "dataTrial69",
"name": "ll07",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.1294197514798 
},
{
 "id": "dataTrial70",
"name": "ll07",
"trialNumYAxis": 71,
"variable": "result",
"value": 0.7634031415102 
},
{
 "id": "dataTrial71",
"name": "ll07",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.7989515078907 
},
{
 "id": "dataTrial72",
"name": "ll07",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.4513408508269 
},
{
 "id": "dataTrial73",
"name": "ll07",
"trialNumYAxis": 74,
"variable": "result",
"value": 1.212832798344 
},
{
 "id": "dataTrial74",
"name": "ll07",
"trialNumYAxis": 75,
"variable": "result",
"value": 2.285108105106 
},
{
 "id": "dataTrial75",
"name": "ll07",
"trialNumYAxis": 76,
"variable": "result",
"value": 0.4337345801707 
},
{
 "id": "dataTrial76",
"name": "ll07",
"trialNumYAxis": 77,
"variable": "result",
"value":  1.52759520534 
},
{
 "id": "dataTrial77",
"name": "ll07",
"trialNumYAxis": 78,
"variable": "result",
"value": 1.223177962219 
},
{
 "id": "dataTrial78",
"name": "ll07",
"trialNumYAxis": 79,
"variable": "result",
"value": 2.038270589839 
},
{
 "id": "dataTrial79",
"name": "ll07",
"trialNumYAxis": 80,
"variable": "result",
"value": 1.568209361935 
},
{
 "id": "dataTrial80",
"name": "ll07",
"trialNumYAxis": 81,
"variable": "result",
"value": 3.129422683414 
},
{
 "id": "dataTrial81",
"name": "ll07",
"trialNumYAxis": 82,
"variable": "result",
"value": 2.425106016921 
},
{
 "id": "dataTrial82",
"name": "ll07",
"trialNumYAxis": 83,
"variable": "result",
"value": 3.891057676915 
},
{
 "id": "dataTrial83",
"name": "ll07",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.309383924183 
},
{
 "id": "dataTrial84",
"name": "ll07",
"trialNumYAxis": 85,
"variable": "result",
"value": 0.6198443391582 
},
{
 "id": "dataTrial85",
"name": "ll07",
"trialNumYAxis": 86,
"variable": "result",
"value": 0.08107194219077 
},
{
 "id": "dataTrial86",
"name": "ll07",
"trialNumYAxis": 87,
"variable": "result",
"value": 1.839482884082 
},
{
 "id": "dataTrial87",
"name": "ll07",
"trialNumYAxis": 88,
"variable": "result",
"value": 1.043203170039 
},
{
 "id": "dataTrial88",
"name": "ll07",
"trialNumYAxis": 89,
"variable": "result",
"value": 0.3417858002586 
},
{
 "id": "dataTrial89",
"name": "ll07",
"trialNumYAxis": 90,
"variable": "result",
"value": 0.7434660813911 
},
{
 "id": "dataTrial90",
"name": "ll07",
"trialNumYAxis": 91,
"variable": "result",
"value":  0.28089587281 
},
{
 "id": "dataTrial91",
"name": "ll07",
"trialNumYAxis": 92,
"variable": "result",
"value": 0.5278108841025 
},
{
 "id": "dataTrial92",
"name": "ll07",
"trialNumYAxis": 93,
"variable": "result",
"value": 1.735220423103 
},
{
 "id": "dataTrial93",
"name": "ll07",
"trialNumYAxis": 94,
"variable": "result",
"value": 0.04579613489845 
},
{
 "id": "dataTrial94",
"name": "ll07",
"trialNumYAxis": 95,
"variable": "result",
"value": 0.5608834744961 
},
{
 "id": "dataTrial95",
"name": "ll07",
"trialNumYAxis": 96,
"variable": "result",
"value":  0.85813378737 
},
{
 "id": "dataTrial96",
"name": "ll07",
"trialNumYAxis": 97,
"variable": "result",
"value": 1.618779785684 
},
{
 "id": "dataTrial97",
"name": "ll07",
"trialNumYAxis": 98,
"variable": "result",
"value": 0.8434031793043 
},
{
 "id": "dataTrial98",
"name": "ll07",
"trialNumYAxis": 99,
"variable": "result",
"value":  0.10960131704 
},
{
 "id": "dataTrial99",
"name": "ll07",
"trialNumYAxis": 100,
"variable": "result",
"value": 5.090819100695 
},
{
 "id": "dataTrial100",
"name": "ll07",
"trialNumYAxis": 101,
"variable": "result",
"value": 2.296777266614 
},
{
 "id": "dataTrial101",
"name": "ll07",
"trialNumYAxis": 102,
"variable": "result",
"value": 0.6764238762079 
},
{
 "id": "dataTrial102",
"name": "ll07",
"trialNumYAxis": 103,
"variable": "result",
"value": 0.230069625362 
},
{
 "id": "dataTrial103",
"name": "ll07",
"trialNumYAxis": 104,
"variable": "result",
"value": 1.060483261833 
},
{
 "id": "dataTrial104",
"name": "ll07",
"trialNumYAxis": 105,
"variable": "result",
"value": 0.2193329971255 
},
{
 "id": "dataTrial105",
"name": "ll07",
"trialNumYAxis": 106,
"variable": "result",
"value": 0.3592946698495 
},
{
 "id": "dataTrial106",
"name": "ll07",
"trialNumYAxis": 107,
"variable": "result",
"value": 3.467141227139 
},
{
 "id": "dataTrial107",
"name": "ll07",
"trialNumYAxis": 108,
"variable": "result",
"value": 1.755540710621 
},
{
 "id": "dataTrial108",
"name": "ll07",
"trialNumYAxis": 109,
"variable": "result",
"value": 1.069995172578 
},
{
 "id": "dataTrial109",
"name": "ll07",
"trialNumYAxis": 110,
"variable": "result",
"value": 2.292812069391 
},
{
 "id": "dataTrial110",
"name": "ll07",
"trialNumYAxis": 111,
"variable": "result",
"value": 1.225015853003 
},
{
 "id": "dataTrial111",
"name": "ll07",
"trialNumYAxis": 112,
"variable": "result",
"value": 0.1754353719799 
},
{
 "id": "dataTrial112",
"name": "ll07",
"trialNumYAxis": 113,
"variable": "result",
"value": 2.680046108015 
},
{
 "id": "dataTrial113",
"name": "ll07",
"trialNumYAxis": 114,
"variable": "result",
"value":  2.41870064572 
},
{
 "id": "dataTrial114",
"name": "ll07",
"trialNumYAxis": 115,
"variable": "result",
"value": 0.8633908289392 
},
{
 "id": "dataTrial115",
"name": "ll07",
"trialNumYAxis": 116,
"variable": "result",
"value": 0.4238635840586 
},
{
 "id": "dataTrial116",
"name": "ll07",
"trialNumYAxis": 117,
"variable": "result",
"value": 0.8716943872538 
},
{
 "id": "dataTrial117",
"name": "ll07",
"trialNumYAxis": 118,
"variable": "result",
"value":  4.21530388893 
},
{
 "id": "dataTrial118",
"name": "ll07",
"trialNumYAxis": 119,
"variable": "result",
"value": 1.512740972939 
},
{
 "id": "dataTrial119",
"name": "ll07",
"trialNumYAxis": 120,
"variable": "result",
"value": 1.362567780734 
},
{
 "id": "dataTrial120",
"name": "ll07",
"trialNumYAxis": 121,
"variable": "result",
"value": 0.4899770751632 
},
{
 "id": "dataTrial121",
"name": "ll07",
"trialNumYAxis": 122,
"variable": "result",
"value": 2.344571270959 
},
{
 "id": "dataTrial122",
"name": "ll07",
"trialNumYAxis": 123,
"variable": "result",
"value": 0.185604936498 
},
{
 "id": "dataTrial123",
"name": "ll07",
"trialNumYAxis": 124,
"variable": "result",
"value": 0.2944432109268 
},
{
 "id": "dataTrial124",
"name": "ll07",
"trialNumYAxis": 125,
"variable": "result",
"value": 0.2430011738864 
},
{
 "id": "dataTrial125",
"name": "ll07",
"trialNumYAxis": 126,
"variable": "result",
"value": 0.2275372430228 
},
{
 "id": "dataTrial126",
"name": "ll07",
"trialNumYAxis": 127,
"variable": "result",
"value": 0.2685182442425 
},
{
 "id": "dataTrial127",
"name": "ll07",
"trialNumYAxis": 128,
"variable": "result",
"value": 0.327086349088 
},
{
 "id": "dataTrial128",
"name": "ll07",
"trialNumYAxis": 129,
"variable": "result",
"value": 0.2067039266971 
},
{
 "id": "dataTrial129",
"name": "ll07",
"trialNumYAxis": 130,
"variable": "result",
"value": 1.334057283729 
},
{
 "id": "dataTrial130",
"name": "ll07",
"trialNumYAxis": 131,
"variable": "result",
"value": 0.5283689858895 
},
{
 "id": "dataTrial131",
"name": "ll07",
"trialNumYAxis": 132,
"variable": "result",
"value": 0.8550348588937 
},
{
 "id": "dataTrial132",
"name": "ll07",
"trialNumYAxis": 133,
"variable": "result",
"value": 0.4186721927121 
},
{
 "id": "dataTrial133",
"name": "ll07",
"trialNumYAxis": 134,
"variable": "result",
"value": 3.765920745666 
},
{
 "id": "dataTrial134",
"name": "ll07",
"trialNumYAxis": 135,
"variable": "result",
"value": 0.6038055033875 
},
{
 "id": "dataTrial135",
"name": "ll07",
"trialNumYAxis": 136,
"variable": "result",
"value": 0.8115239784737 
},
{
 "id": "dataTrial136",
"name": "ll07",
"trialNumYAxis": 137,
"variable": "result",
"value": 2.392736445266 
},
{
 "id": "dataTrial137",
"name": "ll07",
"trialNumYAxis": 138,
"variable": "result",
"value": 1.249727491585 
},
{
 "id": "dataTrial138",
"name": "ll07",
"trialNumYAxis": 139,
"variable": "result",
"value": 1.189534538005 
},
{
 "id": "dataTrial139",
"name": "ll07",
"trialNumYAxis": 140,
"variable": "result",
"value": 0.4155114142457 
},
{
 "id": "dataTrial140",
"name": "ll07",
"trialNumYAxis": 141,
"variable": "result",
"value": 0.9197208301917 
},
{
 "id": "dataTrial141",
"name": "ll07",
"trialNumYAxis": 142,
"variable": "result",
"value": 0.005982937238343 
},
{
 "id": "dataTrial142",
"name": "ll07",
"trialNumYAxis": 143,
"variable": "result",
"value": 1.304823583319 
},
{
 "id": "dataTrial143",
"name": "ll07",
"trialNumYAxis": 144,
"variable": "result",
"value": 0.7790902263551 
},
{
 "id": "dataTrial144",
"name": "ll07",
"trialNumYAxis": 145,
"variable": "result",
"value": 2.728656371849 
},
{
 "id": "dataTrial145",
"name": "ll07",
"trialNumYAxis": 146,
"variable": "result",
"value": 3.761991037047 
},
{
 "id": "dataTrial146",
"name": "ll07",
"trialNumYAxis": 147,
"variable": "result",
"value": 2.167972567424 
},
{
 "id": "dataTrial147",
"name": "ll07",
"trialNumYAxis": 148,
"variable": "result",
"value": 0.06506286151944 
},
{
 "id": "dataTrial148",
"name": "ll07",
"trialNumYAxis": 149,
"variable": "result",
"value": 0.3475509384989 
},
{
 "id": "dataTrial149",
"name": "ll07",
"trialNumYAxis": 150,
"variable": "result",
"value": 0.7153962739875 
},
{
 "id": "dataTrial150",
"name": "ll07",
"trialNumYAxis": 151,
"variable": "result",
"value":  1.46790885305 
},
{
 "id": "dataTrial151",
"name": "ll07",
"trialNumYAxis": 152,
"variable": "result",
"value": 0.3476238478638 
},
{
 "id": "dataTrial152",
"name": "ll07",
"trialNumYAxis": 153,
"variable": "result",
"value": 0.1193986627007 
},
{
 "id": "dataTrial153",
"name": "ll07",
"trialNumYAxis": 154,
"variable": "result",
"value": 1.839338923717 
},
{
 "id": "dataTrial154",
"name": "ll07",
"trialNumYAxis": 155,
"variable": "result",
"value": 1.150609843905 
},
{
 "id": "dataTrial155",
"name": "ll07",
"trialNumYAxis": 156,
"variable": "result",
"value": 1.412293967077 
},
{
 "id": "dataTrial156",
"name": "ll07",
"trialNumYAxis": 157,
"variable": "result",
"value": 0.6355378931744 
},
{
 "id": "dataTrial157",
"name": "ll07",
"trialNumYAxis": 158,
"variable": "result",
"value": 0.6722135794523 
},
{
 "id": "dataTrial158",
"name": "ll07",
"trialNumYAxis": 159,
"variable": "result",
"value": 1.417527928514 
},
{
 "id": "dataTrial159",
"name": "ll07",
"trialNumYAxis": 160,
"variable": "result",
"value": 0.1843818105183 
},
{
 "id": "dataTrial0",
"name": "va01",
"trialNumYAxis": 0,
"variable": "result",
"value": 3.968624148328 
},
{
 "id": "dataTrial1",
"name": "va01",
"trialNumYAxis": 2,
"variable": "result",
"value": 2.870663348702 
},
{
 "id": "dataTrial2",
"name": "va01",
"trialNumYAxis": 3,
"variable": "result",
"value": 7.835663795341 
},
{
 "id": "dataTrial3",
"name": "va01",
"trialNumYAxis": 4,
"variable": "result",
"value": 7.662358800943 
},
{
 "id": "dataTrial4",
"name": "va01",
"trialNumYAxis": 5,
"variable": "result",
"value": 4.326356769558 
},
{
 "id": "dataTrial5",
"name": "va01",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.909117342032 
},
{
 "id": "dataTrial6",
"name": "va01",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.857427109957 
},
{
 "id": "dataTrial7",
"name": "va01",
"trialNumYAxis": 8,
"variable": "result",
"value": 0.4827278779946 
},
{
 "id": "dataTrial8",
"name": "va01",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.07207892197322 
},
{
 "id": "dataTrial9",
"name": "va01",
"trialNumYAxis": 10,
"variable": "result",
"value": 3.670490830034 
},
{
 "id": "dataTrial10",
"name": "va01",
"trialNumYAxis": 11,
"variable": "result",
"value": 3.265359980352 
},
{
 "id": "dataTrial11",
"name": "va01",
"trialNumYAxis": 12,
"variable": "result",
"value": 4.874262747547 
},
{
 "id": "dataTrial12",
"name": "va01",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.224149972532 
},
{
 "id": "dataTrial13",
"name": "va01",
"trialNumYAxis": 14,
"variable": "result",
"value": 1.241452504234 
},
{
 "id": "dataTrial14",
"name": "va01",
"trialNumYAxis": 15,
"variable": "result",
"value": 1.205788518331 
},
{
 "id": "dataTrial15",
"name": "va01",
"trialNumYAxis": 16,
"variable": "result",
"value": 1.522140919387 
},
{
 "id": "dataTrial16",
"name": "va01",
"trialNumYAxis": 17,
"variable": "result",
"value": 1.325750215871 
},
{
 "id": "dataTrial17",
"name": "va01",
"trialNumYAxis": 18,
"variable": "result",
"value": 0.3368197253039 
},
{
 "id": "dataTrial18",
"name": "va01",
"trialNumYAxis": 19,
"variable": "result",
"value": 1.479742767673 
},
{
 "id": "dataTrial19",
"name": "va01",
"trialNumYAxis": 20,
"variable": "result",
"value": 3.497695059869 
},
{
 "id": "dataTrial20",
"name": "va01",
"trialNumYAxis": 21,
"variable": "result",
"value":  1.48858530162 
},
{
 "id": "dataTrial21",
"name": "va01",
"trialNumYAxis": 22,
"variable": "result",
"value": 1.387965028253 
},
{
 "id": "dataTrial22",
"name": "va01",
"trialNumYAxis": 23,
"variable": "result",
"value": 2.309400396515 
},
{
 "id": "dataTrial23",
"name": "va01",
"trialNumYAxis": 24,
"variable": "result",
"value": 0.8246324317236 
},
{
 "id": "dataTrial24",
"name": "va01",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.771113233752 
},
{
 "id": "dataTrial25",
"name": "va01",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.338533097031 
},
{
 "id": "dataTrial26",
"name": "va01",
"trialNumYAxis": 27,
"variable": "result",
"value": 0.9434837070344 
},
{
 "id": "dataTrial27",
"name": "va01",
"trialNumYAxis": 28,
"variable": "result",
"value": 2.195800225916 
},
{
 "id": "dataTrial28",
"name": "va01",
"trialNumYAxis": 29,
"variable": "result",
"value": 0.4920526767014 
},
{
 "id": "dataTrial29",
"name": "va01",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.2002287718392 
},
{
 "id": "dataTrial30",
"name": "va01",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.5894013634164 
},
{
 "id": "dataTrial31",
"name": "va01",
"trialNumYAxis": 32,
"variable": "result",
"value": 2.770208097542 
},
{
 "id": "dataTrial32",
"name": "va01",
"trialNumYAxis": 33,
"variable": "result",
"value": 2.048759821824 
},
{
 "id": "dataTrial33",
"name": "va01",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.1284826860801 
},
{
 "id": "dataTrial34",
"name": "va01",
"trialNumYAxis": 35,
"variable": "result",
"value": 0.9075862977376 
},
{
 "id": "dataTrial35",
"name": "va01",
"trialNumYAxis": 36,
"variable": "result",
"value": 1.207852868595 
},
{
 "id": "dataTrial36",
"name": "va01",
"trialNumYAxis": 37,
"variable": "result",
"value": 2.170417736477 
},
{
 "id": "dataTrial37",
"name": "va01",
"trialNumYAxis": 38,
"variable": "result",
"value":  2.04512560055 
},
{
 "id": "dataTrial38",
"name": "va01",
"trialNumYAxis": 39,
"variable": "result",
"value": 1.511115887454 
},
{
 "id": "dataTrial39",
"name": "va01",
"trialNumYAxis": 40,
"variable": "result",
"value": 2.406052091208 
},
{
 "id": "dataTrial40",
"name": "va01",
"trialNumYAxis": 41,
"variable": "result",
"value": 0.5064932073794 
},
{
 "id": "dataTrial41",
"name": "va01",
"trialNumYAxis": 42,
"variable": "result",
"value": 2.927554276384 
},
{
 "id": "dataTrial42",
"name": "va01",
"trialNumYAxis": 43,
"variable": "result",
"value": 2.082560759076 
},
{
 "id": "dataTrial43",
"name": "va01",
"trialNumYAxis": 44,
"variable": "result",
"value":  4.05927537038 
},
{
 "id": "dataTrial44",
"name": "va01",
"trialNumYAxis": 45,
"variable": "result",
"value": 5.154702579549 
},
{
 "id": "dataTrial45",
"name": "va01",
"trialNumYAxis": 46,
"variable": "result",
"value": 2.837650271276 
},
{
 "id": "dataTrial46",
"name": "va01",
"trialNumYAxis": 47,
"variable": "result",
"value": 0.6477663610856 
},
{
 "id": "dataTrial47",
"name": "va01",
"trialNumYAxis": 48,
"variable": "result",
"value": 4.579533188477 
},
{
 "id": "dataTrial48",
"name": "va01",
"trialNumYAxis": 49,
"variable": "result",
"value":  2.05277867608 
},
{
 "id": "dataTrial49",
"name": "va01",
"trialNumYAxis": 50,
"variable": "result",
"value": 1.977627825452 
},
{
 "id": "dataTrial50",
"name": "va01",
"trialNumYAxis": 51,
"variable": "result",
"value": 7.175840062491 
},
{
 "id": "dataTrial51",
"name": "va01",
"trialNumYAxis": 52,
"variable": "result",
"value": 0.111017249427 
},
{
 "id": "dataTrial52",
"name": "va01",
"trialNumYAxis": 53,
"variable": "result",
"value": 3.128910987127 
},
{
 "id": "dataTrial53",
"name": "va01",
"trialNumYAxis": 54,
"variable": "result",
"value":  2.41822952359 
},
{
 "id": "dataTrial54",
"name": "va01",
"trialNumYAxis": 55,
"variable": "result",
"value":  2.87483552095 
},
{
 "id": "dataTrial55",
"name": "va01",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.4756604027446 
},
{
 "id": "dataTrial56",
"name": "va01",
"trialNumYAxis": 57,
"variable": "result",
"value": 0.647836911013 
},
{
 "id": "dataTrial57",
"name": "va01",
"trialNumYAxis": 58,
"variable": "result",
"value": 5.334969680723 
},
{
 "id": "dataTrial58",
"name": "va01",
"trialNumYAxis": 59,
"variable": "result",
"value": 1.462848201142 
},
{
 "id": "dataTrial59",
"name": "va01",
"trialNumYAxis": 60,
"variable": "result",
"value": 0.507330076938 
},
{
 "id": "dataTrial60",
"name": "va01",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.4158288179828 
},
{
 "id": "dataTrial61",
"name": "va01",
"trialNumYAxis": 62,
"variable": "result",
"value": 0.5255822711941 
},
{
 "id": "dataTrial62",
"name": "va01",
"trialNumYAxis": 63,
"variable": "result",
"value": 0.4372328088159 
},
{
 "id": "dataTrial63",
"name": "va01",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.7826101403138 
},
{
 "id": "dataTrial64",
"name": "va01",
"trialNumYAxis": 65,
"variable": "result",
"value": 0.8143714211451 
},
{
 "id": "dataTrial65",
"name": "va01",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.9790588262821 
},
{
 "id": "dataTrial66",
"name": "va01",
"trialNumYAxis": 67,
"variable": "result",
"value": 0.2478065187966 
},
{
 "id": "dataTrial67",
"name": "va01",
"trialNumYAxis": 68,
"variable": "result",
"value": 2.124094453478 
},
{
 "id": "dataTrial68",
"name": "va01",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.2379006329781 
},
{
 "id": "dataTrial69",
"name": "va01",
"trialNumYAxis": 70,
"variable": "result",
"value": 1.085936325048 
},
{
 "id": "dataTrial70",
"name": "va01",
"trialNumYAxis": 71,
"variable": "result",
"value": 2.325339245308 
},
{
 "id": "dataTrial71",
"name": "va01",
"trialNumYAxis": 72,
"variable": "result",
"value": 1.725535922482 
},
{
 "id": "dataTrial72",
"name": "va01",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.1989849111802 
},
{
 "id": "dataTrial73",
"name": "va01",
"trialNumYAxis": 74,
"variable": "result",
"value": 0.7570284380698 
},
{
 "id": "dataTrial74",
"name": "va01",
"trialNumYAxis": 75,
"variable": "result",
"value": 1.151026751666 
},
{
 "id": "dataTrial75",
"name": "va01",
"trialNumYAxis": 76,
"variable": "result",
"value": 2.956164511221 
},
{
 "id": "dataTrial76",
"name": "va01",
"trialNumYAxis": 77,
"variable": "result",
"value": 1.998971548305 
},
{
 "id": "dataTrial77",
"name": "va01",
"trialNumYAxis": 78,
"variable": "result",
"value": 0.3154141631812 
},
{
 "id": "dataTrial78",
"name": "va01",
"trialNumYAxis": 79,
"variable": "result",
"value": 0.6761530926638 
},
{
 "id": "dataTrial79",
"name": "va01",
"trialNumYAxis": 80,
"variable": "result",
"value": 3.300834969728 
},
{
 "id": "dataTrial80",
"name": "va01",
"trialNumYAxis": 81,
"variable": "result",
"value": 0.1651683823215 
},
{
 "id": "dataTrial81",
"name": "va01",
"trialNumYAxis": 82,
"variable": "result",
"value": 1.790128312509 
},
{
 "id": "dataTrial82",
"name": "va01",
"trialNumYAxis": 83,
"variable": "result",
"value": 2.740619476351 
},
{
 "id": "dataTrial83",
"name": "va01",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.9553727920157 
},
{
 "id": "dataTrial84",
"name": "va01",
"trialNumYAxis": 85,
"variable": "result",
"value": 0.4629899928991 
},
{
 "id": "dataTrial85",
"name": "va01",
"trialNumYAxis": 86,
"variable": "result",
"value": 0.8503541705547 
},
{
 "id": "dataTrial86",
"name": "va01",
"trialNumYAxis": 87,
"variable": "result",
"value": 3.534122186338 
},
{
 "id": "dataTrial87",
"name": "va01",
"trialNumYAxis": 88,
"variable": "result",
"value": 1.119729785473 
},
{
 "id": "dataTrial88",
"name": "va01",
"trialNumYAxis": 89,
"variable": "result",
"value": 1.798142896792 
},
{
 "id": "dataTrial89",
"name": "va01",
"trialNumYAxis": 90,
"variable": "result",
"value": 4.428768599692 
},
{
 "id": "dataTrial90",
"name": "va01",
"trialNumYAxis": 91,
"variable": "result",
"value": 3.018093345171 
},
{
 "id": "dataTrial91",
"name": "va01",
"trialNumYAxis": 92,
"variable": "result",
"value": 3.662508195728 
},
{
 "id": "dataTrial92",
"name": "va01",
"trialNumYAxis": 93,
"variable": "result",
"value": 3.053924290774 
},
{
 "id": "dataTrial93",
"name": "va01",
"trialNumYAxis": 94,
"variable": "result",
"value": 0.9354408089069 
},
{
 "id": "dataTrial94",
"name": "va01",
"trialNumYAxis": 95,
"variable": "result",
"value": 0.6686297071191 
},
{
 "id": "dataTrial95",
"name": "va01",
"trialNumYAxis": 96,
"variable": "result",
"value": 2.790068350152 
},
{
 "id": "dataTrial96",
"name": "va01",
"trialNumYAxis": 97,
"variable": "result",
"value": 3.450358113669 
},
{
 "id": "dataTrial97",
"name": "va01",
"trialNumYAxis": 98,
"variable": "result",
"value": 0.9767190142237 
},
{
 "id": "dataTrial98",
"name": "va01",
"trialNumYAxis": 99,
"variable": "result",
"value": 2.116988497421 
},
{
 "id": "dataTrial99",
"name": "va01",
"trialNumYAxis": 100,
"variable": "result",
"value": 0.08881551476469 
},
{
 "id": "dataTrial100",
"name": "va01",
"trialNumYAxis": 101,
"variable": "result",
"value": 1.072761108207 
},
{
 "id": "dataTrial101",
"name": "va01",
"trialNumYAxis": 102,
"variable": "result",
"value": 0.7322686420683 
},
{
 "id": "dataTrial102",
"name": "va01",
"trialNumYAxis": 103,
"variable": "result",
"value": 3.439895128918 
},
{
 "id": "dataTrial103",
"name": "va01",
"trialNumYAxis": 104,
"variable": "result",
"value": 4.261935037807 
},
{
 "id": "dataTrial104",
"name": "va01",
"trialNumYAxis": 105,
"variable": "result",
"value": 2.494111240445 
},
{
 "id": "dataTrial105",
"name": "va01",
"trialNumYAxis": 106,
"variable": "result",
"value":  4.63407330084 
},
{
 "id": "dataTrial106",
"name": "va01",
"trialNumYAxis": 107,
"variable": "result",
"value": 0.9338304266182 
},
{
 "id": "dataTrial107",
"name": "va01",
"trialNumYAxis": 108,
"variable": "result",
"value": 0.4363643974881 
},
{
 "id": "dataTrial108",
"name": "va01",
"trialNumYAxis": 109,
"variable": "result",
"value": 3.453557112881 
},
{
 "id": "dataTrial109",
"name": "va01",
"trialNumYAxis": 110,
"variable": "result",
"value": 1.515203714209 
},
{
 "id": "dataTrial110",
"name": "va01",
"trialNumYAxis": 111,
"variable": "result",
"value": 0.5539456881143 
},
{
 "id": "dataTrial111",
"name": "va01",
"trialNumYAxis": 112,
"variable": "result",
"value": 0.7104592774608 
},
{
 "id": "dataTrial112",
"name": "va01",
"trialNumYAxis": 113,
"variable": "result",
"value": 3.708541105635 
},
{
 "id": "dataTrial113",
"name": "va01",
"trialNumYAxis": 114,
"variable": "result",
"value": 0.9143477523747 
},
{
 "id": "dataTrial114",
"name": "va01",
"trialNumYAxis": 115,
"variable": "result",
"value": 2.499403287931 
},
{
 "id": "dataTrial115",
"name": "va01",
"trialNumYAxis": 116,
"variable": "result",
"value": 3.069513662578 
},
{
 "id": "dataTrial116",
"name": "va01",
"trialNumYAxis": 117,
"variable": "result",
"value": 0.1494906311129 
},
{
 "id": "dataTrial117",
"name": "va01",
"trialNumYAxis": 118,
"variable": "result",
"value": 0.4567576496978 
},
{
 "id": "dataTrial118",
"name": "va01",
"trialNumYAxis": 119,
"variable": "result",
"value": 0.7894352503144 
},
{
 "id": "dataTrial119",
"name": "va01",
"trialNumYAxis": 120,
"variable": "result",
"value": 3.914117982525 
},
{
 "id": "dataTrial120",
"name": "va01",
"trialNumYAxis": 121,
"variable": "result",
"value": 7.475975297954 
},
{
 "id": "dataTrial121",
"name": "va01",
"trialNumYAxis": 122,
"variable": "result",
"value":  1.98959457633 
},
{
 "id": "dataTrial122",
"name": "va01",
"trialNumYAxis": 123,
"variable": "result",
"value": 0.0771753698134 
},
{
 "id": "dataTrial123",
"name": "va01",
"trialNumYAxis": 124,
"variable": "result",
"value": 2.307266767359 
},
{
 "id": "dataTrial124",
"name": "va01",
"trialNumYAxis": 125,
"variable": "result",
"value":  14.7387389674 
},
{
 "id": "dataTrial0",
"name": "df22",
"trialNumYAxis": 0,
"variable": "result",
"value": 0.614108693531 
},
{
 "id": "dataTrial1",
"name": "df22",
"trialNumYAxis": 2,
"variable": "result",
"value": 7.685472467201 
},
{
 "id": "dataTrial2",
"name": "df22",
"trialNumYAxis": 3,
"variable": "result",
"value": 8.980690189504 
},
{
 "id": "dataTrial3",
"name": "df22",
"trialNumYAxis": 4,
"variable": "result",
"value": 4.773826173362 
},
{
 "id": "dataTrial4",
"name": "df22",
"trialNumYAxis": 5,
"variable": "result",
"value": 1.039175273911 
},
{
 "id": "dataTrial5",
"name": "df22",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.2520291967873 
},
{
 "id": "dataTrial6",
"name": "df22",
"trialNumYAxis": 7,
"variable": "result",
"value":  15.6235793829 
},
{
 "id": "dataTrial7",
"name": "df22",
"trialNumYAxis": 8,
"variable": "result",
"value": 0.4186780141325 
},
{
 "id": "dataTrial8",
"name": "df22",
"trialNumYAxis": 9,
"variable": "result",
"value": 10.38197471914 
},
{
 "id": "dataTrial9",
"name": "df22",
"trialNumYAxis": 10,
"variable": "result",
"value": 0.778460128383 
},
{
 "id": "dataTrial10",
"name": "df22",
"trialNumYAxis": 11,
"variable": "result",
"value": 17.37264565746 
},
{
 "id": "dataTrial11",
"name": "df22",
"trialNumYAxis": 12,
"variable": "result",
"value": 4.576890703289 
},
{
 "id": "dataTrial12",
"name": "df22",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.793283850194 
},
{
 "id": "dataTrial13",
"name": "df22",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.4947827574358 
},
{
 "id": "dataTrial14",
"name": "df22",
"trialNumYAxis": 15,
"variable": "result",
"value": 9.989659816459 
},
{
 "id": "dataTrial15",
"name": "df22",
"trialNumYAxis": 16,
"variable": "result",
"value": 4.800755310701 
},
{
 "id": "dataTrial16",
"name": "df22",
"trialNumYAxis": 17,
"variable": "result",
"value": 8.976201688403 
},
{
 "id": "dataTrial17",
"name": "df22",
"trialNumYAxis": 18,
"variable": "result",
"value": 2.167234928973 
},
{
 "id": "dataTrial18",
"name": "df22",
"trialNumYAxis": 19,
"variable": "result",
"value": 2.108563661779 
},
{
 "id": "dataTrial19",
"name": "df22",
"trialNumYAxis": 20,
"variable": "result",
"value": 2.846230672278 
},
{
 "id": "dataTrial20",
"name": "df22",
"trialNumYAxis": 21,
"variable": "result",
"value": 2.648697819177 
},
{
 "id": "dataTrial21",
"name": "df22",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.7597930087579 
},
{
 "id": "dataTrial22",
"name": "df22",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.5824537169711 
},
{
 "id": "dataTrial23",
"name": "df22",
"trialNumYAxis": 24,
"variable": "result",
"value":  6.34784731796 
},
{
 "id": "dataTrial24",
"name": "df22",
"trialNumYAxis": 25,
"variable": "result",
"value": 1.209967612919 
},
{
 "id": "dataTrial25",
"name": "df22",
"trialNumYAxis": 26,
"variable": "result",
"value": 20.90703347611 
},
{
 "id": "dataTrial26",
"name": "df22",
"trialNumYAxis": 27,
"variable": "result",
"value": 9.372025814326 
},
{
 "id": "dataTrial27",
"name": "df22",
"trialNumYAxis": 28,
"variable": "result",
"value": 3.696910819215 
},
{
 "id": "dataTrial28",
"name": "df22",
"trialNumYAxis": 29,
"variable": "result",
"value": 1.109193185787 
},
{
 "id": "dataTrial29",
"name": "df22",
"trialNumYAxis": 30,
"variable": "result",
"value":  2.98381047311 
},
{
 "id": "dataTrial30",
"name": "df22",
"trialNumYAxis": 31,
"variable": "result",
"value": 8.086791874723 
},
{
 "id": "dataTrial31",
"name": "df22",
"trialNumYAxis": 32,
"variable": "result",
"value": 4.265526708946 
},
{
 "id": "dataTrial32",
"name": "df22",
"trialNumYAxis": 33,
"variable": "result",
"value": 4.742128354723 
},
{
 "id": "dataTrial33",
"name": "df22",
"trialNumYAxis": 34,
"variable": "result",
"value": 4.528102708917 
},
{
 "id": "dataTrial34",
"name": "df22",
"trialNumYAxis": 35,
"variable": "result",
"value":   1.0092073102 
},
{
 "id": "dataTrial35",
"name": "df22",
"trialNumYAxis": 36,
"variable": "result",
"value": 0.1083697671248 
},
{
 "id": "dataTrial36",
"name": "df22",
"trialNumYAxis": 37,
"variable": "result",
"value": 1.512373793368 
},
{
 "id": "dataTrial37",
"name": "df22",
"trialNumYAxis": 38,
"variable": "result",
"value": 3.225072071369 
},
{
 "id": "dataTrial38",
"name": "df22",
"trialNumYAxis": 39,
"variable": "result",
"value": 0.3919501480927 
},
{
 "id": "dataTrial39",
"name": "df22",
"trialNumYAxis": 40,
"variable": "result",
"value": 4.128965317585 
},
{
 "id": "dataTrial40",
"name": "df22",
"trialNumYAxis": 41,
"variable": "result",
"value": 6.754284986628 
},
{
 "id": "dataTrial41",
"name": "df22",
"trialNumYAxis": 42,
"variable": "result",
"value":  2.99246645967 
},
{
 "id": "dataTrial42",
"name": "df22",
"trialNumYAxis": 43,
"variable": "result",
"value": 3.542346859319 
},
{
 "id": "dataTrial43",
"name": "df22",
"trialNumYAxis": 44,
"variable": "result",
"value":  4.31734726953 
},
{
 "id": "dataTrial44",
"name": "df22",
"trialNumYAxis": 45,
"variable": "result",
"value": 2.871804888356 
},
{
 "id": "dataTrial45",
"name": "df22",
"trialNumYAxis": 46,
"variable": "result",
"value": 0.2067783197735 
},
{
 "id": "dataTrial46",
"name": "df22",
"trialNumYAxis": 47,
"variable": "result",
"value": 0.6259716153929 
},
{
 "id": "dataTrial47",
"name": "df22",
"trialNumYAxis": 48,
"variable": "result",
"value": 0.7850348928717 
},
{
 "id": "dataTrial48",
"name": "df22",
"trialNumYAxis": 49,
"variable": "result",
"value": 1.185095338733 
},
{
 "id": "dataTrial49",
"name": "df22",
"trialNumYAxis": 50,
"variable": "result",
"value":  1.77889785972 
},
{
 "id": "dataTrial50",
"name": "df22",
"trialNumYAxis": 51,
"variable": "result",
"value": 0.6323323567525 
},
{
 "id": "dataTrial51",
"name": "df22",
"trialNumYAxis": 52,
"variable": "result",
"value": 2.027188633064 
},
{
 "id": "dataTrial52",
"name": "df22",
"trialNumYAxis": 53,
"variable": "result",
"value": 2.171988610588 
},
{
 "id": "dataTrial53",
"name": "df22",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.2336085061411 
},
{
 "id": "dataTrial54",
"name": "df22",
"trialNumYAxis": 55,
"variable": "result",
"value": 4.540305916489 
},
{
 "id": "dataTrial55",
"name": "df22",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.09285771256025 
},
{
 "id": "dataTrial56",
"name": "df22",
"trialNumYAxis": 57,
"variable": "result",
"value": 3.425996487364 
},
{
 "id": "dataTrial57",
"name": "df22",
"trialNumYAxis": 58,
"variable": "result",
"value": 4.738326483076 
},
{
 "id": "dataTrial58",
"name": "df22",
"trialNumYAxis": 59,
"variable": "result",
"value": 0.4847645079404 
},
{
 "id": "dataTrial59",
"name": "df22",
"trialNumYAxis": 60,
"variable": "result",
"value": 1.654563992246 
},
{
 "id": "dataTrial60",
"name": "df22",
"trialNumYAxis": 61,
"variable": "result",
"value": 1.103197570917 
},
{
 "id": "dataTrial61",
"name": "df22",
"trialNumYAxis": 62,
"variable": "result",
"value": 4.364654924159 
},
{
 "id": "dataTrial62",
"name": "df22",
"trialNumYAxis": 63,
"variable": "result",
"value": 2.230269085274 
},
{
 "id": "dataTrial63",
"name": "df22",
"trialNumYAxis": 64,
"variable": "result",
"value": 1.500350561942 
},
{
 "id": "dataTrial64",
"name": "df22",
"trialNumYAxis": 65,
"variable": "result",
"value": 1.937040274868 
},
{
 "id": "dataTrial65",
"name": "df22",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.2228495303936 
},
{
 "id": "dataTrial66",
"name": "df22",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.674494560507 
},
{
 "id": "dataTrial67",
"name": "df22",
"trialNumYAxis": 68,
"variable": "result",
"value": 0.09252574056127 
},
{
 "id": "dataTrial68",
"name": "df22",
"trialNumYAxis": 69,
"variable": "result",
"value": 15.12883502231 
},
{
 "id": "dataTrial69",
"name": "df22",
"trialNumYAxis": 70,
"variable": "result",
"value":  3.98380441755 
},
{
 "id": "dataTrial70",
"name": "df22",
"trialNumYAxis": 71,
"variable": "result",
"value": 1.396868013839 
},
{
 "id": "dataTrial71",
"name": "df22",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.6863792906508 
},
{
 "id": "dataTrial72",
"name": "df22",
"trialNumYAxis": 73,
"variable": "result",
"value": 1.230142922576 
},
{
 "id": "dataTrial0",
"name": "ab21",
"trialNumYAxis": 0,
"variable": "result",
"value":  2.22950820851 
},
{
 "id": "dataTrial1",
"name": "ab21",
"trialNumYAxis": 2,
"variable": "result",
"value": 2.127220669545 
},
{
 "id": "dataTrial2",
"name": "ab21",
"trialNumYAxis": 3,
"variable": "result",
"value": 51.77328664751 
},
{
 "id": "dataTrial3",
"name": "ab21",
"trialNumYAxis": 4,
"variable": "result",
"value": 1.667414950484 
},
{
 "id": "dataTrial4",
"name": "ab21",
"trialNumYAxis": 5,
"variable": "result",
"value": 6.267420304207 
},
{
 "id": "dataTrial5",
"name": "ab21",
"trialNumYAxis": 6,
"variable": "result",
"value": 1.749998796117 
},
{
 "id": "dataTrial6",
"name": "ab21",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.1227178812654 
},
{
 "id": "dataTrial7",
"name": "ab21",
"trialNumYAxis": 8,
"variable": "result",
"value": 29.75922119172 
},
{
 "id": "dataTrial8",
"name": "ab21",
"trialNumYAxis": 9,
"variable": "result",
"value": 4.708076152888 
},
{
 "id": "dataTrial9",
"name": "ab21",
"trialNumYAxis": 10,
"variable": "result",
"value": 0.993986326946 
},
{
 "id": "dataTrial10",
"name": "ab21",
"trialNumYAxis": 11,
"variable": "result",
"value": 5.891546329742 
},
{
 "id": "dataTrial11",
"name": "ab21",
"trialNumYAxis": 12,
"variable": "result",
"value": 1.647490312573 
},
{
 "id": "dataTrial12",
"name": "ab21",
"trialNumYAxis": 13,
"variable": "result",
"value": 3.452973472286 
},
{
 "id": "dataTrial13",
"name": "ab21",
"trialNumYAxis": 14,
"variable": "result",
"value": 22.60796339103 
},
{
 "id": "dataTrial14",
"name": "ab21",
"trialNumYAxis": 15,
"variable": "result",
"value":  6.25997293793 
},
{
 "id": "dataTrial15",
"name": "ab21",
"trialNumYAxis": 16,
"variable": "result",
"value": 1.168096613654 
},
{
 "id": "dataTrial16",
"name": "ab21",
"trialNumYAxis": 17,
"variable": "result",
"value": 22.21279755316 
},
{
 "id": "dataTrial17",
"name": "ab21",
"trialNumYAxis": 18,
"variable": "result",
"value": 4.580083745089 
},
{
 "id": "dataTrial18",
"name": "ab21",
"trialNumYAxis": 19,
"variable": "result",
"value": 0.7717128868294 
},
{
 "id": "dataTrial19",
"name": "ab21",
"trialNumYAxis": 20,
"variable": "result",
"value": 10.70943447992 
},
{
 "id": "dataTrial20",
"name": "ab21",
"trialNumYAxis": 21,
"variable": "result",
"value": 10.73291014961 
},
{
 "id": "dataTrial21",
"name": "ab21",
"trialNumYAxis": 22,
"variable": "result",
"value": 1.808986761705 
},
{
 "id": "dataTrial22",
"name": "ab21",
"trialNumYAxis": 23,
"variable": "result",
"value": 8.429049903861 
},
{
 "id": "dataTrial23",
"name": "ab21",
"trialNumYAxis": 24,
"variable": "result",
"value": 13.31958950968 
},
{
 "id": "dataTrial24",
"name": "ab21",
"trialNumYAxis": 25,
"variable": "result",
"value": 2.460352962988 
},
{
 "id": "dataTrial25",
"name": "ab21",
"trialNumYAxis": 26,
"variable": "result",
"value": 4.377609489346 
},
{
 "id": "dataTrial26",
"name": "ab21",
"trialNumYAxis": 27,
"variable": "result",
"value": 3.375309450893 
},
{
 "id": "dataTrial27",
"name": "ab21",
"trialNumYAxis": 28,
"variable": "result",
"value": 6.318912709166 
},
{
 "id": "dataTrial28",
"name": "ab21",
"trialNumYAxis": 29,
"variable": "result",
"value": 1.999178790652 
},
{
 "id": "dataTrial29",
"name": "ab21",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.363229828631 
},
{
 "id": "dataTrial30",
"name": "ab21",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.3692391695098 
},
{
 "id": "dataTrial31",
"name": "ab21",
"trialNumYAxis": 32,
"variable": "result",
"value": 1.411657248071 
},
{
 "id": "dataTrial32",
"name": "ab21",
"trialNumYAxis": 33,
"variable": "result",
"value": 2.755104300445 
},
{
 "id": "dataTrial33",
"name": "ab21",
"trialNumYAxis": 34,
"variable": "result",
"value": 6.869738286875 
},
{
 "id": "dataTrial34",
"name": "ab21",
"trialNumYAxis": 35,
"variable": "result",
"value": 3.075462060685 
},
{
 "id": "dataTrial35",
"name": "ab21",
"trialNumYAxis": 36,
"variable": "result",
"value": 4.467095187028 
},
{
 "id": "dataTrial36",
"name": "ab21",
"trialNumYAxis": 37,
"variable": "result",
"value": 0.8790233164306 
},
{
 "id": "dataTrial37",
"name": "ab21",
"trialNumYAxis": 38,
"variable": "result",
"value": 1.651490651354 
},
{
 "id": "dataTrial38",
"name": "ab21",
"trialNumYAxis": 39,
"variable": "result",
"value": 4.802503855014 
},
{
 "id": "dataTrial39",
"name": "ab21",
"trialNumYAxis": 40,
"variable": "result",
"value": 3.281971931424 
},
{
 "id": "dataTrial40",
"name": "ab21",
"trialNumYAxis": 41,
"variable": "result",
"value": 3.125189611687 
},
{
 "id": "dataTrial41",
"name": "ab21",
"trialNumYAxis": 42,
"variable": "result",
"value": 3.246954707142 
},
{
 "id": "dataTrial42",
"name": "ab21",
"trialNumYAxis": 43,
"variable": "result",
"value": 10.66518185948 
},
{
 "id": "dataTrial43",
"name": "ab21",
"trialNumYAxis": 44,
"variable": "result",
"value": 5.400006421438 
},
{
 "id": "dataTrial44",
"name": "ab21",
"trialNumYAxis": 45,
"variable": "result",
"value": 3.484561244235 
},
{
 "id": "dataTrial45",
"name": "ab21",
"trialNumYAxis": 46,
"variable": "result",
"value": 17.42758534944 
},
{
 "id": "dataTrial46",
"name": "ab21",
"trialNumYAxis": 47,
"variable": "result",
"value": 6.449127168901 
},
{
 "id": "dataTrial47",
"name": "ab21",
"trialNumYAxis": 48,
"variable": "result",
"value": 12.81366848515 
},
{
 "id": "dataTrial48",
"name": "ab21",
"trialNumYAxis": 49,
"variable": "result",
"value": 3.323408395577 
},
{
 "id": "dataTrial49",
"name": "ab21",
"trialNumYAxis": 50,
"variable": "result",
"value": 10.25927424285 
},
{
 "id": "dataTrial50",
"name": "ab21",
"trialNumYAxis": 51,
"variable": "result",
"value": 3.551339614314 
},
{
 "id": "dataTrial51",
"name": "ab21",
"trialNumYAxis": 52,
"variable": "result",
"value": 2.491251334762 
},
{
 "id": "dataTrial52",
"name": "ab21",
"trialNumYAxis": 53,
"variable": "result",
"value": 0.5050146926149 
},
{
 "id": "dataTrial53",
"name": "ab21",
"trialNumYAxis": 54,
"variable": "result",
"value": 3.720717364898 
},
{
 "id": "dataTrial54",
"name": "ab21",
"trialNumYAxis": 55,
"variable": "result",
"value": 6.050175324771 
},
{
 "id": "dataTrial55",
"name": "ab21",
"trialNumYAxis": 56,
"variable": "result",
"value": 3.922216859639 
},
{
 "id": "dataTrial56",
"name": "ab21",
"trialNumYAxis": 57,
"variable": "result",
"value": 0.08013989713557 
},
{
 "id": "dataTrial57",
"name": "ab21",
"trialNumYAxis": 58,
"variable": "result",
"value": 6.391245859835 
},
{
 "id": "dataTrial58",
"name": "ab21",
"trialNumYAxis": 59,
"variable": "result",
"value":  17.3121455629 
},
{
 "id": "dataTrial59",
"name": "ab21",
"trialNumYAxis": 60,
"variable": "result",
"value": 2.517595374819 
},
{
 "id": "dataTrial60",
"name": "ab21",
"trialNumYAxis": 61,
"variable": "result",
"value": 10.52766053212 
},
{
 "id": "dataTrial61",
"name": "ab21",
"trialNumYAxis": 62,
"variable": "result",
"value": 5.508297266844 
},
{
 "id": "dataTrial62",
"name": "ab21",
"trialNumYAxis": 63,
"variable": "result",
"value": 4.524970269593 
},
{
 "id": "dataTrial63",
"name": "ab21",
"trialNumYAxis": 64,
"variable": "result",
"value": 2.070073240865 
},
{
 "id": "dataTrial64",
"name": "ab21",
"trialNumYAxis": 65,
"variable": "result",
"value": 9.367469836008 
},
{
 "id": "dataTrial65",
"name": "ab21",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.7538984123862 
},
{
 "id": "dataTrial66",
"name": "ab21",
"trialNumYAxis": 67,
"variable": "result",
"value": 3.555020072223 
},
{
 "id": "dataTrial67",
"name": "ab21",
"trialNumYAxis": 68,
"variable": "result",
"value": 3.665883701688 
},
{
 "id": "dataTrial68",
"name": "ab21",
"trialNumYAxis": 69,
"variable": "result",
"value": 3.585852379639 
},
{
 "id": "dataTrial69",
"name": "ab21",
"trialNumYAxis": 70,
"variable": "result",
"value": 3.300064649479 
},
{
 "id": "dataTrial70",
"name": "ab21",
"trialNumYAxis": 71,
"variable": "result",
"value": 3.270607635964 
},
{
 "id": "dataTrial71",
"name": "ab21",
"trialNumYAxis": 72,
"variable": "result",
"value": 2.094940143078 
},
{
 "id": "dataTrial72",
"name": "ab21",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.1983145021607 
},
{
 "id": "dataTrial73",
"name": "ab21",
"trialNumYAxis": 74,
"variable": "result",
"value": 15.58983730622 
},
{
 "id": "dataTrial74",
"name": "ab21",
"trialNumYAxis": 75,
"variable": "result",
"value": 20.77709877402 
},
{
 "id": "dataTrial75",
"name": "ab21",
"trialNumYAxis": 76,
"variable": "result",
"value": 5.677569640289 
},
{
 "id": "dataTrial76",
"name": "ab21",
"trialNumYAxis": 77,
"variable": "result",
"value": 4.075492035578 
},
{
 "id": "dataTrial77",
"name": "ab21",
"trialNumYAxis": 78,
"variable": "result",
"value": 6.184533953354 
},
{
 "id": "dataTrial78",
"name": "ab21",
"trialNumYAxis": 79,
"variable": "result",
"value": 0.06903577588439 
},
{
 "id": "dataTrial79",
"name": "ab21",
"trialNumYAxis": 80,
"variable": "result",
"value": 7.917256026794 
},
{
 "id": "dataTrial80",
"name": "ab21",
"trialNumYAxis": 81,
"variable": "result",
"value": 0.9102562076759 
},
{
 "id": "dataTrial81",
"name": "ab21",
"trialNumYAxis": 82,
"variable": "result",
"value": 5.490115553794 
},
{
 "id": "dataTrial82",
"name": "ab21",
"trialNumYAxis": 83,
"variable": "result",
"value": 2.408438106306 
},
{
 "id": "dataTrial83",
"name": "ab21",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.7050712245524 
},
{
 "id": "dataTrial84",
"name": "ab21",
"trialNumYAxis": 85,
"variable": "result",
"value": 1.646241116532 
},
{
 "id": "dataTrial85",
"name": "ab21",
"trialNumYAxis": 86,
"variable": "result",
"value": 31.68247876963 
},
{
 "id": "dataTrial86",
"name": "ab21",
"trialNumYAxis": 87,
"variable": "result",
"value": 6.359488023954 
},
{
 "id": "dataTrial87",
"name": "ab21",
"trialNumYAxis": 88,
"variable": "result",
"value": 1.406249748619 
},
{
 "id": "dataTrial88",
"name": "ab21",
"trialNumYAxis": 89,
"variable": "result",
"value": 5.991096021985 
},
{
 "id": "dataTrial89",
"name": "ab21",
"trialNumYAxis": 90,
"variable": "result",
"value": 13.43580897735 
},
{
 "id": "dataTrial90",
"name": "ab21",
"trialNumYAxis": 91,
"variable": "result",
"value": 6.733568092035 
},
{
 "id": "dataTrial91",
"name": "ab21",
"trialNumYAxis": 92,
"variable": "result",
"value": 2.342849438288 
},
{
 "id": "dataTrial92",
"name": "ab21",
"trialNumYAxis": 93,
"variable": "result",
"value": 0.2573072687483 
},
{
 "id": "dataTrial93",
"name": "ab21",
"trialNumYAxis": 94,
"variable": "result",
"value":  4.42564947234 
},
{
 "id": "dataTrial94",
"name": "ab21",
"trialNumYAxis": 95,
"variable": "result",
"value": 0.3322627857277 
},
{
 "id": "dataTrial95",
"name": "ab21",
"trialNumYAxis": 96,
"variable": "result",
"value": 8.124284685234 
},
{
 "id": "dataTrial96",
"name": "ab21",
"trialNumYAxis": 97,
"variable": "result",
"value": 11.24914325466 
},
{
 "id": "dataTrial97",
"name": "ab21",
"trialNumYAxis": 98,
"variable": "result",
"value": 1.298524300454 
},
{
 "id": "dataTrial98",
"name": "ab21",
"trialNumYAxis": 99,
"variable": "result",
"value": 8.329139292181 
},
{
 "id": "dataTrial99",
"name": "ab21",
"trialNumYAxis": 100,
"variable": "result",
"value": 2.616772737237 
},
{
 "id": "dataTrial100",
"name": "ab21",
"trialNumYAxis": 101,
"variable": "result",
"value": 4.679916336893 
},
{
 "id": "dataTrial0",
"name": "gw25",
"trialNumYAxis": 0,
"variable": "result",
"value": 2.243106239383 
},
{
 "id": "dataTrial1",
"name": "gw25",
"trialNumYAxis": 2,
"variable": "result",
"value": 0.8557161885889 
},
{
 "id": "dataTrial2",
"name": "gw25",
"trialNumYAxis": 3,
"variable": "result",
"value": 2.200136139137 
},
{
 "id": "dataTrial3",
"name": "gw25",
"trialNumYAxis": 4,
"variable": "result",
"value": 0.2819022708673 
},
{
 "id": "dataTrial4",
"name": "gw25",
"trialNumYAxis": 5,
"variable": "result",
"value": 1.932826648584 
},
{
 "id": "dataTrial5",
"name": "gw25",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.9360794682725 
},
{
 "id": "dataTrial6",
"name": "gw25",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.4841022396595 
},
{
 "id": "dataTrial7",
"name": "gw25",
"trialNumYAxis": 8,
"variable": "result",
"value": 2.473028161311 
},
{
 "id": "dataTrial8",
"name": "gw25",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.2847504516279 
},
{
 "id": "dataTrial9",
"name": "gw25",
"trialNumYAxis": 10,
"variable": "result",
"value": 2.550486281539 
},
{
 "id": "dataTrial10",
"name": "gw25",
"trialNumYAxis": 11,
"variable": "result",
"value":  1.65821855539 
},
{
 "id": "dataTrial11",
"name": "gw25",
"trialNumYAxis": 12,
"variable": "result",
"value": 2.770069517769 
},
{
 "id": "dataTrial12",
"name": "gw25",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.216219917053 
},
{
 "id": "dataTrial13",
"name": "gw25",
"trialNumYAxis": 14,
"variable": "result",
"value": 3.608650375455 
},
{
 "id": "dataTrial14",
"name": "gw25",
"trialNumYAxis": 15,
"variable": "result",
"value": 1.687105214149 
},
{
 "id": "dataTrial15",
"name": "gw25",
"trialNumYAxis": 16,
"variable": "result",
"value": 0.5769638181939 
},
{
 "id": "dataTrial16",
"name": "gw25",
"trialNumYAxis": 17,
"variable": "result",
"value": 0.1599676915874 
},
{
 "id": "dataTrial17",
"name": "gw25",
"trialNumYAxis": 18,
"variable": "result",
"value": 0.5838304659539 
},
{
 "id": "dataTrial18",
"name": "gw25",
"trialNumYAxis": 19,
"variable": "result",
"value":  2.45872464023 
},
{
 "id": "dataTrial19",
"name": "gw25",
"trialNumYAxis": 20,
"variable": "result",
"value": 0.3423204919434 
},
{
 "id": "dataTrial20",
"name": "gw25",
"trialNumYAxis": 21,
"variable": "result",
"value": 1.026790542747 
},
{
 "id": "dataTrial21",
"name": "gw25",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.281989221153 
},
{
 "id": "dataTrial22",
"name": "gw25",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.2539264596089 
},
{
 "id": "dataTrial23",
"name": "gw25",
"trialNumYAxis": 24,
"variable": "result",
"value": 0.1182279143253 
},
{
 "id": "dataTrial24",
"name": "gw25",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.1221536169201 
},
{
 "id": "dataTrial25",
"name": "gw25",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.391723056666 
},
{
 "id": "dataTrial26",
"name": "gw25",
"trialNumYAxis": 27,
"variable": "result",
"value": 0.7438977674107 
},
{
 "id": "dataTrial27",
"name": "gw25",
"trialNumYAxis": 28,
"variable": "result",
"value": 0.3437924233538 
},
{
 "id": "dataTrial28",
"name": "gw25",
"trialNumYAxis": 29,
"variable": "result",
"value": 0.6979607995088 
},
{
 "id": "dataTrial29",
"name": "gw25",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.09200482250891 
},
{
 "id": "dataTrial30",
"name": "gw25",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.938691187141 
},
{
 "id": "dataTrial31",
"name": "gw25",
"trialNumYAxis": 32,
"variable": "result",
"value": 1.010070144649 
},
{
 "id": "dataTrial32",
"name": "gw25",
"trialNumYAxis": 33,
"variable": "result",
"value": 2.191035663931 
},
{
 "id": "dataTrial33",
"name": "gw25",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.5444509196405 
},
{
 "id": "dataTrial34",
"name": "gw25",
"trialNumYAxis": 35,
"variable": "result",
"value":  3.09867912868 
},
{
 "id": "dataTrial35",
"name": "gw25",
"trialNumYAxis": 36,
"variable": "result",
"value": 0.4734821125817 
},
{
 "id": "dataTrial36",
"name": "gw25",
"trialNumYAxis": 37,
"variable": "result",
"value": 0.8787377934532 
},
{
 "id": "dataTrial37",
"name": "gw25",
"trialNumYAxis": 38,
"variable": "result",
"value": 3.097893310702 
},
{
 "id": "dataTrial38",
"name": "gw25",
"trialNumYAxis": 39,
"variable": "result",
"value": 1.142118960018 
},
{
 "id": "dataTrial39",
"name": "gw25",
"trialNumYAxis": 40,
"variable": "result",
"value": 0.5007206350207 
},
{
 "id": "dataTrial40",
"name": "gw25",
"trialNumYAxis": 41,
"variable": "result",
"value": 0.6876205179439 
},
{
 "id": "dataTrial41",
"name": "gw25",
"trialNumYAxis": 42,
"variable": "result",
"value": 1.214468788501 
},
{
 "id": "dataTrial42",
"name": "gw25",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.1792649223062 
},
{
 "id": "dataTrial43",
"name": "gw25",
"trialNumYAxis": 44,
"variable": "result",
"value": 1.621892417494 
},
{
 "id": "dataTrial44",
"name": "gw25",
"trialNumYAxis": 45,
"variable": "result",
"value": 0.6833496645458 
},
{
 "id": "dataTrial45",
"name": "gw25",
"trialNumYAxis": 46,
"variable": "result",
"value": 1.067891827342 
},
{
 "id": "dataTrial46",
"name": "gw25",
"trialNumYAxis": 47,
"variable": "result",
"value": 0.5158702901664 
},
{
 "id": "dataTrial47",
"name": "gw25",
"trialNumYAxis": 48,
"variable": "result",
"value":  2.98175198366 
},
{
 "id": "dataTrial48",
"name": "gw25",
"trialNumYAxis": 49,
"variable": "result",
"value": 0.1820954254151 
},
{
 "id": "dataTrial49",
"name": "gw25",
"trialNumYAxis": 50,
"variable": "result",
"value": 2.302165865986 
},
{
 "id": "dataTrial50",
"name": "gw25",
"trialNumYAxis": 51,
"variable": "result",
"value": 2.063011546599 
},
{
 "id": "dataTrial51",
"name": "gw25",
"trialNumYAxis": 52,
"variable": "result",
"value": 1.645607792851 
},
{
 "id": "dataTrial52",
"name": "gw25",
"trialNumYAxis": 53,
"variable": "result",
"value": 0.5160394898407 
},
{
 "id": "dataTrial53",
"name": "gw25",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.5626133835126 
},
{
 "id": "dataTrial54",
"name": "gw25",
"trialNumYAxis": 55,
"variable": "result",
"value": 0.6936452153422 
},
{
 "id": "dataTrial55",
"name": "gw25",
"trialNumYAxis": 56,
"variable": "result",
"value":  2.18933914496 
},
{
 "id": "dataTrial56",
"name": "gw25",
"trialNumYAxis": 57,
"variable": "result",
"value": 2.652864768651 
},
{
 "id": "dataTrial57",
"name": "gw25",
"trialNumYAxis": 58,
"variable": "result",
"value": 0.2228825781016 
},
{
 "id": "dataTrial58",
"name": "gw25",
"trialNumYAxis": 59,
"variable": "result",
"value": 1.013431676136 
},
{
 "id": "dataTrial59",
"name": "gw25",
"trialNumYAxis": 60,
"variable": "result",
"value": 0.2270451303282 
},
{
 "id": "dataTrial60",
"name": "gw25",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.5143053338024 
},
{
 "id": "dataTrial61",
"name": "gw25",
"trialNumYAxis": 62,
"variable": "result",
"value": 1.274793041853 
},
{
 "id": "dataTrial62",
"name": "gw25",
"trialNumYAxis": 63,
"variable": "result",
"value": 5.017570964753 
},
{
 "id": "dataTrial63",
"name": "gw25",
"trialNumYAxis": 64,
"variable": "result",
"value": 1.387058342601 
},
{
 "id": "dataTrial64",
"name": "gw25",
"trialNumYAxis": 65,
"variable": "result",
"value": 0.3791498190429 
},
{
 "id": "dataTrial65",
"name": "gw25",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.08750207787305 
},
{
 "id": "dataTrial66",
"name": "gw25",
"trialNumYAxis": 67,
"variable": "result",
"value": 0.7688393847608 
},
{
 "id": "dataTrial67",
"name": "gw25",
"trialNumYAxis": 68,
"variable": "result",
"value": 1.265887177283 
},
{
 "id": "dataTrial68",
"name": "gw25",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.1003142048155 
},
{
 "id": "dataTrial69",
"name": "gw25",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.08181893960199 
},
{
 "id": "dataTrial70",
"name": "gw25",
"trialNumYAxis": 71,
"variable": "result",
"value": 1.665939820664 
},
{
 "id": "dataTrial71",
"name": "gw25",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.2020288152118 
},
{
 "id": "dataTrial72",
"name": "gw25",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.120517384061 
},
{
 "id": "dataTrial73",
"name": "gw25",
"trialNumYAxis": 74,
"variable": "result",
"value": 5.805147434818 
},
{
 "id": "dataTrial74",
"name": "gw25",
"trialNumYAxis": 75,
"variable": "result",
"value": 0.9046455988495 
},
{
 "id": "dataTrial75",
"name": "gw25",
"trialNumYAxis": 76,
"variable": "result",
"value": 0.6312105059696 
},
{
 "id": "dataTrial76",
"name": "gw25",
"trialNumYAxis": 77,
"variable": "result",
"value": 0.0005980951312949 
},
{
 "id": "dataTrial77",
"name": "gw25",
"trialNumYAxis": 78,
"variable": "result",
"value": 0.0202907158161 
},
{
 "id": "dataTrial78",
"name": "gw25",
"trialNumYAxis": 79,
"variable": "result",
"value": 1.449693119359 
},
{
 "id": "dataTrial79",
"name": "gw25",
"trialNumYAxis": 80,
"variable": "result",
"value": 3.580370556913 
},
{
 "id": "dataTrial80",
"name": "gw25",
"trialNumYAxis": 81,
"variable": "result",
"value": 1.222520273134 
},
{
 "id": "dataTrial81",
"name": "gw25",
"trialNumYAxis": 82,
"variable": "result",
"value": 1.354464101919 
},
{
 "id": "dataTrial82",
"name": "gw25",
"trialNumYAxis": 83,
"variable": "result",
"value": 0.4962822974019 
},
{
 "id": "dataTrial83",
"name": "gw25",
"trialNumYAxis": 84,
"variable": "result",
"value": 1.042522326598 
},
{
 "id": "dataTrial84",
"name": "gw25",
"trialNumYAxis": 85,
"variable": "result",
"value": 0.5338137044005 
},
{
 "id": "dataTrial85",
"name": "gw25",
"trialNumYAxis": 86,
"variable": "result",
"value": 0.7681066476058 
},
{
 "id": "dataTrial86",
"name": "gw25",
"trialNumYAxis": 87,
"variable": "result",
"value":  2.05537242253 
},
{
 "id": "dataTrial87",
"name": "gw25",
"trialNumYAxis": 88,
"variable": "result",
"value": 1.324196767731 
},
{
 "id": "dataTrial88",
"name": "gw25",
"trialNumYAxis": 89,
"variable": "result",
"value": 1.029568205174 
},
{
 "id": "dataTrial89",
"name": "gw25",
"trialNumYAxis": 90,
"variable": "result",
"value": 1.100677671746 
},
{
 "id": "dataTrial90",
"name": "gw25",
"trialNumYAxis": 91,
"variable": "result",
"value": 0.2034300118694 
},
{
 "id": "dataTrial91",
"name": "gw25",
"trialNumYAxis": 92,
"variable": "result",
"value":  1.49728875152 
},
{
 "id": "dataTrial92",
"name": "gw25",
"trialNumYAxis": 93,
"variable": "result",
"value": 0.2264849459472 
},
{
 "id": "dataTrial93",
"name": "gw25",
"trialNumYAxis": 94,
"variable": "result",
"value": 0.4926128301772 
},
{
 "id": "dataTrial94",
"name": "gw25",
"trialNumYAxis": 95,
"variable": "result",
"value": 4.939784464164 
},
{
 "id": "dataTrial95",
"name": "gw25",
"trialNumYAxis": 96,
"variable": "result",
"value": 2.290939365966 
},
{
 "id": "dataTrial96",
"name": "gw25",
"trialNumYAxis": 97,
"variable": "result",
"value": 0.3459200654976 
},
{
 "id": "dataTrial97",
"name": "gw25",
"trialNumYAxis": 98,
"variable": "result",
"value": 0.8075853197701 
},
{
 "id": "dataTrial98",
"name": "gw25",
"trialNumYAxis": 99,
"variable": "result",
"value": 2.614595594448 
},
{
 "id": "dataTrial99",
"name": "gw25",
"trialNumYAxis": 100,
"variable": "result",
"value":  3.59104093647 
},
{
 "id": "dataTrial100",
"name": "gw25",
"trialNumYAxis": 101,
"variable": "result",
"value": 2.895286727125 
},
{
 "id": "dataTrial101",
"name": "gw25",
"trialNumYAxis": 102,
"variable": "result",
"value": 0.1015248230675 
},
{
 "id": "dataTrial102",
"name": "gw25",
"trialNumYAxis": 103,
"variable": "result",
"value": 1.748994679008 
},
{
 "id": "dataTrial103",
"name": "gw25",
"trialNumYAxis": 104,
"variable": "result",
"value": 1.213337025483 
},
{
 "id": "dataTrial104",
"name": "gw25",
"trialNumYAxis": 105,
"variable": "result",
"value": 4.297779581941 
},
{
 "id": "dataTrial0",
"name": "mn15",
"trialNumYAxis": 0,
"variable": "result",
"value": 5.948928529682 
},
{
 "id": "dataTrial1",
"name": "mn15",
"trialNumYAxis": 2,
"variable": "result",
"value": 1.820302638383 
},
{
 "id": "dataTrial2",
"name": "mn15",
"trialNumYAxis": 3,
"variable": "result",
"value": 3.804792463944 
},
{
 "id": "dataTrial3",
"name": "mn15",
"trialNumYAxis": 4,
"variable": "result",
"value": 5.346304751618 
},
{
 "id": "dataTrial4",
"name": "mn15",
"trialNumYAxis": 5,
"variable": "result",
"value": 1.251294032534 
},
{
 "id": "dataTrial5",
"name": "mn15",
"trialNumYAxis": 6,
"variable": "result",
"value": 17.60851514872 
},
{
 "id": "dataTrial6",
"name": "mn15",
"trialNumYAxis": 7,
"variable": "result",
"value": 28.46042098919 
},
{
 "id": "dataTrial7",
"name": "mn15",
"trialNumYAxis": 8,
"variable": "result",
"value": 14.48896881687 
},
{
 "id": "dataTrial8",
"name": "mn15",
"trialNumYAxis": 9,
"variable": "result",
"value": 4.278147241849 
},
{
 "id": "dataTrial9",
"name": "mn15",
"trialNumYAxis": 10,
"variable": "result",
"value": 7.746394467436 
},
{
 "id": "dataTrial10",
"name": "mn15",
"trialNumYAxis": 11,
"variable": "result",
"value": 4.702602079008 
},
{
 "id": "dataTrial11",
"name": "mn15",
"trialNumYAxis": 12,
"variable": "result",
"value":   1.1002364458 
},
{
 "id": "dataTrial12",
"name": "mn15",
"trialNumYAxis": 13,
"variable": "result",
"value": 7.216636885638 
},
{
 "id": "dataTrial13",
"name": "mn15",
"trialNumYAxis": 14,
"variable": "result",
"value": 2.042563772859 
},
{
 "id": "dataTrial14",
"name": "mn15",
"trialNumYAxis": 15,
"variable": "result",
"value": 36.47372493971 
},
{
 "id": "dataTrial15",
"name": "mn15",
"trialNumYAxis": 16,
"variable": "result",
"value": 11.48566141391 
},
{
 "id": "dataTrial16",
"name": "mn15",
"trialNumYAxis": 17,
"variable": "result",
"value": 5.580004593926 
},
{
 "id": "dataTrial17",
"name": "mn15",
"trialNumYAxis": 18,
"variable": "result",
"value": 1.405369439415 
},
{
 "id": "dataTrial18",
"name": "mn15",
"trialNumYAxis": 19,
"variable": "result",
"value": 1.073712575427 
},
{
 "id": "dataTrial19",
"name": "mn15",
"trialNumYAxis": 20,
"variable": "result",
"value": 14.98954499074 
},
{
 "id": "dataTrial20",
"name": "mn15",
"trialNumYAxis": 21,
"variable": "result",
"value":  12.9806857379 
},
{
 "id": "dataTrial21",
"name": "mn15",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.4815933040165 
},
{
 "id": "dataTrial22",
"name": "mn15",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.9197108637543 
},
{
 "id": "dataTrial23",
"name": "mn15",
"trialNumYAxis": 24,
"variable": "result",
"value": 5.732183910858 
},
{
 "id": "dataTrial24",
"name": "mn15",
"trialNumYAxis": 25,
"variable": "result",
"value": 3.057946662396 
},
{
 "id": "dataTrial25",
"name": "mn15",
"trialNumYAxis": 26,
"variable": "result",
"value": 4.181124270878 
},
{
 "id": "dataTrial26",
"name": "mn15",
"trialNumYAxis": 27,
"variable": "result",
"value": 1.772219353043 
},
{
 "id": "dataTrial27",
"name": "mn15",
"trialNumYAxis": 28,
"variable": "result",
"value": 4.043500270672 
},
{
 "id": "dataTrial28",
"name": "mn15",
"trialNumYAxis": 29,
"variable": "result",
"value": 8.361838764096 
},
{
 "id": "dataTrial29",
"name": "mn15",
"trialNumYAxis": 30,
"variable": "result",
"value": 1.370997656633 
},
{
 "id": "dataTrial30",
"name": "mn15",
"trialNumYAxis": 31,
"variable": "result",
"value": 13.49008468007 
},
{
 "id": "dataTrial31",
"name": "mn15",
"trialNumYAxis": 32,
"variable": "result",
"value": 6.186230079875 
},
{
 "id": "dataTrial32",
"name": "mn15",
"trialNumYAxis": 33,
"variable": "result",
"value": 8.230031143956 
},
{
 "id": "dataTrial33",
"name": "mn15",
"trialNumYAxis": 34,
"variable": "result",
"value": 4.757778510284 
},
{
 "id": "dataTrial34",
"name": "mn15",
"trialNumYAxis": 35,
"variable": "result",
"value": 1.575617808896 
},
{
 "id": "dataTrial35",
"name": "mn15",
"trialNumYAxis": 36,
"variable": "result",
"value":  4.89408627176 
},
{
 "id": "dataTrial36",
"name": "mn15",
"trialNumYAxis": 37,
"variable": "result",
"value": 8.461876761881 
},
{
 "id": "dataTrial37",
"name": "mn15",
"trialNumYAxis": 38,
"variable": "result",
"value": 0.7151009787912 
},
{
 "id": "dataTrial38",
"name": "mn15",
"trialNumYAxis": 39,
"variable": "result",
"value": 4.864379342165 
},
{
 "id": "dataTrial39",
"name": "mn15",
"trialNumYAxis": 40,
"variable": "result",
"value": 6.174495451605 
},
{
 "id": "dataTrial40",
"name": "mn15",
"trialNumYAxis": 41,
"variable": "result",
"value": 5.590495554388 
},
{
 "id": "dataTrial41",
"name": "mn15",
"trialNumYAxis": 42,
"variable": "result",
"value": 1.009893648993 
},
{
 "id": "dataTrial42",
"name": "mn15",
"trialNumYAxis": 43,
"variable": "result",
"value": 9.067573318993 
},
{
 "id": "dataTrial43",
"name": "mn15",
"trialNumYAxis": 44,
"variable": "result",
"value": 0.9590101409715 
},
{
 "id": "dataTrial44",
"name": "mn15",
"trialNumYAxis": 45,
"variable": "result",
"value": 1.674835804126 
},
{
 "id": "dataTrial45",
"name": "mn15",
"trialNumYAxis": 46,
"variable": "result",
"value": 4.049555416923 
},
{
 "id": "dataTrial46",
"name": "mn15",
"trialNumYAxis": 47,
"variable": "result",
"value": 0.3727481795595 
},
{
 "id": "dataTrial47",
"name": "mn15",
"trialNumYAxis": 48,
"variable": "result",
"value": 1.118314127323 
},
{
 "id": "dataTrial48",
"name": "mn15",
"trialNumYAxis": 49,
"variable": "result",
"value": 2.960947186415 
},
{
 "id": "dataTrial49",
"name": "mn15",
"trialNumYAxis": 50,
"variable": "result",
"value":  3.31157139705 
},
{
 "id": "dataTrial50",
"name": "mn15",
"trialNumYAxis": 51,
"variable": "result",
"value": 0.7728476947454 
},
{
 "id": "dataTrial51",
"name": "mn15",
"trialNumYAxis": 52,
"variable": "result",
"value": 1.967048076454 
},
{
 "id": "dataTrial52",
"name": "mn15",
"trialNumYAxis": 53,
"variable": "result",
"value": 3.245395298602 
},
{
 "id": "dataTrial53",
"name": "mn15",
"trialNumYAxis": 54,
"variable": "result",
"value": 14.33763172602 
},
{
 "id": "dataTrial54",
"name": "mn15",
"trialNumYAxis": 55,
"variable": "result",
"value": 0.5732284561839 
},
{
 "id": "dataTrial55",
"name": "mn15",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.449255730102 
},
{
 "id": "dataTrial56",
"name": "mn15",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.967623502575 
},
{
 "id": "dataTrial57",
"name": "mn15",
"trialNumYAxis": 58,
"variable": "result",
"value": 1.149766761729 
},
{
 "id": "dataTrial58",
"name": "mn15",
"trialNumYAxis": 59,
"variable": "result",
"value": 4.290117903174 
},
{
 "id": "dataTrial59",
"name": "mn15",
"trialNumYAxis": 60,
"variable": "result",
"value": 1.792438035537 
},
{
 "id": "dataTrial60",
"name": "mn15",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.3523527356508 
},
{
 "id": "dataTrial61",
"name": "mn15",
"trialNumYAxis": 62,
"variable": "result",
"value": 1.316644403619 
},
{
 "id": "dataTrial62",
"name": "mn15",
"trialNumYAxis": 63,
"variable": "result",
"value": 1.113911161025 
},
{
 "id": "dataTrial63",
"name": "mn15",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.02004066882617 
},
{
 "id": "dataTrial64",
"name": "mn15",
"trialNumYAxis": 65,
"variable": "result",
"value": 5.714445795152 
},
{
 "id": "dataTrial65",
"name": "mn15",
"trialNumYAxis": 66,
"variable": "result",
"value":  4.78251667358 
},
{
 "id": "dataTrial66",
"name": "mn15",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.806815096623 
},
{
 "id": "dataTrial67",
"name": "mn15",
"trialNumYAxis": 68,
"variable": "result",
"value": 8.335816654014 
},
{
 "id": "dataTrial68",
"name": "mn15",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.5694504720284 
},
{
 "id": "dataTrial69",
"name": "mn15",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.1229142828929 
},
{
 "id": "dataTrial70",
"name": "mn15",
"trialNumYAxis": 71,
"variable": "result",
"value": 1.318226927579 
},
{
 "id": "dataTrial71",
"name": "mn15",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.1785135666087 
},
{
 "id": "dataTrial72",
"name": "mn15",
"trialNumYAxis": 73,
"variable": "result",
"value": 3.420967060749 
},
{
 "id": "dataTrial73",
"name": "mn15",
"trialNumYAxis": 74,
"variable": "result",
"value": 17.80516517663 
},
{
 "id": "dataTrial74",
"name": "mn15",
"trialNumYAxis": 75,
"variable": "result",
"value": 2.023399139726 
},
{
 "id": "dataTrial75",
"name": "mn15",
"trialNumYAxis": 76,
"variable": "result",
"value": 1.613693543338 
},
{
 "id": "dataTrial76",
"name": "mn15",
"trialNumYAxis": 77,
"variable": "result",
"value": 1.308573366478 
},
{
 "id": "dataTrial77",
"name": "mn15",
"trialNumYAxis": 78,
"variable": "result",
"value": 0.7818011072418 
},
{
 "id": "dataTrial78",
"name": "mn15",
"trialNumYAxis": 79,
"variable": "result",
"value": 3.430133293052 
},
{
 "id": "dataTrial79",
"name": "mn15",
"trialNumYAxis": 80,
"variable": "result",
"value": 0.6332408183788 
},
{
 "id": "dataTrial80",
"name": "mn15",
"trialNumYAxis": 81,
"variable": "result",
"value": 0.1130774511966 
},
{
 "id": "dataTrial81",
"name": "mn15",
"trialNumYAxis": 82,
"variable": "result",
"value": 1.571435502108 
},
{
 "id": "dataTrial82",
"name": "mn15",
"trialNumYAxis": 83,
"variable": "result",
"value": 5.008203619181 
},
{
 "id": "dataTrial83",
"name": "mn15",
"trialNumYAxis": 84,
"variable": "result",
"value": 1.616529727074 
},
{
 "id": "dataTrial84",
"name": "mn15",
"trialNumYAxis": 85,
"variable": "result",
"value": 1.115741838884 
},
{
 "id": "dataTrial85",
"name": "mn15",
"trialNumYAxis": 86,
"variable": "result",
"value": 1.764792921742 
},
{
 "id": "dataTrial86",
"name": "mn15",
"trialNumYAxis": 87,
"variable": "result",
"value": 2.341360188743 
},
{
 "id": "dataTrial87",
"name": "mn15",
"trialNumYAxis": 88,
"variable": "result",
"value": 0.1871809957906 
},
{
 "id": "dataTrial88",
"name": "mn15",
"trialNumYAxis": 89,
"variable": "result",
"value": 0.6717321079765 
},
{
 "id": "dataTrial89",
"name": "mn15",
"trialNumYAxis": 90,
"variable": "result",
"value": 0.4854191826761 
},
{
 "id": "dataTrial90",
"name": "mn15",
"trialNumYAxis": 91,
"variable": "result",
"value": 1.347570199879 
},
{
 "id": "dataTrial91",
"name": "mn15",
"trialNumYAxis": 92,
"variable": "result",
"value": 0.3920967664529 
},
{
 "id": "dataTrial92",
"name": "mn15",
"trialNumYAxis": 93,
"variable": "result",
"value": 1.488443918347 
},
{
 "id": "dataTrial93",
"name": "mn15",
"trialNumYAxis": 94,
"variable": "result",
"value": 1.142506702634 
},
{
 "id": "dataTrial94",
"name": "mn15",
"trialNumYAxis": 95,
"variable": "result",
"value": 0.355465844796 
},
{
 "id": "dataTrial95",
"name": "mn15",
"trialNumYAxis": 96,
"variable": "result",
"value": 0.4293443972405 
},
{
 "id": "dataTrial96",
"name": "mn15",
"trialNumYAxis": 97,
"variable": "result",
"value": 0.7282086533845 
},
{
 "id": "dataTrial97",
"name": "mn15",
"trialNumYAxis": 98,
"variable": "result",
"value": 2.302122546312 
},
{
 "id": "dataTrial98",
"name": "mn15",
"trialNumYAxis": 99,
"variable": "result",
"value": 0.187479862791 
},
{
 "id": "dataTrial99",
"name": "mn15",
"trialNumYAxis": 100,
"variable": "result",
"value": 8.080845022639 
},
{
 "id": "dataTrial100",
"name": "mn15",
"trialNumYAxis": 101,
"variable": "result",
"value": 1.960796679165 
},
{
 "id": "dataTrial101",
"name": "mn15",
"trialNumYAxis": 102,
"variable": "result",
"value": 1.896789696616 
},
{
 "id": "dataTrial102",
"name": "mn15",
"trialNumYAxis": 103,
"variable": "result",
"value": 3.128656454675 
},
{
 "id": "dataTrial103",
"name": "mn15",
"trialNumYAxis": 104,
"variable": "result",
"value": 0.8078265790942 
},
{
 "id": "dataTrial104",
"name": "mn15",
"trialNumYAxis": 105,
"variable": "result",
"value": 2.066283631283 
},
{
 "id": "dataTrial105",
"name": "mn15",
"trialNumYAxis": 106,
"variable": "result",
"value": 1.849569895104 
},
{
 "id": "dataTrial106",
"name": "mn15",
"trialNumYAxis": 107,
"variable": "result",
"value": 2.186502615181 
},
{
 "id": "dataTrial107",
"name": "mn15",
"trialNumYAxis": 108,
"variable": "result",
"value": 1.945176142037 
},
{
 "id": "dataTrial108",
"name": "mn15",
"trialNumYAxis": 109,
"variable": "result",
"value": 1.680024612207 
},
{
 "id": "dataTrial0",
"name": "el20",
"trialNumYAxis": 0,
"variable": "result",
"value": 1.448963647843 
},
{
 "id": "dataTrial1",
"name": "el20",
"trialNumYAxis": 2,
"variable": "result",
"value": 3.978658743483 
},
{
 "id": "dataTrial2",
"name": "el20",
"trialNumYAxis": 3,
"variable": "result",
"value": 4.876885193175 
},
{
 "id": "dataTrial3",
"name": "el20",
"trialNumYAxis": 4,
"variable": "result",
"value": 2.977248481713 
},
{
 "id": "dataTrial4",
"name": "el20",
"trialNumYAxis": 5,
"variable": "result",
"value": 10.32566339037 
},
{
 "id": "dataTrial5",
"name": "el20",
"trialNumYAxis": 6,
"variable": "result",
"value": 2.239233381503 
},
{
 "id": "dataTrial6",
"name": "el20",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.1943039364687 
},
{
 "id": "dataTrial7",
"name": "el20",
"trialNumYAxis": 8,
"variable": "result",
"value": 2.222998534488 
},
{
 "id": "dataTrial8",
"name": "el20",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.02575650327739 
},
{
 "id": "dataTrial9",
"name": "el20",
"trialNumYAxis": 10,
"variable": "result",
"value": 1.848601870076 
},
{
 "id": "dataTrial10",
"name": "el20",
"trialNumYAxis": 11,
"variable": "result",
"value": 1.017885748132 
},
{
 "id": "dataTrial11",
"name": "el20",
"trialNumYAxis": 12,
"variable": "result",
"value": 2.099974375844 
},
{
 "id": "dataTrial12",
"name": "el20",
"trialNumYAxis": 13,
"variable": "result",
"value": 3.191654769189 
},
{
 "id": "dataTrial13",
"name": "el20",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.5891287855874 
},
{
 "id": "dataTrial14",
"name": "el20",
"trialNumYAxis": 15,
"variable": "result",
"value": 10.95169983512 
},
{
 "id": "dataTrial15",
"name": "el20",
"trialNumYAxis": 16,
"variable": "result",
"value": 0.06779387065043 
},
{
 "id": "dataTrial16",
"name": "el20",
"trialNumYAxis": 17,
"variable": "result",
"value": 0.4679262179678 
},
{
 "id": "dataTrial17",
"name": "el20",
"trialNumYAxis": 18,
"variable": "result",
"value": 3.604135637286 
},
{
 "id": "dataTrial18",
"name": "el20",
"trialNumYAxis": 19,
"variable": "result",
"value": 3.774502933519 
},
{
 "id": "dataTrial19",
"name": "el20",
"trialNumYAxis": 20,
"variable": "result",
"value": 2.251782327376 
},
{
 "id": "dataTrial20",
"name": "el20",
"trialNumYAxis": 21,
"variable": "result",
"value": 1.521008227567 
},
{
 "id": "dataTrial21",
"name": "el20",
"trialNumYAxis": 22,
"variable": "result",
"value": 3.008581350564 
},
{
 "id": "dataTrial22",
"name": "el20",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.3265683770934 
},
{
 "id": "dataTrial23",
"name": "el20",
"trialNumYAxis": 24,
"variable": "result",
"value": 2.206054276215 
},
{
 "id": "dataTrial24",
"name": "el20",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.9957372277287 
},
{
 "id": "dataTrial25",
"name": "el20",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.029842661391 
},
{
 "id": "dataTrial26",
"name": "el20",
"trialNumYAxis": 27,
"variable": "result",
"value": 1.182903885119 
},
{
 "id": "dataTrial27",
"name": "el20",
"trialNumYAxis": 28,
"variable": "result",
"value": 4.008311964856 
},
{
 "id": "dataTrial28",
"name": "el20",
"trialNumYAxis": 29,
"variable": "result",
"value": 2.355667707514 
},
{
 "id": "dataTrial29",
"name": "el20",
"trialNumYAxis": 30,
"variable": "result",
"value": 2.976988077309 
},
{
 "id": "dataTrial30",
"name": "el20",
"trialNumYAxis": 31,
"variable": "result",
"value": 1.918558048006 
},
{
 "id": "dataTrial31",
"name": "el20",
"trialNumYAxis": 32,
"variable": "result",
"value": 0.6153027900824 
},
{
 "id": "dataTrial32",
"name": "el20",
"trialNumYAxis": 33,
"variable": "result",
"value": 1.858164188217 
},
{
 "id": "dataTrial33",
"name": "el20",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.02215471708706 
},
{
 "id": "dataTrial34",
"name": "el20",
"trialNumYAxis": 35,
"variable": "result",
"value": 5.017050980457 
},
{
 "id": "dataTrial35",
"name": "el20",
"trialNumYAxis": 36,
"variable": "result",
"value": 1.606841302308 
},
{
 "id": "dataTrial36",
"name": "el20",
"trialNumYAxis": 37,
"variable": "result",
"value":  2.42009562341 
},
{
 "id": "dataTrial37",
"name": "el20",
"trialNumYAxis": 38,
"variable": "result",
"value": 0.6036138051815 
},
{
 "id": "dataTrial38",
"name": "el20",
"trialNumYAxis": 39,
"variable": "result",
"value": 4.922852007738 
},
{
 "id": "dataTrial39",
"name": "el20",
"trialNumYAxis": 40,
"variable": "result",
"value": 0.526636912294 
},
{
 "id": "dataTrial40",
"name": "el20",
"trialNumYAxis": 41,
"variable": "result",
"value": 6.321727195753 
},
{
 "id": "dataTrial41",
"name": "el20",
"trialNumYAxis": 42,
"variable": "result",
"value": 3.793563302842 
},
{
 "id": "dataTrial42",
"name": "el20",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.5762634134757 
},
{
 "id": "dataTrial43",
"name": "el20",
"trialNumYAxis": 44,
"variable": "result",
"value": 5.604465989075 
},
{
 "id": "dataTrial44",
"name": "el20",
"trialNumYAxis": 45,
"variable": "result",
"value": 1.365589661789 
},
{
 "id": "dataTrial45",
"name": "el20",
"trialNumYAxis": 46,
"variable": "result",
"value": 0.2228091009727 
},
{
 "id": "dataTrial46",
"name": "el20",
"trialNumYAxis": 47,
"variable": "result",
"value":  1.67874086696 
},
{
 "id": "dataTrial47",
"name": "el20",
"trialNumYAxis": 48,
"variable": "result",
"value": 4.626852224798 
},
{
 "id": "dataTrial48",
"name": "el20",
"trialNumYAxis": 49,
"variable": "result",
"value": 3.365389999689 
},
{
 "id": "dataTrial49",
"name": "el20",
"trialNumYAxis": 50,
"variable": "result",
"value": 8.772746084037 
},
{
 "id": "dataTrial50",
"name": "el20",
"trialNumYAxis": 51,
"variable": "result",
"value": 1.840223869475 
},
{
 "id": "dataTrial51",
"name": "el20",
"trialNumYAxis": 52,
"variable": "result",
"value": 0.7617066250898 
},
{
 "id": "dataTrial52",
"name": "el20",
"trialNumYAxis": 53,
"variable": "result",
"value": 1.145952723699 
},
{
 "id": "dataTrial53",
"name": "el20",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.7009252450713 
},
{
 "id": "dataTrial54",
"name": "el20",
"trialNumYAxis": 55,
"variable": "result",
"value": 3.219891768889 
},
{
 "id": "dataTrial55",
"name": "el20",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.2744915216903 
},
{
 "id": "dataTrial56",
"name": "el20",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.433622827563 
},
{
 "id": "dataTrial57",
"name": "el20",
"trialNumYAxis": 58,
"variable": "result",
"value": 0.6068138483626 
},
{
 "id": "dataTrial58",
"name": "el20",
"trialNumYAxis": 59,
"variable": "result",
"value": 1.132212972701 
},
{
 "id": "dataTrial59",
"name": "el20",
"trialNumYAxis": 60,
"variable": "result",
"value": 1.806766815657 
},
{
 "id": "dataTrial60",
"name": "el20",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.2363369148639 
},
{
 "id": "dataTrial61",
"name": "el20",
"trialNumYAxis": 62,
"variable": "result",
"value": 0.06028235233964 
},
{
 "id": "dataTrial62",
"name": "el20",
"trialNumYAxis": 63,
"variable": "result",
"value": 3.047278058253 
},
{
 "id": "dataTrial63",
"name": "el20",
"trialNumYAxis": 64,
"variable": "result",
"value": 18.89363115726 
},
{
 "id": "dataTrial64",
"name": "el20",
"trialNumYAxis": 65,
"variable": "result",
"value": 2.572317628896 
},
{
 "id": "dataTrial65",
"name": "el20",
"trialNumYAxis": 66,
"variable": "result",
"value": 1.165734425591 
},
{
 "id": "dataTrial66",
"name": "el20",
"trialNumYAxis": 67,
"variable": "result",
"value": 3.479035690792 
},
{
 "id": "dataTrial67",
"name": "el20",
"trialNumYAxis": 68,
"variable": "result",
"value": 1.053858929721 
},
{
 "id": "dataTrial68",
"name": "el20",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.5194165067151 
},
{
 "id": "dataTrial69",
"name": "el20",
"trialNumYAxis": 70,
"variable": "result",
"value": 1.309634057374 
},
{
 "id": "dataTrial70",
"name": "el20",
"trialNumYAxis": 71,
"variable": "result",
"value": 0.3225816109133 
},
{
 "id": "dataTrial71",
"name": "el20",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.3232217028123 
},
{
 "id": "dataTrial72",
"name": "el20",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.1044648664819 
},
{
 "id": "dataTrial73",
"name": "el20",
"trialNumYAxis": 74,
"variable": "result",
"value": 2.132500017772 
},
{
 "id": "dataTrial74",
"name": "el20",
"trialNumYAxis": 75,
"variable": "result",
"value": 1.598160275056 
},
{
 "id": "dataTrial75",
"name": "el20",
"trialNumYAxis": 76,
"variable": "result",
"value": 2.064838850446 
},
{
 "id": "dataTrial76",
"name": "el20",
"trialNumYAxis": 77,
"variable": "result",
"value": 5.598120509484 
},
{
 "id": "dataTrial77",
"name": "el20",
"trialNumYAxis": 78,
"variable": "result",
"value": 3.622554033695 
},
{
 "id": "dataTrial78",
"name": "el20",
"trialNumYAxis": 79,
"variable": "result",
"value": 1.088817482132 
},
{
 "id": "dataTrial79",
"name": "el20",
"trialNumYAxis": 80,
"variable": "result",
"value": 3.908855258232 
},
{
 "id": "dataTrial80",
"name": "el20",
"trialNumYAxis": 81,
"variable": "result",
"value": 1.708359103841 
},
{
 "id": "dataTrial81",
"name": "el20",
"trialNumYAxis": 82,
"variable": "result",
"value": 0.8869606515506 
},
{
 "id": "dataTrial82",
"name": "el20",
"trialNumYAxis": 83,
"variable": "result",
"value": 2.597293038969 
},
{
 "id": "dataTrial83",
"name": "el20",
"trialNumYAxis": 84,
"variable": "result",
"value": 1.313650954627 
},
{
 "id": "dataTrial84",
"name": "el20",
"trialNumYAxis": 85,
"variable": "result",
"value": 4.676421939004 
},
{
 "id": "dataTrial0",
"name": "ss28",
"trialNumYAxis": 0,
"variable": "result",
"value":  1.46321532588 
},
{
 "id": "dataTrial1",
"name": "ss28",
"trialNumYAxis": 2,
"variable": "result",
"value": 0.3941286160489 
},
{
 "id": "dataTrial2",
"name": "ss28",
"trialNumYAxis": 3,
"variable": "result",
"value": 1.050032053403 
},
{
 "id": "dataTrial3",
"name": "ss28",
"trialNumYAxis": 4,
"variable": "result",
"value": 0.5342840324485 
},
{
 "id": "dataTrial4",
"name": "ss28",
"trialNumYAxis": 5,
"variable": "result",
"value": 2.444285743444 
},
{
 "id": "dataTrial5",
"name": "ss28",
"trialNumYAxis": 6,
"variable": "result",
"value": 1.732042860044 
},
{
 "id": "dataTrial6",
"name": "ss28",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.1836517655045 
},
{
 "id": "dataTrial7",
"name": "ss28",
"trialNumYAxis": 8,
"variable": "result",
"value": 7.196929079472 
},
{
 "id": "dataTrial8",
"name": "ss28",
"trialNumYAxis": 9,
"variable": "result",
"value": 1.000304172641 
},
{
 "id": "dataTrial9",
"name": "ss28",
"trialNumYAxis": 10,
"variable": "result",
"value": 8.168831979776 
},
{
 "id": "dataTrial10",
"name": "ss28",
"trialNumYAxis": 11,
"variable": "result",
"value": 1.553968001867 
},
{
 "id": "dataTrial11",
"name": "ss28",
"trialNumYAxis": 12,
"variable": "result",
"value": 5.180318396508 
},
{
 "id": "dataTrial12",
"name": "ss28",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.366419817142 
},
{
 "id": "dataTrial13",
"name": "ss28",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.4236326504723 
},
{
 "id": "dataTrial14",
"name": "ss28",
"trialNumYAxis": 15,
"variable": "result",
"value": 4.056864726266 
},
{
 "id": "dataTrial15",
"name": "ss28",
"trialNumYAxis": 16,
"variable": "result",
"value": 0.5788864742945 
},
{
 "id": "dataTrial16",
"name": "ss28",
"trialNumYAxis": 17,
"variable": "result",
"value": 2.322115182154 
},
{
 "id": "dataTrial17",
"name": "ss28",
"trialNumYAxis": 18,
"variable": "result",
"value": 3.641217568909 
},
{
 "id": "dataTrial18",
"name": "ss28",
"trialNumYAxis": 19,
"variable": "result",
"value": 0.707009139149 
},
{
 "id": "dataTrial19",
"name": "ss28",
"trialNumYAxis": 20,
"variable": "result",
"value": 0.982429401856 
},
{
 "id": "dataTrial20",
"name": "ss28",
"trialNumYAxis": 21,
"variable": "result",
"value": 5.226503900913 
},
{
 "id": "dataTrial21",
"name": "ss28",
"trialNumYAxis": 22,
"variable": "result",
"value": 1.707477470468 
},
{
 "id": "dataTrial22",
"name": "ss28",
"trialNumYAxis": 23,
"variable": "result",
"value": 7.348219725518 
},
{
 "id": "dataTrial23",
"name": "ss28",
"trialNumYAxis": 24,
"variable": "result",
"value": 1.067926467336 
},
{
 "id": "dataTrial24",
"name": "ss28",
"trialNumYAxis": 25,
"variable": "result",
"value": 2.633709938263 
},
{
 "id": "dataTrial25",
"name": "ss28",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.644885272396 
},
{
 "id": "dataTrial26",
"name": "ss28",
"trialNumYAxis": 27,
"variable": "result",
"value": 0.5547066162349 
},
{
 "id": "dataTrial27",
"name": "ss28",
"trialNumYAxis": 28,
"variable": "result",
"value": 5.533098370098 
},
{
 "id": "dataTrial28",
"name": "ss28",
"trialNumYAxis": 29,
"variable": "result",
"value":  4.37907844025 
},
{
 "id": "dataTrial29",
"name": "ss28",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.5252928898395 
},
{
 "id": "dataTrial30",
"name": "ss28",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.4806779458044 
},
{
 "id": "dataTrial31",
"name": "ss28",
"trialNumYAxis": 32,
"variable": "result",
"value": 1.974809638373 
},
{
 "id": "dataTrial32",
"name": "ss28",
"trialNumYAxis": 33,
"variable": "result",
"value": 8.711649190196 
},
{
 "id": "dataTrial33",
"name": "ss28",
"trialNumYAxis": 34,
"variable": "result",
"value": 6.296833812479 
},
{
 "id": "dataTrial34",
"name": "ss28",
"trialNumYAxis": 35,
"variable": "result",
"value": 8.504817773021 
},
{
 "id": "dataTrial35",
"name": "ss28",
"trialNumYAxis": 36,
"variable": "result",
"value": 2.281035245345 
},
{
 "id": "dataTrial36",
"name": "ss28",
"trialNumYAxis": 37,
"variable": "result",
"value": 5.412098663762 
},
{
 "id": "dataTrial37",
"name": "ss28",
"trialNumYAxis": 38,
"variable": "result",
"value": 2.469112182682 
},
{
 "id": "dataTrial38",
"name": "ss28",
"trialNumYAxis": 39,
"variable": "result",
"value": 0.2279792887242 
},
{
 "id": "dataTrial39",
"name": "ss28",
"trialNumYAxis": 40,
"variable": "result",
"value": 5.324866691552 
},
{
 "id": "dataTrial40",
"name": "ss28",
"trialNumYAxis": 41,
"variable": "result",
"value": 2.285286689327 
},
{
 "id": "dataTrial41",
"name": "ss28",
"trialNumYAxis": 42,
"variable": "result",
"value":  1.71443412631 
},
{
 "id": "dataTrial42",
"name": "ss28",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.1691444732743 
},
{
 "id": "dataTrial43",
"name": "ss28",
"trialNumYAxis": 44,
"variable": "result",
"value": 1.031832185256 
},
{
 "id": "dataTrial44",
"name": "ss28",
"trialNumYAxis": 45,
"variable": "result",
"value": 3.903329666708 
},
{
 "id": "dataTrial45",
"name": "ss28",
"trialNumYAxis": 46,
"variable": "result",
"value": 2.666143726193 
},
{
 "id": "dataTrial46",
"name": "ss28",
"trialNumYAxis": 47,
"variable": "result",
"value": 3.542943824216 
},
{
 "id": "dataTrial47",
"name": "ss28",
"trialNumYAxis": 48,
"variable": "result",
"value": 0.7084312986106 
},
{
 "id": "dataTrial48",
"name": "ss28",
"trialNumYAxis": 49,
"variable": "result",
"value": 6.859280442038 
},
{
 "id": "dataTrial49",
"name": "ss28",
"trialNumYAxis": 50,
"variable": "result",
"value": 1.111171617822 
},
{
 "id": "dataTrial50",
"name": "ss28",
"trialNumYAxis": 51,
"variable": "result",
"value":  1.94615343723 
},
{
 "id": "dataTrial51",
"name": "ss28",
"trialNumYAxis": 52,
"variable": "result",
"value": 2.833188211449 
},
{
 "id": "dataTrial52",
"name": "ss28",
"trialNumYAxis": 53,
"variable": "result",
"value": 2.110551571296 
},
{
 "id": "dataTrial53",
"name": "ss28",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.6171608432858 
},
{
 "id": "dataTrial54",
"name": "ss28",
"trialNumYAxis": 55,
"variable": "result",
"value": 4.868857570597 
},
{
 "id": "dataTrial55",
"name": "ss28",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.1885580372394 
},
{
 "id": "dataTrial56",
"name": "ss28",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.730301655817 
},
{
 "id": "dataTrial57",
"name": "ss28",
"trialNumYAxis": 58,
"variable": "result",
"value": 6.213665425043 
},
{
 "id": "dataTrial58",
"name": "ss28",
"trialNumYAxis": 59,
"variable": "result",
"value": 2.969295236252 
},
{
 "id": "dataTrial59",
"name": "ss28",
"trialNumYAxis": 60,
"variable": "result",
"value": 2.571571970868 
},
{
 "id": "dataTrial60",
"name": "ss28",
"trialNumYAxis": 61,
"variable": "result",
"value": 1.777194623342 
},
{
 "id": "dataTrial61",
"name": "ss28",
"trialNumYAxis": 62,
"variable": "result",
"value": 6.109266349791 
},
{
 "id": "dataTrial62",
"name": "ss28",
"trialNumYAxis": 63,
"variable": "result",
"value": 0.6522555198933 
},
{
 "id": "dataTrial63",
"name": "ss28",
"trialNumYAxis": 64,
"variable": "result",
"value": 5.098407622597 
},
{
 "id": "dataTrial64",
"name": "ss28",
"trialNumYAxis": 65,
"variable": "result",
"value": 1.047116014232 
},
{
 "id": "dataTrial65",
"name": "ss28",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.7824394791842 
},
{
 "id": "dataTrial66",
"name": "ss28",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.022735631884 
},
{
 "id": "dataTrial67",
"name": "ss28",
"trialNumYAxis": 68,
"variable": "result",
"value": 1.671969943957 
},
{
 "id": "dataTrial68",
"name": "ss28",
"trialNumYAxis": 69,
"variable": "result",
"value": 2.596919786649 
},
{
 "id": "dataTrial69",
"name": "ss28",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.01810565006305 
},
{
 "id": "dataTrial70",
"name": "ss28",
"trialNumYAxis": 71,
"variable": "result",
"value": 0.1324674472839 
},
{
 "id": "dataTrial71",
"name": "ss28",
"trialNumYAxis": 72,
"variable": "result",
"value": 1.865444574213 
},
{
 "id": "dataTrial72",
"name": "ss28",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.806450463273 
},
{
 "id": "dataTrial73",
"name": "ss28",
"trialNumYAxis": 74,
"variable": "result",
"value": 0.2481386995362 
},
{
 "id": "dataTrial74",
"name": "ss28",
"trialNumYAxis": 75,
"variable": "result",
"value": 1.712790893485 
},
{
 "id": "dataTrial75",
"name": "ss28",
"trialNumYAxis": 76,
"variable": "result",
"value": 0.9445854488053 
},
{
 "id": "dataTrial76",
"name": "ss28",
"trialNumYAxis": 77,
"variable": "result",
"value": 5.053541628594 
},
{
 "id": "dataTrial77",
"name": "ss28",
"trialNumYAxis": 78,
"variable": "result",
"value": 5.494786251198 
},
{
 "id": "dataTrial78",
"name": "ss28",
"trialNumYAxis": 79,
"variable": "result",
"value": 0.08051084227669 
},
{
 "id": "dataTrial79",
"name": "ss28",
"trialNumYAxis": 80,
"variable": "result",
"value": 3.679889994231 
},
{
 "id": "dataTrial80",
"name": "ss28",
"trialNumYAxis": 81,
"variable": "result",
"value": 5.029993925721 
},
{
 "id": "dataTrial81",
"name": "ss28",
"trialNumYAxis": 82,
"variable": "result",
"value": 7.383294259724 
},
{
 "id": "dataTrial82",
"name": "ss28",
"trialNumYAxis": 83,
"variable": "result",
"value": 1.609687910155 
},
{
 "id": "dataTrial83",
"name": "ss28",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.5313371208271 
},
{
 "id": "dataTrial84",
"name": "ss28",
"trialNumYAxis": 85,
"variable": "result",
"value": 2.486017609424 
},
{
 "id": "dataTrial85",
"name": "ss28",
"trialNumYAxis": 86,
"variable": "result",
"value": 2.183442761495 
},
{
 "id": "dataTrial86",
"name": "ss28",
"trialNumYAxis": 87,
"variable": "result",
"value":  3.54493564188 
},
{
 "id": "dataTrial87",
"name": "ss28",
"trialNumYAxis": 88,
"variable": "result",
"value": 5.287979283721 
},
{
 "id": "dataTrial88",
"name": "ss28",
"trialNumYAxis": 89,
"variable": "result",
"value": 1.496401170991 
},
{
 "id": "dataTrial89",
"name": "ss28",
"trialNumYAxis": 90,
"variable": "result",
"value": 2.757484163845 
},
{
 "id": "dataTrial90",
"name": "ss28",
"trialNumYAxis": 91,
"variable": "result",
"value": 52.97155103243 
},
{
 "id": "dataTrial2",
"name": "lj01",
"trialNumYAxis": 3,
"variable": "result",
"value": 5.585989392296 
},
{
 "id": "dataTrial3",
"name": "lj01",
"trialNumYAxis": 4,
"variable": "result",
"value": 5.839881721276 
},
{
 "id": "dataTrial4",
"name": "lj01",
"trialNumYAxis": 5,
"variable": "result",
"value": 2.187327627994 
},
{
 "id": "dataTrial5",
"name": "lj01",
"trialNumYAxis": 6,
"variable": "result",
"value": 5.854291742418 
},
{
 "id": "dataTrial6",
"name": "lj01",
"trialNumYAxis": 7,
"variable": "result",
"value": 1.265167151493 
},
{
 "id": "dataTrial7",
"name": "lj01",
"trialNumYAxis": 8,
"variable": "result",
"value": 0.2618324628864 
},
{
 "id": "dataTrial8",
"name": "lj01",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.08823489205776 
},
{
 "id": "dataTrial9",
"name": "lj01",
"trialNumYAxis": 10,
"variable": "result",
"value": 2.481893513876 
},
{
 "id": "dataTrial10",
"name": "lj01",
"trialNumYAxis": 11,
"variable": "result",
"value": 3.877544951491 
},
{
 "id": "dataTrial11",
"name": "lj01",
"trialNumYAxis": 12,
"variable": "result",
"value": 0.02183462720961 
},
{
 "id": "dataTrial12",
"name": "lj01",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.232231103467 
},
{
 "id": "dataTrial13",
"name": "lj01",
"trialNumYAxis": 14,
"variable": "result",
"value": 1.296192641445 
},
{
 "id": "dataTrial14",
"name": "lj01",
"trialNumYAxis": 15,
"variable": "result",
"value": 1.569798156094 
},
{
 "id": "dataTrial15",
"name": "lj01",
"trialNumYAxis": 16,
"variable": "result",
"value": 2.262402976601 
},
{
 "id": "dataTrial16",
"name": "lj01",
"trialNumYAxis": 17,
"variable": "result",
"value": 1.449593166684 
},
{
 "id": "dataTrial17",
"name": "lj01",
"trialNumYAxis": 18,
"variable": "result",
"value": 1.717829330345 
},
{
 "id": "dataTrial18",
"name": "lj01",
"trialNumYAxis": 19,
"variable": "result",
"value": 8.360512245835 
},
{
 "id": "dataTrial19",
"name": "lj01",
"trialNumYAxis": 20,
"variable": "result",
"value": 3.196982552126 
},
{
 "id": "dataTrial20",
"name": "lj01",
"trialNumYAxis": 21,
"variable": "result",
"value": 4.039699481223 
},
{
 "id": "dataTrial21",
"name": "lj01",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.2217698834856 
},
{
 "id": "dataTrial22",
"name": "lj01",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.04250656106431 
},
{
 "id": "dataTrial23",
"name": "lj01",
"trialNumYAxis": 24,
"variable": "result",
"value": 2.643313154531 
},
{
 "id": "dataTrial24",
"name": "lj01",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.8761064335907 
},
{
 "id": "dataTrial25",
"name": "lj01",
"trialNumYAxis": 26,
"variable": "result",
"value": 14.35819164528 
},
{
 "id": "dataTrial26",
"name": "lj01",
"trialNumYAxis": 27,
"variable": "result",
"value": 3.417303957188 
},
{
 "id": "dataTrial27",
"name": "lj01",
"trialNumYAxis": 28,
"variable": "result",
"value": 2.634528976784 
},
{
 "id": "dataTrial28",
"name": "lj01",
"trialNumYAxis": 29,
"variable": "result",
"value": 1.945518547728 
},
{
 "id": "dataTrial29",
"name": "lj01",
"trialNumYAxis": 30,
"variable": "result",
"value": 2.941913537761 
},
{
 "id": "dataTrial30",
"name": "lj01",
"trialNumYAxis": 31,
"variable": "result",
"value": 2.771666186224 
},
{
 "id": "dataTrial31",
"name": "lj01",
"trialNumYAxis": 32,
"variable": "result",
"value": 2.327993394786 
},
{
 "id": "dataTrial32",
"name": "lj01",
"trialNumYAxis": 33,
"variable": "result",
"value": 2.181977769092 
},
{
 "id": "dataTrial33",
"name": "lj01",
"trialNumYAxis": 34,
"variable": "result",
"value": 1.080348148424 
},
{
 "id": "dataTrial34",
"name": "lj01",
"trialNumYAxis": 35,
"variable": "result",
"value": 3.007759499758 
},
{
 "id": "dataTrial35",
"name": "lj01",
"trialNumYAxis": 36,
"variable": "result",
"value": 1.405919051422 
},
{
 "id": "dataTrial36",
"name": "lj01",
"trialNumYAxis": 37,
"variable": "result",
"value": 0.9487214286353 
},
{
 "id": "dataTrial37",
"name": "lj01",
"trialNumYAxis": 38,
"variable": "result",
"value": 1.462853443153 
},
{
 "id": "dataTrial38",
"name": "lj01",
"trialNumYAxis": 39,
"variable": "result",
"value": 3.221193322134 
},
{
 "id": "dataTrial39",
"name": "lj01",
"trialNumYAxis": 40,
"variable": "result",
"value": 5.174779820348 
},
{
 "id": "dataTrial40",
"name": "lj01",
"trialNumYAxis": 41,
"variable": "result",
"value": 3.472278070207 
},
{
 "id": "dataTrial41",
"name": "lj01",
"trialNumYAxis": 42,
"variable": "result",
"value": 1.736613834595 
},
{
 "id": "dataTrial42",
"name": "lj01",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.7923655804084 
},
{
 "id": "dataTrial43",
"name": "lj01",
"trialNumYAxis": 44,
"variable": "result",
"value": 0.4203993813236 
},
{
 "id": "dataTrial44",
"name": "lj01",
"trialNumYAxis": 45,
"variable": "result",
"value": 1.579075774699 
},
{
 "id": "dataTrial45",
"name": "lj01",
"trialNumYAxis": 46,
"variable": "result",
"value":  1.06748496141 
},
{
 "id": "dataTrial46",
"name": "lj01",
"trialNumYAxis": 47,
"variable": "result",
"value": 3.343977584237 
},
{
 "id": "dataTrial47",
"name": "lj01",
"trialNumYAxis": 48,
"variable": "result",
"value": 4.760503965761 
},
{
 "id": "dataTrial48",
"name": "lj01",
"trialNumYAxis": 49,
"variable": "result",
"value":  1.49248321726 
},
{
 "id": "dataTrial49",
"name": "lj01",
"trialNumYAxis": 50,
"variable": "result",
"value": 2.434696086121 
},
{
 "id": "dataTrial50",
"name": "lj01",
"trialNumYAxis": 51,
"variable": "result",
"value": 1.999868976853 
},
{
 "id": "dataTrial51",
"name": "lj01",
"trialNumYAxis": 52,
"variable": "result",
"value": 18.93439115389 
},
{
 "id": "dataTrial52",
"name": "lj01",
"trialNumYAxis": 53,
"variable": "result",
"value": 1.037139333642 
},
{
 "id": "dataTrial53",
"name": "lj01",
"trialNumYAxis": 54,
"variable": "result",
"value": 8.038570269538 
},
{
 "id": "dataTrial54",
"name": "lj01",
"trialNumYAxis": 55,
"variable": "result",
"value":  6.55321497689 
},
{
 "id": "dataTrial55",
"name": "lj01",
"trialNumYAxis": 56,
"variable": "result",
"value": 5.318727453607 
},
{
 "id": "dataTrial56",
"name": "lj01",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.626710740037 
},
{
 "id": "dataTrial57",
"name": "lj01",
"trialNumYAxis": 58,
"variable": "result",
"value": 0.157750768613 
},
{
 "id": "dataTrial58",
"name": "lj01",
"trialNumYAxis": 59,
"variable": "result",
"value": 4.643663930175 
},
{
 "id": "dataTrial59",
"name": "lj01",
"trialNumYAxis": 60,
"variable": "result",
"value": 0.3815490432246 
},
{
 "id": "dataTrial60",
"name": "lj01",
"trialNumYAxis": 61,
"variable": "result",
"value": 1.074703782362 
},
{
 "id": "dataTrial61",
"name": "lj01",
"trialNumYAxis": 62,
"variable": "result",
"value": 3.213919621738 
},
{
 "id": "dataTrial62",
"name": "lj01",
"trialNumYAxis": 63,
"variable": "result",
"value": 3.727193411974 
},
{
 "id": "dataTrial63",
"name": "lj01",
"trialNumYAxis": 64,
"variable": "result",
"value": 6.315748696305 
},
{
 "id": "dataTrial64",
"name": "lj01",
"trialNumYAxis": 65,
"variable": "result",
"value": 0.7441441436126 
},
{
 "id": "dataTrial65",
"name": "lj01",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.06649745310777 
},
{
 "id": "dataTrial66",
"name": "lj01",
"trialNumYAxis": 67,
"variable": "result",
"value": 4.430923080572 
},
{
 "id": "dataTrial67",
"name": "lj01",
"trialNumYAxis": 68,
"variable": "result",
"value": 0.7501920757647 
},
{
 "id": "dataTrial68",
"name": "lj01",
"trialNumYAxis": 69,
"variable": "result",
"value":  2.07016307623 
},
{
 "id": "dataTrial69",
"name": "lj01",
"trialNumYAxis": 70,
"variable": "result",
"value": 3.661792094727 
},
{
 "id": "dataTrial70",
"name": "lj01",
"trialNumYAxis": 71,
"variable": "result",
"value":  3.24045052487 
},
{
 "id": "dataTrial71",
"name": "lj01",
"trialNumYAxis": 72,
"variable": "result",
"value": 1.217868046065 
},
{
 "id": "dataTrial72",
"name": "lj01",
"trialNumYAxis": 73,
"variable": "result",
"value": 1.274442345067 
},
{
 "id": "dataTrial73",
"name": "lj01",
"trialNumYAxis": 74,
"variable": "result",
"value": 0.7261385650982 
},
{
 "id": "dataTrial74",
"name": "lj01",
"trialNumYAxis": 75,
"variable": "result",
"value": 0.7239263180476 
},
{
 "id": "dataTrial75",
"name": "lj01",
"trialNumYAxis": 76,
"variable": "result",
"value": 0.7849840392595 
},
{
 "id": "dataTrial76",
"name": "lj01",
"trialNumYAxis": 77,
"variable": "result",
"value": 1.992276050102 
},
{
 "id": "dataTrial77",
"name": "lj01",
"trialNumYAxis": 78,
"variable": "result",
"value": 2.585457845361 
},
{
 "id": "dataTrial78",
"name": "lj01",
"trialNumYAxis": 79,
"variable": "result",
"value":  1.70162256742 
},
{
 "id": "dataTrial79",
"name": "lj01",
"trialNumYAxis": 80,
"variable": "result",
"value": 1.140649655231 
},
{
 "id": "dataTrial80",
"name": "lj01",
"trialNumYAxis": 81,
"variable": "result",
"value": 1.173996827412 
},
{
 "id": "dataTrial81",
"name": "lj01",
"trialNumYAxis": 82,
"variable": "result",
"value": 1.390968354148 
},
{
 "id": "dataTrial82",
"name": "lj01",
"trialNumYAxis": 83,
"variable": "result",
"value": 3.724902412623 
},
{
 "id": "dataTrial83",
"name": "lj01",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.4642506783307 
},
{
 "id": "dataTrial84",
"name": "lj01",
"trialNumYAxis": 85,
"variable": "result",
"value": 1.554288021272 
},
{
 "id": "dataTrial85",
"name": "lj01",
"trialNumYAxis": 86,
"variable": "result",
"value": 3.251688952536 
},
{
 "id": "dataTrial86",
"name": "lj01",
"trialNumYAxis": 87,
"variable": "result",
"value":  1.22701385832 
},
{
 "id": "dataTrial87",
"name": "lj01",
"trialNumYAxis": 88,
"variable": "result",
"value": 7.268220554876 
},
{
 "id": "dataTrial88",
"name": "lj01",
"trialNumYAxis": 89,
"variable": "result",
"value": 3.588404708532 
},
{
 "id": "dataTrial89",
"name": "lj01",
"trialNumYAxis": 90,
"variable": "result",
"value": 1.990618739172 
},
{
 "id": "dataTrial90",
"name": "lj01",
"trialNumYAxis": 91,
"variable": "result",
"value": 0.6602008440249 
},
{
 "id": "dataTrial91",
"name": "lj01",
"trialNumYAxis": 92,
"variable": "result",
"value": 0.8368614825029 
},
{
 "id": "dataTrial92",
"name": "lj01",
"trialNumYAxis": 93,
"variable": "result",
"value": 0.9889764217696 
},
{
 "id": "dataTrial93",
"name": "lj01",
"trialNumYAxis": 94,
"variable": "result",
"value": 3.125004185618 
},
{
 "id": "dataTrial94",
"name": "lj01",
"trialNumYAxis": 95,
"variable": "result",
"value": 2.281121871727 
},
{
 "id": "dataTrial95",
"name": "lj01",
"trialNumYAxis": 96,
"variable": "result",
"value": 1.225906820824 
},
{
 "id": "dataTrial96",
"name": "lj01",
"trialNumYAxis": 97,
"variable": "result",
"value": 4.694260551168 
},
{
 "id": "dataTrial97",
"name": "lj01",
"trialNumYAxis": 98,
"variable": "result",
"value": 1.080773759025 
},
{
 "id": "dataTrial98",
"name": "lj01",
"trialNumYAxis": 99,
"variable": "result",
"value": 3.155593246346 
},
{
 "id": "dataTrial99",
"name": "lj01",
"trialNumYAxis": 100,
"variable": "result",
"value":  1.99731683314 
},
{
 "id": "dataTrial100",
"name": "lj01",
"trialNumYAxis": 101,
"variable": "result",
"value": 1.835963779585 
},
{
 "id": "dataTrial101",
"name": "lj01",
"trialNumYAxis": 102,
"variable": "result",
"value": 2.850518841923 
},
{
 "id": "dataTrial102",
"name": "lj01",
"trialNumYAxis": 103,
"variable": "result",
"value": 3.946704598381 
},
{
 "id": "dataTrial103",
"name": "lj01",
"trialNumYAxis": 104,
"variable": "result",
"value": 3.107987283907 
},
{
 "id": "dataTrial104",
"name": "lj01",
"trialNumYAxis": 105,
"variable": "result",
"value": 0.6981515370317 
},
{
 "id": "dataTrial105",
"name": "lj01",
"trialNumYAxis": 106,
"variable": "result",
"value": 3.750893130179 
},
{
 "id": "dataTrial106",
"name": "lj01",
"trialNumYAxis": 107,
"variable": "result",
"value": 1.986596716823 
},
{
 "id": "dataTrial107",
"name": "lj01",
"trialNumYAxis": 108,
"variable": "result",
"value": 1.081375420879 
},
{
 "id": "dataTrial108",
"name": "lj01",
"trialNumYAxis": 109,
"variable": "result",
"value": 5.531807129857 
},
{
 "id": "dataTrial109",
"name": "lj01",
"trialNumYAxis": 110,
"variable": "result",
"value": 8.589608404727 
},
{
 "id": "dataTrial110",
"name": "lj01",
"trialNumYAxis": 111,
"variable": "result",
"value": 2.741767980633 
},
{
 "id": "dataTrial111",
"name": "lj01",
"trialNumYAxis": 112,
"variable": "result",
"value": 1.082277674646 
},
{
 "id": "dataTrial112",
"name": "lj01",
"trialNumYAxis": 113,
"variable": "result",
"value":  3.25749785445 
},
{
 "id": "dataTrial113",
"name": "lj01",
"trialNumYAxis": 114,
"variable": "result",
"value": 3.485603826876 
},
{
 "id": "dataTrial114",
"name": "lj01",
"trialNumYAxis": 115,
"variable": "result",
"value": 2.621662275677 
},
{
 "id": "dataTrial115",
"name": "lj01",
"trialNumYAxis": 116,
"variable": "result",
"value": 0.1436806176485 
},
{
 "id": "dataTrial116",
"name": "lj01",
"trialNumYAxis": 117,
"variable": "result",
"value": 2.260938308351 
},
{
 "id": "dataTrial117",
"name": "lj01",
"trialNumYAxis": 118,
"variable": "result",
"value": 0.7044339556632 
},
{
 "id": "dataTrial118",
"name": "lj01",
"trialNumYAxis": 119,
"variable": "result",
"value": 0.1216642122942 
},
{
 "id": "dataTrial119",
"name": "lj01",
"trialNumYAxis": 120,
"variable": "result",
"value": 0.01062247768299 
},
{
 "id": "dataTrial120",
"name": "lj01",
"trialNumYAxis": 121,
"variable": "result",
"value": 4.512522756316 
},
{
 "id": "dataTrial121",
"name": "lj01",
"trialNumYAxis": 122,
"variable": "result",
"value": 1.938837316029 
},
{
 "id": "dataTrial122",
"name": "lj01",
"trialNumYAxis": 123,
"variable": "result",
"value": 1.520318600122 
},
{
 "id": "dataTrial123",
"name": "lj01",
"trialNumYAxis": 124,
"variable": "result",
"value": 7.575445556759 
},
{
 "id": "dataTrial124",
"name": "lj01",
"trialNumYAxis": 125,
"variable": "result",
"value": 1.531107589516 
},
{
 "id": "dataTrial125",
"name": "lj01",
"trialNumYAxis": 126,
"variable": "result",
"value": 1.349772639787 
},
{
 "id": "dataTrial126",
"name": "lj01",
"trialNumYAxis": 127,
"variable": "result",
"value": 5.420388419928 
},
{
 "id": "dataTrial127",
"name": "lj01",
"trialNumYAxis": 128,
"variable": "result",
"value": 1.496428573377 
},
{
 "id": "dataTrial128",
"name": "lj01",
"trialNumYAxis": 129,
"variable": "result",
"value": 1.286542281538 
},
{
 "id": "dataTrial129",
"name": "lj01",
"trialNumYAxis": 130,
"variable": "result",
"value": 1.341186658846 
},
{
 "id": "dataTrial130",
"name": "lj01",
"trialNumYAxis": 131,
"variable": "result",
"value": 7.699005926292 
},
{
 "id": "dataTrial131",
"name": "lj01",
"trialNumYAxis": 132,
"variable": "result",
"value": 45.80951674082 
},
{
 "id": "dataTrial132",
"name": "lj01",
"trialNumYAxis": 133,
"variable": "result",
"value": 21.71753742114 
},
{
 "id": "dataTrial0",
"name": "el17",
"trialNumYAxis": 1,
"variable": "result",
"value": 1.050781933755 
},
{
 "id": "dataTrial1",
"name": "el17",
"trialNumYAxis": 2,
"variable": "result",
"value": 3.973442095226 
},
{
 "id": "dataTrial2",
"name": "el17",
"trialNumYAxis": 3,
"variable": "result",
"value": 2.709785480309 
},
{
 "id": "dataTrial3",
"name": "el17",
"trialNumYAxis": 4,
"variable": "result",
"value": 0.09367367626622 
},
{
 "id": "dataTrial4",
"name": "el17",
"trialNumYAxis": 5,
"variable": "result",
"value": 0.1149486822217 
},
{
 "id": "dataTrial5",
"name": "el17",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.3430366291645 
},
{
 "id": "dataTrial6",
"name": "el17",
"trialNumYAxis": 7,
"variable": "result",
"value": 10.31030492676 
},
{
 "id": "dataTrial7",
"name": "el17",
"trialNumYAxis": 8,
"variable": "result",
"value": 1.809595455405 
},
{
 "id": "dataTrial8",
"name": "el17",
"trialNumYAxis": 9,
"variable": "result",
"value": 4.973390796066 
},
{
 "id": "dataTrial9",
"name": "el17",
"trialNumYAxis": 10,
"variable": "result",
"value": 1.028455548868 
},
{
 "id": "dataTrial10",
"name": "el17",
"trialNumYAxis": 11,
"variable": "result",
"value": 18.79334861639 
},
{
 "id": "dataTrial11",
"name": "el17",
"trialNumYAxis": 12,
"variable": "result",
"value": 6.875668242893 
},
{
 "id": "dataTrial12",
"name": "el17",
"trialNumYAxis": 13,
"variable": "result",
"value": 4.577144197543 
},
{
 "id": "dataTrial13",
"name": "el17",
"trialNumYAxis": 14,
"variable": "result",
"value": 2.148099098252 
},
{
 "id": "dataTrial14",
"name": "el17",
"trialNumYAxis": 15,
"variable": "result",
"value": 8.027653803138 
},
{
 "id": "dataTrial15",
"name": "el17",
"trialNumYAxis": 16,
"variable": "result",
"value":  4.01865665002 
},
{
 "id": "dataTrial16",
"name": "el17",
"trialNumYAxis": 17,
"variable": "result",
"value": 5.120892017153 
},
{
 "id": "dataTrial17",
"name": "el17",
"trialNumYAxis": 18,
"variable": "result",
"value": 3.259232270065 
},
{
 "id": "dataTrial18",
"name": "el17",
"trialNumYAxis": 19,
"variable": "result",
"value": 18.53916058348 
},
{
 "id": "dataTrial19",
"name": "el17",
"trialNumYAxis": 20,
"variable": "result",
"value": 5.400382595312 
},
{
 "id": "dataTrial20",
"name": "el17",
"trialNumYAxis": 21,
"variable": "result",
"value": 6.076142354577 
},
{
 "id": "dataTrial21",
"name": "el17",
"trialNumYAxis": 22,
"variable": "result",
"value": 9.584340606562 
},
{
 "id": "dataTrial22",
"name": "el17",
"trialNumYAxis": 23,
"variable": "result",
"value": 8.305999039394 
},
{
 "id": "dataTrial23",
"name": "el17",
"trialNumYAxis": 24,
"variable": "result",
"value": 9.583890216617 
},
{
 "id": "dataTrial24",
"name": "el17",
"trialNumYAxis": 25,
"variable": "result",
"value": 2.661650770218 
},
{
 "id": "dataTrial25",
"name": "el17",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.395646599331 
},
{
 "id": "dataTrial26",
"name": "el17",
"trialNumYAxis": 27,
"variable": "result",
"value": 2.529083461885 
},
{
 "id": "dataTrial27",
"name": "el17",
"trialNumYAxis": 28,
"variable": "result",
"value": 14.40011882018 
},
{
 "id": "dataTrial28",
"name": "el17",
"trialNumYAxis": 29,
"variable": "result",
"value": 2.437276248667 
},
{
 "id": "dataTrial29",
"name": "el17",
"trialNumYAxis": 30,
"variable": "result",
"value": 5.098789914257 
},
{
 "id": "dataTrial30",
"name": "el17",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.7807783206272 
},
{
 "id": "dataTrial31",
"name": "el17",
"trialNumYAxis": 32,
"variable": "result",
"value": 0.8921432201941 
},
{
 "id": "dataTrial32",
"name": "el17",
"trialNumYAxis": 33,
"variable": "result",
"value": 3.490362874238 
},
{
 "id": "dataTrial33",
"name": "el17",
"trialNumYAxis": 34,
"variable": "result",
"value": 1.570104482796 
},
{
 "id": "dataTrial34",
"name": "el17",
"trialNumYAxis": 35,
"variable": "result",
"value": 3.377019319508 
},
{
 "id": "dataTrial35",
"name": "el17",
"trialNumYAxis": 36,
"variable": "result",
"value": 0.7823256692153 
},
{
 "id": "dataTrial36",
"name": "el17",
"trialNumYAxis": 37,
"variable": "result",
"value": 1.864784916157 
},
{
 "id": "dataTrial37",
"name": "el17",
"trialNumYAxis": 38,
"variable": "result",
"value": 0.1704717571078 
},
{
 "id": "dataTrial38",
"name": "el17",
"trialNumYAxis": 39,
"variable": "result",
"value": 2.952213635484 
},
{
 "id": "dataTrial39",
"name": "el17",
"trialNumYAxis": 40,
"variable": "result",
"value": 4.529992985839 
},
{
 "id": "dataTrial40",
"name": "el17",
"trialNumYAxis": 41,
"variable": "result",
"value": 2.478672299742 
},
{
 "id": "dataTrial41",
"name": "el17",
"trialNumYAxis": 42,
"variable": "result",
"value": 4.719257093327 
},
{
 "id": "dataTrial42",
"name": "el17",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.7331789557218 
},
{
 "id": "dataTrial43",
"name": "el17",
"trialNumYAxis": 44,
"variable": "result",
"value": 1.406355659245 
},
{
 "id": "dataTrial44",
"name": "el17",
"trialNumYAxis": 45,
"variable": "result",
"value":  3.48115183296 
},
{
 "id": "dataTrial45",
"name": "el17",
"trialNumYAxis": 46,
"variable": "result",
"value":  1.88069959674 
},
{
 "id": "dataTrial46",
"name": "el17",
"trialNumYAxis": 47,
"variable": "result",
"value": 6.218773524522 
},
{
 "id": "dataTrial47",
"name": "el17",
"trialNumYAxis": 48,
"variable": "result",
"value": 1.697370691583 
},
{
 "id": "dataTrial48",
"name": "el17",
"trialNumYAxis": 49,
"variable": "result",
"value": 1.817699363465 
},
{
 "id": "dataTrial49",
"name": "el17",
"trialNumYAxis": 50,
"variable": "result",
"value":  4.17002940307 
},
{
 "id": "dataTrial50",
"name": "el17",
"trialNumYAxis": 51,
"variable": "result",
"value": 0.04237594937614 
},
{
 "id": "dataTrial51",
"name": "el17",
"trialNumYAxis": 52,
"variable": "result",
"value":  2.68037684316 
},
{
 "id": "dataTrial52",
"name": "el17",
"trialNumYAxis": 53,
"variable": "result",
"value": 1.557809161278 
},
{
 "id": "dataTrial53",
"name": "el17",
"trialNumYAxis": 54,
"variable": "result",
"value": 0.5882730549019 
},
{
 "id": "dataTrial54",
"name": "el17",
"trialNumYAxis": 55,
"variable": "result",
"value": 0.3828898099011 
},
{
 "id": "dataTrial55",
"name": "el17",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.7426727156193 
},
{
 "id": "dataTrial56",
"name": "el17",
"trialNumYAxis": 57,
"variable": "result",
"value": 1.896150570501 
},
{
 "id": "dataTrial57",
"name": "el17",
"trialNumYAxis": 58,
"variable": "result",
"value": 1.474516391401 
},
{
 "id": "dataTrial58",
"name": "el17",
"trialNumYAxis": 59,
"variable": "result",
"value": 3.547122114842 
},
{
 "id": "dataTrial59",
"name": "el17",
"trialNumYAxis": 60,
"variable": "result",
"value":  1.53462328717 
},
{
 "id": "dataTrial60",
"name": "el17",
"trialNumYAxis": 61,
"variable": "result",
"value": 7.862029677281 
},
{
 "id": "dataTrial61",
"name": "el17",
"trialNumYAxis": 62,
"variable": "result",
"value": 4.179501672888 
},
{
 "id": "dataTrial62",
"name": "el17",
"trialNumYAxis": 63,
"variable": "result",
"value": 1.615135197226 
},
{
 "id": "dataTrial63",
"name": "el17",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.8992033991215 
},
{
 "id": "dataTrial64",
"name": "el17",
"trialNumYAxis": 65,
"variable": "result",
"value": 3.034411034768 
},
{
 "id": "dataTrial65",
"name": "el17",
"trialNumYAxis": 66,
"variable": "result",
"value": 2.949925544779 
},
{
 "id": "dataTrial66",
"name": "el17",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.281390420762 
},
{
 "id": "dataTrial67",
"name": "el17",
"trialNumYAxis": 68,
"variable": "result",
"value": 7.660187433567 
},
{
 "id": "dataTrial68",
"name": "el17",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.6123606319343 
},
{
 "id": "dataTrial69",
"name": "el17",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.1255415249428 
},
{
 "id": "dataTrial70",
"name": "el17",
"trialNumYAxis": 71,
"variable": "result",
"value": 4.643199274019 
},
{
 "id": "dataTrial71",
"name": "el17",
"trialNumYAxis": 72,
"variable": "result",
"value": 5.672217245351 
},
{
 "id": "dataTrial72",
"name": "el17",
"trialNumYAxis": 73,
"variable": "result",
"value": 2.714040423089 
},
{
 "id": "dataTrial73",
"name": "el17",
"trialNumYAxis": 74,
"variable": "result",
"value": 1.558245187525 
},
{
 "id": "dataTrial74",
"name": "el17",
"trialNumYAxis": 75,
"variable": "result",
"value": 0.4736932996456 
},
{
 "id": "dataTrial75",
"name": "el17",
"trialNumYAxis": 76,
"variable": "result",
"value": 2.436224359887 
},
{
 "id": "dataTrial76",
"name": "el17",
"trialNumYAxis": 77,
"variable": "result",
"value": 4.342898252666 
},
{
 "id": "dataTrial77",
"name": "el17",
"trialNumYAxis": 78,
"variable": "result",
"value": 5.148324919611 
},
{
 "id": "dataTrial78",
"name": "el17",
"trialNumYAxis": 79,
"variable": "result",
"value": 8.568741560678 
},
{
 "id": "dataTrial79",
"name": "el17",
"trialNumYAxis": 80,
"variable": "result",
"value": 2.363534184894 
},
{
 "id": "dataTrial80",
"name": "el17",
"trialNumYAxis": 81,
"variable": "result",
"value":  2.60069067081 
},
{
 "id": "dataTrial81",
"name": "el17",
"trialNumYAxis": 82,
"variable": "result",
"value": 0.8609196986865 
},
{
 "id": "dataTrial82",
"name": "el17",
"trialNumYAxis": 83,
"variable": "result",
"value": 2.018426774661 
},
{
 "id": "dataTrial83",
"name": "el17",
"trialNumYAxis": 84,
"variable": "result",
"value":  1.34144878169 
},
{
 "id": "dataTrial84",
"name": "el17",
"trialNumYAxis": 85,
"variable": "result",
"value": 2.527112998176 
},
{
 "id": "dataTrial85",
"name": "el17",
"trialNumYAxis": 86,
"variable": "result",
"value": 4.931463735765 
},
{
 "id": "dataTrial86",
"name": "el17",
"trialNumYAxis": 87,
"variable": "result",
"value": 10.98656288001 
},
{
 "id": "dataTrial87",
"name": "el17",
"trialNumYAxis": 88,
"variable": "result",
"value": 3.086854758224 
},
{
 "id": "dataTrial88",
"name": "el17",
"trialNumYAxis": 89,
"variable": "result",
"value": 0.1257061859891 
},
{
 "id": "dataTrial89",
"name": "el17",
"trialNumYAxis": 90,
"variable": "result",
"value": 6.038312701025 
},
{
 "id": "dataTrial90",
"name": "el17",
"trialNumYAxis": 91,
"variable": "result",
"value": 1.302886116607 
},
{
 "id": "dataTrial91",
"name": "el17",
"trialNumYAxis": 92,
"variable": "result",
"value": 3.024143111309 
},
{
 "id": "dataTrial92",
"name": "el17",
"trialNumYAxis": 93,
"variable": "result",
"value": 6.272601975473 
},
{
 "id": "dataTrial93",
"name": "el17",
"trialNumYAxis": 94,
"variable": "result",
"value": 6.874985044195 
},
{
 "id": "dataTrial94",
"name": "el17",
"trialNumYAxis": 95,
"variable": "result",
"value": 2.566569856735 
},
{
 "id": "dataTrial95",
"name": "el17",
"trialNumYAxis": 96,
"variable": "result",
"value": 1.713750493387 
},
{
 "id": "dataTrial96",
"name": "el17",
"trialNumYAxis": 97,
"variable": "result",
"value":  12.1298203073 
},
{
 "id": "dataTrial97",
"name": "el17",
"trialNumYAxis": 98,
"variable": "result",
"value":   33.518329315 
},
{
 "id": "dataTrial98",
"name": "el17",
"trialNumYAxis": 99,
"variable": "result",
"value": 3.888991911574 
},
{
 "id": "dataTrial99",
"name": "el17",
"trialNumYAxis": 100,
"variable": "result",
"value": 4.947843265768 
},
{
 "id": "dataTrial100",
"name": "el17",
"trialNumYAxis": 101,
"variable": "result",
"value": 7.735334614589 
},
{
 "id": "dataTrial101",
"name": "el17",
"trialNumYAxis": 102,
"variable": "result",
"value": 0.9239534389772 
},
{
 "id": "dataTrial102",
"name": "el17",
"trialNumYAxis": 103,
"variable": "result",
"value": 0.7872607144255 
},
{
 "id": "dataTrial103",
"name": "el17",
"trialNumYAxis": 104,
"variable": "result",
"value": 2.522433066508 
},
{
 "id": "dataTrial104",
"name": "el17",
"trialNumYAxis": 105,
"variable": "result",
"value": 8.093438574298 
},
{
 "id": "dataTrial105",
"name": "el17",
"trialNumYAxis": 106,
"variable": "result",
"value": 2.668989770764 
},
{
 "id": "dataTrial106",
"name": "el17",
"trialNumYAxis": 107,
"variable": "result",
"value": 7.973227291884 
},
{
 "id": "dataTrial107",
"name": "el17",
"trialNumYAxis": 108,
"variable": "result",
"value": 3.717264191632 
},
{
 "id": "dataTrial108",
"name": "el17",
"trialNumYAxis": 109,
"variable": "result",
"value": 2.012071418043 
},
{
 "id": "dataTrial109",
"name": "el17",
"trialNumYAxis": 110,
"variable": "result",
"value": 3.003446034217 
},
{
 "id": "dataTrial110",
"name": "el17",
"trialNumYAxis": 111,
"variable": "result",
"value": 2.848013994383 
},
{
 "id": "dataTrial111",
"name": "el17",
"trialNumYAxis": 112,
"variable": "result",
"value": 1.831062923751 
},
{
 "id": "dataTrial112",
"name": "el17",
"trialNumYAxis": 113,
"variable": "result",
"value": 7.416299201289 
},
{
 "id": "dataTrial113",
"name": "el17",
"trialNumYAxis": 114,
"variable": "result",
"value": 0.698670249141 
},
{
 "id": "dataTrial114",
"name": "el17",
"trialNumYAxis": 115,
"variable": "result",
"value": 2.617001210789 
},
{
 "id": "dataTrial115",
"name": "el17",
"trialNumYAxis": 116,
"variable": "result",
"value": 5.312840121719 
},
{
 "id": "dataTrial116",
"name": "el17",
"trialNumYAxis": 117,
"variable": "result",
"value": 2.491425919177 
},
{
 "id": "dataTrial117",
"name": "el17",
"trialNumYAxis": 118,
"variable": "result",
"value": 1.373483310293 
},
{
 "id": "dataTrial118",
"name": "el17",
"trialNumYAxis": 119,
"variable": "result",
"value": 0.3158490139742 
},
{
 "id": "dataTrial119",
"name": "el17",
"trialNumYAxis": 120,
"variable": "result",
"value": 1.605884571235 
},
{
 "id": "dataTrial120",
"name": "el17",
"trialNumYAxis": 121,
"variable": "result",
"value": 1.405786743959 
},
{
 "id": "dataTrial121",
"name": "el17",
"trialNumYAxis": 122,
"variable": "result",
"value": 0.7124437774015 
},
{
 "id": "dataTrial122",
"name": "el17",
"trialNumYAxis": 123,
"variable": "result",
"value": 9.353628219941 
},
{
 "id": "dataTrial123",
"name": "el17",
"trialNumYAxis": 124,
"variable": "result",
"value": 2.791450745334 
},
{
 "id": "dataTrial124",
"name": "el17",
"trialNumYAxis": 125,
"variable": "result",
"value": 1.047286190517 
},
{
 "id": "dataTrial125",
"name": "el17",
"trialNumYAxis": 126,
"variable": "result",
"value": 2.055880439715 
},
{
 "id": "dataTrial126",
"name": "el17",
"trialNumYAxis": 127,
"variable": "result",
"value": 5.799804081658 
},
{
 "id": "dataTrial127",
"name": "el17",
"trialNumYAxis": 128,
"variable": "result",
"value": 3.463090230587 
},
{
 "id": "dataTrial128",
"name": "el17",
"trialNumYAxis": 129,
"variable": "result",
"value": 1.542289514878 
},
{
 "id": "dataTrial129",
"name": "el17",
"trialNumYAxis": 130,
"variable": "result",
"value": 1.354995522965 
},
{
 "id": "dataTrial130",
"name": "el17",
"trialNumYAxis": 131,
"variable": "result",
"value": 3.962647472943 
},
{
 "id": "dataTrial131",
"name": "el17",
"trialNumYAxis": 132,
"variable": "result",
"value": 7.330544789789 
},
{
 "id": "dataTrial132",
"name": "el17",
"trialNumYAxis": 133,
"variable": "result",
"value": 3.409646539302 
},
{
 "id": "dataTrial134",
"name": "el17",
"trialNumYAxis": 135,
"variable": "result",
"value": 39.68943985662 
},
{
 "id": "dataTrial4",
"name": "vv17",
"trialNumYAxis": 5,
"variable": "result",
"value": 0.8363998224769 
},
{
 "id": "dataTrial5",
"name": "vv17",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.5925620855611 
},
{
 "id": "dataTrial6",
"name": "vv17",
"trialNumYAxis": 7,
"variable": "result",
"value": 0.06742825103083 
},
{
 "id": "dataTrial7",
"name": "vv17",
"trialNumYAxis": 8,
"variable": "result",
"value": 0.4750576612216 
},
{
 "id": "dataTrial8",
"name": "vv17",
"trialNumYAxis": 9,
"variable": "result",
"value": 1.168972804882 
},
{
 "id": "dataTrial9",
"name": "vv17",
"trialNumYAxis": 10,
"variable": "result",
"value": 1.537445603253 
},
{
 "id": "dataTrial10",
"name": "vv17",
"trialNumYAxis": 11,
"variable": "result",
"value": 1.944050801435 
},
{
 "id": "dataTrial11",
"name": "vv17",
"trialNumYAxis": 12,
"variable": "result",
"value": 0.2844699933412 
},
{
 "id": "dataTrial12",
"name": "vv17",
"trialNumYAxis": 13,
"variable": "result",
"value": 0.3995123416647 
},
{
 "id": "dataTrial13",
"name": "vv17",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.4388470575342 
},
{
 "id": "dataTrial14",
"name": "vv17",
"trialNumYAxis": 15,
"variable": "result",
"value": 0.2078426624281 
},
{
 "id": "dataTrial15",
"name": "vv17",
"trialNumYAxis": 16,
"variable": "result",
"value": 2.267549044605 
},
{
 "id": "dataTrial16",
"name": "vv17",
"trialNumYAxis": 17,
"variable": "result",
"value": 1.265141398943 
},
{
 "id": "dataTrial17",
"name": "vv17",
"trialNumYAxis": 18,
"variable": "result",
"value": 0.4915209701593 
},
{
 "id": "dataTrial18",
"name": "vv17",
"trialNumYAxis": 19,
"variable": "result",
"value": 1.311424604826 
},
{
 "id": "dataTrial19",
"name": "vv17",
"trialNumYAxis": 20,
"variable": "result",
"value": 0.5809312546785 
},
{
 "id": "dataTrial20",
"name": "vv17",
"trialNumYAxis": 21,
"variable": "result",
"value": 0.496748098509 
},
{
 "id": "dataTrial21",
"name": "vv17",
"trialNumYAxis": 22,
"variable": "result",
"value": 0.6061861475789 
},
{
 "id": "dataTrial22",
"name": "vv17",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.1088669509802 
},
{
 "id": "dataTrial23",
"name": "vv17",
"trialNumYAxis": 24,
"variable": "result",
"value": 0.3222997010978 
},
{
 "id": "dataTrial24",
"name": "vv17",
"trialNumYAxis": 25,
"variable": "result",
"value": 3.126137346499 
},
{
 "id": "dataTrial25",
"name": "vv17",
"trialNumYAxis": 26,
"variable": "result",
"value": 2.005376708276 
},
{
 "id": "dataTrial26",
"name": "vv17",
"trialNumYAxis": 27,
"variable": "result",
"value": 0.1805352033573 
},
{
 "id": "dataTrial27",
"name": "vv17",
"trialNumYAxis": 28,
"variable": "result",
"value": 0.4553115989269 
},
{
 "id": "dataTrial28",
"name": "vv17",
"trialNumYAxis": 29,
"variable": "result",
"value": 0.6238722063709 
},
{
 "id": "dataTrial29",
"name": "vv17",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.3504556826372 
},
{
 "id": "dataTrial30",
"name": "vv17",
"trialNumYAxis": 31,
"variable": "result",
"value": 1.588760689185 
},
{
 "id": "dataTrial31",
"name": "vv17",
"trialNumYAxis": 32,
"variable": "result",
"value": 2.008316783839 
},
{
 "id": "dataTrial32",
"name": "vv17",
"trialNumYAxis": 33,
"variable": "result",
"value": 0.915322834944 
},
{
 "id": "dataTrial33",
"name": "vv17",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.663118453448 
},
{
 "id": "dataTrial34",
"name": "vv17",
"trialNumYAxis": 35,
"variable": "result",
"value": 2.135180401013 
},
{
 "id": "dataTrial35",
"name": "vv17",
"trialNumYAxis": 36,
"variable": "result",
"value": 1.412246181299 
},
{
 "id": "dataTrial36",
"name": "vv17",
"trialNumYAxis": 37,
"variable": "result",
"value":  1.55221576433 
},
{
 "id": "dataTrial37",
"name": "vv17",
"trialNumYAxis": 38,
"variable": "result",
"value": 1.024599118736 
},
{
 "id": "dataTrial38",
"name": "vv17",
"trialNumYAxis": 39,
"variable": "result",
"value": 2.950675595481 
},
{
 "id": "dataTrial39",
"name": "vv17",
"trialNumYAxis": 40,
"variable": "result",
"value": 0.03382568875901 
},
{
 "id": "dataTrial40",
"name": "vv17",
"trialNumYAxis": 41,
"variable": "result",
"value": 0.860946394297 
},
{
 "id": "dataTrial41",
"name": "vv17",
"trialNumYAxis": 42,
"variable": "result",
"value": 0.376727549176 
},
{
 "id": "dataTrial42",
"name": "vv17",
"trialNumYAxis": 43,
"variable": "result",
"value": 1.142937375142 
},
{
 "id": "dataTrial43",
"name": "vv17",
"trialNumYAxis": 44,
"variable": "result",
"value": 1.222892974464 
},
{
 "id": "dataTrial44",
"name": "vv17",
"trialNumYAxis": 45,
"variable": "result",
"value": 0.2448932637479 
},
{
 "id": "dataTrial45",
"name": "vv17",
"trialNumYAxis": 46,
"variable": "result",
"value": 1.536283446565 
},
{
 "id": "dataTrial46",
"name": "vv17",
"trialNumYAxis": 47,
"variable": "result",
"value": 0.7174255586623 
},
{
 "id": "dataTrial47",
"name": "vv17",
"trialNumYAxis": 48,
"variable": "result",
"value": 1.474284731144 
},
{
 "id": "dataTrial48",
"name": "vv17",
"trialNumYAxis": 49,
"variable": "result",
"value": 1.356249157351 
},
{
 "id": "dataTrial49",
"name": "vv17",
"trialNumYAxis": 50,
"variable": "result",
"value": 0.5263470927847 
},
{
 "id": "dataTrial50",
"name": "vv17",
"trialNumYAxis": 51,
"variable": "result",
"value": 1.592659064809 
},
{
 "id": "dataTrial51",
"name": "vv17",
"trialNumYAxis": 52,
"variable": "result",
"value": 0.02043850790125 
},
{
 "id": "dataTrial52",
"name": "vv17",
"trialNumYAxis": 53,
"variable": "result",
"value": 2.395874908149 
},
{
 "id": "dataTrial53",
"name": "vv17",
"trialNumYAxis": 54,
"variable": "result",
"value":  1.99882985383 
},
{
 "id": "dataTrial54",
"name": "vv17",
"trialNumYAxis": 55,
"variable": "result",
"value": 1.520792306836 
},
{
 "id": "dataTrial55",
"name": "vv17",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.2694258652199 
},
{
 "id": "dataTrial56",
"name": "vv17",
"trialNumYAxis": 57,
"variable": "result",
"value": 0.3111370170455 
},
{
 "id": "dataTrial57",
"name": "vv17",
"trialNumYAxis": 58,
"variable": "result",
"value": 0.3667060263089 
},
{
 "id": "dataTrial58",
"name": "vv17",
"trialNumYAxis": 59,
"variable": "result",
"value": 4.635704464959 
},
{
 "id": "dataTrial59",
"name": "vv17",
"trialNumYAxis": 60,
"variable": "result",
"value": 1.224130537252 
},
{
 "id": "dataTrial60",
"name": "vv17",
"trialNumYAxis": 61,
"variable": "result",
"value": 3.809001729153 
},
{
 "id": "dataTrial61",
"name": "vv17",
"trialNumYAxis": 62,
"variable": "result",
"value": 3.441444492119 
},
{
 "id": "dataTrial62",
"name": "vv17",
"trialNumYAxis": 63,
"variable": "result",
"value": 1.263809849521 
},
{
 "id": "dataTrial63",
"name": "vv17",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.596830737485 
},
{
 "id": "dataTrial64",
"name": "vv17",
"trialNumYAxis": 65,
"variable": "result",
"value": 1.801456656678 
},
{
 "id": "dataTrial65",
"name": "vv17",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.8171524362999 
},
{
 "id": "dataTrial66",
"name": "vv17",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.720341116993 
},
{
 "id": "dataTrial67",
"name": "vv17",
"trialNumYAxis": 68,
"variable": "result",
"value": 0.1202131707627 
},
{
 "id": "dataTrial68",
"name": "vv17",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.6068648473558 
},
{
 "id": "dataTrial69",
"name": "vv17",
"trialNumYAxis": 70,
"variable": "result",
"value": 1.260099777155 
},
{
 "id": "dataTrial70",
"name": "vv17",
"trialNumYAxis": 71,
"variable": "result",
"value": 7.554439588473 
},
{
 "id": "dataTrial71",
"name": "vv17",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.08795553184227 
},
{
 "id": "dataTrial72",
"name": "vv17",
"trialNumYAxis": 73,
"variable": "result",
"value": 0.1051566828141 
},
{
 "id": "dataTrial73",
"name": "vv17",
"trialNumYAxis": 74,
"variable": "result",
"value":  1.45664658995 
},
{
 "id": "dataTrial74",
"name": "vv17",
"trialNumYAxis": 75,
"variable": "result",
"value": 1.919265602361 
},
{
 "id": "dataTrial75",
"name": "vv17",
"trialNumYAxis": 76,
"variable": "result",
"value": 5.576248604406 
},
{
 "id": "dataTrial76",
"name": "vv17",
"trialNumYAxis": 77,
"variable": "result",
"value":  3.86877486298 
},
{
 "id": "dataTrial77",
"name": "vv17",
"trialNumYAxis": 78,
"variable": "result",
"value": 1.246026995765 
},
{
 "id": "dataTrial78",
"name": "vv17",
"trialNumYAxis": 79,
"variable": "result",
"value": 0.8623622478047 
},
{
 "id": "dataTrial79",
"name": "vv17",
"trialNumYAxis": 80,
"variable": "result",
"value": 0.1345941870221 
},
{
 "id": "dataTrial80",
"name": "vv17",
"trialNumYAxis": 81,
"variable": "result",
"value": 1.235426212588 
},
{
 "id": "dataTrial81",
"name": "vv17",
"trialNumYAxis": 82,
"variable": "result",
"value": 0.4087455407551 
},
{
 "id": "dataTrial82",
"name": "vv17",
"trialNumYAxis": 83,
"variable": "result",
"value": 0.6171820288426 
},
{
 "id": "dataTrial83",
"name": "vv17",
"trialNumYAxis": 84,
"variable": "result",
"value": 0.4455758726561 
},
{
 "id": "dataTrial84",
"name": "vv17",
"trialNumYAxis": 85,
"variable": "result",
"value": 1.074458516857 
},
{
 "id": "dataTrial85",
"name": "vv17",
"trialNumYAxis": 86,
"variable": "result",
"value": 3.954349569688 
},
{
 "id": "dataTrial86",
"name": "vv17",
"trialNumYAxis": 87,
"variable": "result",
"value": 2.130401996308 
},
{
 "id": "dataTrial87",
"name": "vv17",
"trialNumYAxis": 88,
"variable": "result",
"value": 0.4804243943682 
},
{
 "id": "dataTrial88",
"name": "vv17",
"trialNumYAxis": 89,
"variable": "result",
"value": 2.338194718956 
},
{
 "id": "dataTrial89",
"name": "vv17",
"trialNumYAxis": 90,
"variable": "result",
"value": 2.502845199804 
},
{
 "id": "dataTrial90",
"name": "vv17",
"trialNumYAxis": 91,
"variable": "result",
"value": 1.315683138362 
},
{
 "id": "dataTrial91",
"name": "vv17",
"trialNumYAxis": 92,
"variable": "result",
"value": 2.820437692104 
},
{
 "id": "dataTrial92",
"name": "vv17",
"trialNumYAxis": 93,
"variable": "result",
"value": 0.7407297619441 
},
{
 "id": "dataTrial93",
"name": "vv17",
"trialNumYAxis": 94,
"variable": "result",
"value": 1.189821258926 
},
{
 "id": "dataTrial94",
"name": "vv17",
"trialNumYAxis": 95,
"variable": "result",
"value": 3.599251057972 
},
{
 "id": "dataTrial95",
"name": "vv17",
"trialNumYAxis": 96,
"variable": "result",
"value": 0.8315937106608 
},
{
 "id": "dataTrial96",
"name": "vv17",
"trialNumYAxis": 97,
"variable": "result",
"value": 0.7066485610174 
},
{
 "id": "dataTrial97",
"name": "vv17",
"trialNumYAxis": 98,
"variable": "result",
"value": 4.030582601387 
},
{
 "id": "dataTrial98",
"name": "vv17",
"trialNumYAxis": 99,
"variable": "result",
"value": 0.7074890237237 
},
{
 "id": "dataTrial99",
"name": "vv17",
"trialNumYAxis": 100,
"variable": "result",
"value": 3.586488741528 
},
{
 "id": "dataTrial100",
"name": "vv17",
"trialNumYAxis": 101,
"variable": "result",
"value": 0.05194446844393 
},
{
 "id": "dataTrial101",
"name": "vv17",
"trialNumYAxis": 102,
"variable": "result",
"value": 3.064910719088 
},
{
 "id": "dataTrial102",
"name": "vv17",
"trialNumYAxis": 103,
"variable": "result",
"value": 1.525831470571 
},
{
 "id": "dataTrial103",
"name": "vv17",
"trialNumYAxis": 104,
"variable": "result",
"value": 0.08752758169223 
},
{
 "id": "dataTrial104",
"name": "vv17",
"trialNumYAxis": 105,
"variable": "result",
"value":  1.61030687027 
},
{
 "id": "dataTrial105",
"name": "vv17",
"trialNumYAxis": 106,
"variable": "result",
"value": 2.275646531848 
},
{
 "id": "dataTrial106",
"name": "vv17",
"trialNumYAxis": 107,
"variable": "result",
"value": 2.282774728471 
},
{
 "id": "dataTrial107",
"name": "vv17",
"trialNumYAxis": 108,
"variable": "result",
"value": 1.970849462702 
},
{
 "id": "dataTrial108",
"name": "vv17",
"trialNumYAxis": 109,
"variable": "result",
"value": 0.8860358835068 
},
{
 "id": "dataTrial109",
"name": "vv17",
"trialNumYAxis": 110,
"variable": "result",
"value": 2.114596555247 
},
{
 "id": "dataTrial110",
"name": "vv17",
"trialNumYAxis": 111,
"variable": "result",
"value": 1.377543310955 
},
{
 "id": "dataTrial111",
"name": "vv17",
"trialNumYAxis": 112,
"variable": "result",
"value": 5.971088131644 
},
{
 "id": "dataTrial112",
"name": "vv17",
"trialNumYAxis": 113,
"variable": "result",
"value": 0.3652470234012 
},
{
 "id": "dataTrial113",
"name": "vv17",
"trialNumYAxis": 114,
"variable": "result",
"value": 0.5432538625664 
},
{
 "id": "dataTrial114",
"name": "vv17",
"trialNumYAxis": 115,
"variable": "result",
"value": 4.875738171304 
},
{
 "id": "dataTrial115",
"name": "vv17",
"trialNumYAxis": 116,
"variable": "result",
"value": 1.538207978345 
},
{
 "id": "dataTrial116",
"name": "vv17",
"trialNumYAxis": 117,
"variable": "result",
"value": 0.2344276038056 
},
{
 "id": "dataTrial117",
"name": "vv17",
"trialNumYAxis": 118,
"variable": "result",
"value": 1.398096737823 
},
{
 "id": "dataTrial118",
"name": "vv17",
"trialNumYAxis": 119,
"variable": "result",
"value": 3.695652918779 
},
{
 "id": "dataTrial119",
"name": "vv17",
"trialNumYAxis": 120,
"variable": "result",
"value": 0.3317639099273 
},
{
 "id": "dataTrial120",
"name": "vv17",
"trialNumYAxis": 121,
"variable": "result",
"value": 0.414749676077 
},
{
 "id": "dataTrial121",
"name": "vv17",
"trialNumYAxis": 122,
"variable": "result",
"value": 1.400343126497 
},
{
 "id": "dataTrial122",
"name": "vv17",
"trialNumYAxis": 123,
"variable": "result",
"value": 0.3242318261496 
},
{
 "id": "dataTrial123",
"name": "vv17",
"trialNumYAxis": 124,
"variable": "result",
"value": 0.7470788334025 
},
{
 "id": "dataTrial124",
"name": "vv17",
"trialNumYAxis": 125,
"variable": "result",
"value": 1.335809254219 
},
{
 "id": "dataTrial125",
"name": "vv17",
"trialNumYAxis": 126,
"variable": "result",
"value": 0.4353861210671 
},
{
 "id": "dataTrial126",
"name": "vv17",
"trialNumYAxis": 127,
"variable": "result",
"value": 6.284860195673 
},
{
 "id": "dataTrial127",
"name": "vv17",
"trialNumYAxis": 128,
"variable": "result",
"value": 1.718547725712 
},
{
 "id": "dataTrial128",
"name": "vv17",
"trialNumYAxis": 129,
"variable": "result",
"value": 2.623723041948 
},
{
 "id": "dataTrial129",
"name": "vv17",
"trialNumYAxis": 130,
"variable": "result",
"value":  2.65609381906 
},
{
 "id": "dataTrial130",
"name": "vv17",
"trialNumYAxis": 131,
"variable": "result",
"value":  2.94543326052 
},
{
 "id": "dataTrial131",
"name": "vv17",
"trialNumYAxis": 132,
"variable": "result",
"value": 1.589830668209 
},
{
 "id": "dataTrial132",
"name": "vv17",
"trialNumYAxis": 133,
"variable": "result",
"value": 0.02982132411739 
},
{
 "id": "dataTrial134",
"name": "vv17",
"trialNumYAxis": 135,
"variable": "result",
"value": 57.53179978289 
},
{
 "id": "dataTrial135",
"name": "vv17",
"trialNumYAxis": 136,
"variable": "result",
"value": 47.12782012155 
},
{
 "id": "dataTrial137",
"name": "vv17",
"trialNumYAxis": 138,
"variable": "result",
"value": 31.14164766442 
},
{
 "id": "dataTrial138",
"name": "vv17",
"trialNumYAxis": 139,
"variable": "result",
"value": 6.351393554146 
},
{
 "id": "dataTrial139",
"name": "vv17",
"trialNumYAxis": 140,
"variable": "result",
"value": 0.1321758262009 
},
{
 "id": "dataTrial140",
"name": "vv17",
"trialNumYAxis": 141,
"variable": "result",
"value": 2.853423434564 
},
{
 "id": "dataTrial141",
"name": "vv17",
"trialNumYAxis": 142,
"variable": "result",
"value": 0.6285674401813 
},
{
 "id": "dataTrial142",
"name": "vv17",
"trialNumYAxis": 143,
"variable": "result",
"value": 1.357600460998 
},
{
 "id": "dataTrial143",
"name": "vv17",
"trialNumYAxis": 144,
"variable": "result",
"value": 0.1357742766272 
},
{
 "id": "dataTrial144",
"name": "vv17",
"trialNumYAxis": 145,
"variable": "result",
"value": 2.916876797735 
},
{
 "id": "dataTrial145",
"name": "vv17",
"trialNumYAxis": 146,
"variable": "result",
"value": 2.684424677706 
},
{
 "id": "dataTrial146",
"name": "vv17",
"trialNumYAxis": 147,
"variable": "result",
"value": 1.060274650137 
},
{
 "id": "dataTrial147",
"name": "vv17",
"trialNumYAxis": 148,
"variable": "result",
"value":  1.64151095539 
},
{
 "id": "dataTrial148",
"name": "vv17",
"trialNumYAxis": 149,
"variable": "result",
"value": 0.943574785812 
},
{
 "id": "dataTrial149",
"name": "vv17",
"trialNumYAxis": 150,
"variable": "result",
"value": 3.299029375369 
},
{
 "id": "dataTrial150",
"name": "vv17",
"trialNumYAxis": 151,
"variable": "result",
"value": 4.659158294962 
},
{
 "id": "dataTrial151",
"name": "vv17",
"trialNumYAxis": 152,
"variable": "result",
"value": 0.9807987725226 
},
{
 "id": "dataTrial152",
"name": "vv17",
"trialNumYAxis": 153,
"variable": "result",
"value": 1.239662519747 
},
{
 "id": "dataTrial153",
"name": "vv17",
"trialNumYAxis": 154,
"variable": "result",
"value": 3.282155000313 
},
{
 "id": "dataTrial154",
"name": "vv17",
"trialNumYAxis": 155,
"variable": "result",
"value": 0.1781246672442 
},
{
 "id": "dataTrial155",
"name": "vv17",
"trialNumYAxis": 156,
"variable": "result",
"value": 0.1087952250534 
},
{
 "id": "dataTrial156",
"name": "vv17",
"trialNumYAxis": 157,
"variable": "result",
"value": 1.313147998326 
},
{
 "id": "dataTrial157",
"name": "vv17",
"trialNumYAxis": 158,
"variable": "result",
"value": 4.173176181311 
},
{
 "id": "dataTrial158",
"name": "vv17",
"trialNumYAxis": 159,
"variable": "result",
"value": 1.758909827179 
},
{
 "id": "dataTrial159",
"name": "vv17",
"trialNumYAxis": 160,
"variable": "result",
"value": 3.458021232572 
},
{
 "id": "dataTrial160",
"name": "vv17",
"trialNumYAxis": 161,
"variable": "result",
"value": 1.900696767729 
},
{
 "id": "dataTrial161",
"name": "vv17",
"trialNumYAxis": 162,
"variable": "result",
"value": 0.5724564222388 
},
{
 "id": "dataTrial162",
"name": "vv17",
"trialNumYAxis": 163,
"variable": "result",
"value": 2.111409474144 
},
{
 "id": "dataTrial163",
"name": "vv17",
"trialNumYAxis": 164,
"variable": "result",
"value": 1.678873740394 
},
{
 "id": "dataTrial164",
"name": "vv17",
"trialNumYAxis": 165,
"variable": "result",
"value": 3.020445791743 
},
{
 "id": "dataTrial165",
"name": "vv17",
"trialNumYAxis": 166,
"variable": "result",
"value": 0.2805020622246 
},
{
 "id": "dataTrial166",
"name": "vv17",
"trialNumYAxis": 167,
"variable": "result",
"value": 1.595975620198 
},
{
 "id": "dataTrial4",
"name": "kh13",
"trialNumYAxis": 5,
"variable": "result",
"value": 0.5273271824427 
},
{
 "id": "dataTrial5",
"name": "kh13",
"trialNumYAxis": 6,
"variable": "result",
"value": 0.7213299051378 
},
{
 "id": "dataTrial6",
"name": "kh13",
"trialNumYAxis": 7,
"variable": "result",
"value": 1.315451814416 
},
{
 "id": "dataTrial7",
"name": "kh13",
"trialNumYAxis": 8,
"variable": "result",
"value": 1.465737044076 
},
{
 "id": "dataTrial8",
"name": "kh13",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.1432296072621 
},
{
 "id": "dataTrial9",
"name": "kh13",
"trialNumYAxis": 10,
"variable": "result",
"value": 0.7508455840472 
},
{
 "id": "dataTrial10",
"name": "kh13",
"trialNumYAxis": 11,
"variable": "result",
"value": 0.6165701750617 
},
{
 "id": "dataTrial11",
"name": "kh13",
"trialNumYAxis": 12,
"variable": "result",
"value": 0.3658184210946 
},
{
 "id": "dataTrial12",
"name": "kh13",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.629341121647 
},
{
 "id": "dataTrial13",
"name": "kh13",
"trialNumYAxis": 14,
"variable": "result",
"value": 0.8813759594091 
},
{
 "id": "dataTrial14",
"name": "kh13",
"trialNumYAxis": 15,
"variable": "result",
"value": 1.144627543465 
},
{
 "id": "dataTrial15",
"name": "kh13",
"trialNumYAxis": 16,
"variable": "result",
"value": 1.102579109684 
},
{
 "id": "dataTrial16",
"name": "kh13",
"trialNumYAxis": 17,
"variable": "result",
"value": 0.3095230165887 
},
{
 "id": "dataTrial17",
"name": "kh13",
"trialNumYAxis": 18,
"variable": "result",
"value": 1.844607253925 
},
{
 "id": "dataTrial18",
"name": "kh13",
"trialNumYAxis": 19,
"variable": "result",
"value": 2.225868541666 
},
{
 "id": "dataTrial19",
"name": "kh13",
"trialNumYAxis": 20,
"variable": "result",
"value": 0.1409609442671 
},
{
 "id": "dataTrial20",
"name": "kh13",
"trialNumYAxis": 21,
"variable": "result",
"value": 1.387909039653 
},
{
 "id": "dataTrial21",
"name": "kh13",
"trialNumYAxis": 22,
"variable": "result",
"value": 2.071739306508 
},
{
 "id": "dataTrial22",
"name": "kh13",
"trialNumYAxis": 23,
"variable": "result",
"value": 1.306423213704 
},
{
 "id": "dataTrial23",
"name": "kh13",
"trialNumYAxis": 24,
"variable": "result",
"value": 3.077248151262 
},
{
 "id": "dataTrial24",
"name": "kh13",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.05780336766739 
},
{
 "id": "dataTrial25",
"name": "kh13",
"trialNumYAxis": 26,
"variable": "result",
"value": 1.175675753001 
},
{
 "id": "dataTrial26",
"name": "kh13",
"trialNumYAxis": 27,
"variable": "result",
"value": 2.517928442108 
},
{
 "id": "dataTrial27",
"name": "kh13",
"trialNumYAxis": 28,
"variable": "result",
"value": 0.821402478629 
},
{
 "id": "dataTrial28",
"name": "kh13",
"trialNumYAxis": 29,
"variable": "result",
"value": 1.774759089756 
},
{
 "id": "dataTrial29",
"name": "kh13",
"trialNumYAxis": 30,
"variable": "result",
"value": 0.1517229438211 
},
{
 "id": "dataTrial30",
"name": "kh13",
"trialNumYAxis": 31,
"variable": "result",
"value": 0.1542454045011 
},
{
 "id": "dataTrial31",
"name": "kh13",
"trialNumYAxis": 32,
"variable": "result",
"value": 0.4214632933672 
},
{
 "id": "dataTrial32",
"name": "kh13",
"trialNumYAxis": 33,
"variable": "result",
"value": 2.889948073157 
},
{
 "id": "dataTrial33",
"name": "kh13",
"trialNumYAxis": 34,
"variable": "result",
"value": 0.2708506093877 
},
{
 "id": "dataTrial34",
"name": "kh13",
"trialNumYAxis": 35,
"variable": "result",
"value": 0.8840813423448 
},
{
 "id": "dataTrial35",
"name": "kh13",
"trialNumYAxis": 36,
"variable": "result",
"value": 0.8438906174677 
},
{
 "id": "dataTrial36",
"name": "kh13",
"trialNumYAxis": 37,
"variable": "result",
"value":  2.71613037949 
},
{
 "id": "dataTrial37",
"name": "kh13",
"trialNumYAxis": 38,
"variable": "result",
"value": 3.285835783457 
},
{
 "id": "dataTrial38",
"name": "kh13",
"trialNumYAxis": 39,
"variable": "result",
"value": 1.618053246097 
},
{
 "id": "dataTrial39",
"name": "kh13",
"trialNumYAxis": 40,
"variable": "result",
"value": 0.02466088047238 
},
{
 "id": "dataTrial40",
"name": "kh13",
"trialNumYAxis": 41,
"variable": "result",
"value": 4.036656826389 
},
{
 "id": "dataTrial41",
"name": "kh13",
"trialNumYAxis": 42,
"variable": "result",
"value": 2.182880361854 
},
{
 "id": "dataTrial42",
"name": "kh13",
"trialNumYAxis": 43,
"variable": "result",
"value": 0.7058861130813 
},
{
 "id": "dataTrial43",
"name": "kh13",
"trialNumYAxis": 44,
"variable": "result",
"value": 4.075811902529 
},
{
 "id": "dataTrial44",
"name": "kh13",
"trialNumYAxis": 45,
"variable": "result",
"value": 9.549787902225 
},
{
 "id": "dataTrial45",
"name": "kh13",
"trialNumYAxis": 46,
"variable": "result",
"value": 1.436481785147 
},
{
 "id": "dataTrial46",
"name": "kh13",
"trialNumYAxis": 47,
"variable": "result",
"value": 2.835967388839 
},
{
 "id": "dataTrial47",
"name": "kh13",
"trialNumYAxis": 48,
"variable": "result",
"value": 0.1764725937302 
},
{
 "id": "dataTrial48",
"name": "kh13",
"trialNumYAxis": 49,
"variable": "result",
"value": 0.2471128807189 
},
{
 "id": "dataTrial49",
"name": "kh13",
"trialNumYAxis": 50,
"variable": "result",
"value": 0.344923328046 
},
{
 "id": "dataTrial50",
"name": "kh13",
"trialNumYAxis": 51,
"variable": "result",
"value": 5.793383162417 
},
{
 "id": "dataTrial51",
"name": "kh13",
"trialNumYAxis": 52,
"variable": "result",
"value": 0.7226723981785 
},
{
 "id": "dataTrial52",
"name": "kh13",
"trialNumYAxis": 53,
"variable": "result",
"value": 3.074136373953 
},
{
 "id": "dataTrial53",
"name": "kh13",
"trialNumYAxis": 54,
"variable": "result",
"value": 3.288108624823 
},
{
 "id": "dataTrial54",
"name": "kh13",
"trialNumYAxis": 55,
"variable": "result",
"value": 0.1376922513675 
},
{
 "id": "dataTrial55",
"name": "kh13",
"trialNumYAxis": 56,
"variable": "result",
"value": 0.6355123222969 
},
{
 "id": "dataTrial56",
"name": "kh13",
"trialNumYAxis": 57,
"variable": "result",
"value": 0.7681517048326 
},
{
 "id": "dataTrial57",
"name": "kh13",
"trialNumYAxis": 58,
"variable": "result",
"value": 3.242693379045 
},
{
 "id": "dataTrial58",
"name": "kh13",
"trialNumYAxis": 59,
"variable": "result",
"value": 0.1117138430382 
},
{
 "id": "dataTrial59",
"name": "kh13",
"trialNumYAxis": 60,
"variable": "result",
"value": 0.7052212954087 
},
{
 "id": "dataTrial60",
"name": "kh13",
"trialNumYAxis": 61,
"variable": "result",
"value": 0.6020472374385 
},
{
 "id": "dataTrial61",
"name": "kh13",
"trialNumYAxis": 62,
"variable": "result",
"value": 0.6742454163913 
},
{
 "id": "dataTrial62",
"name": "kh13",
"trialNumYAxis": 63,
"variable": "result",
"value": 0.9463049357912 
},
{
 "id": "dataTrial63",
"name": "kh13",
"trialNumYAxis": 64,
"variable": "result",
"value": 0.7292267681242 
},
{
 "id": "dataTrial64",
"name": "kh13",
"trialNumYAxis": 65,
"variable": "result",
"value": 0.4678292572353 
},
{
 "id": "dataTrial65",
"name": "kh13",
"trialNumYAxis": 66,
"variable": "result",
"value": 0.9275556600667 
},
{
 "id": "dataTrial66",
"name": "kh13",
"trialNumYAxis": 67,
"variable": "result",
"value": 1.593005506256 
},
{
 "id": "dataTrial67",
"name": "kh13",
"trialNumYAxis": 68,
"variable": "result",
"value": 0.8629316480462 
},
{
 "id": "dataTrial68",
"name": "kh13",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.405687946236 
},
{
 "id": "dataTrial69",
"name": "kh13",
"trialNumYAxis": 70,
"variable": "result",
"value": 0.3089263647643 
},
{
 "id": "dataTrial70",
"name": "kh13",
"trialNumYAxis": 71,
"variable": "result",
"value": 0.1630237933291 
},
{
 "id": "dataTrial71",
"name": "kh13",
"trialNumYAxis": 72,
"variable": "result",
"value": 0.7685756539421 
},
{
 "id": "dataTrial72",
"name": "kh13",
"trialNumYAxis": 73,
"variable": "result",
"value": 2.119577593599 
},
{
 "id": "dataTrial73",
"name": "kh13",
"trialNumYAxis": 74,
"variable": "result",
"value": 1.719260727494 
},
{
 "id": "dataTrial74",
"name": "kh13",
"trialNumYAxis": 75,
"variable": "result",
"value": 1.127190168149 
},
{
 "id": "dataTrial75",
"name": "kh13",
"trialNumYAxis": 76,
"variable": "result",
"value":  1.50995015934 
},
{
 "id": "dataTrial76",
"name": "kh13",
"trialNumYAxis": 77,
"variable": "result",
"value": 1.188815256441 
},
{
 "id": "dataTrial77",
"name": "kh13",
"trialNumYAxis": 78,
"variable": "result",
"value": 3.037056870864 
},
{
 "id": "dataTrial78",
"name": "kh13",
"trialNumYAxis": 79,
"variable": "result",
"value": 0.1679527919195 
},
{
 "id": "dataTrial79",
"name": "kh13",
"trialNumYAxis": 80,
"variable": "result",
"value": 0.1451748237651 
},
{
 "id": "dataTrial80",
"name": "kh13",
"trialNumYAxis": 81,
"variable": "result",
"value": 0.6548765570556 
},
{
 "id": "dataTrial81",
"name": "kh13",
"trialNumYAxis": 82,
"variable": "result",
"value": 0.969098308376 
},
{
 "id": "dataTrial82",
"name": "kh13",
"trialNumYAxis": 83,
"variable": "result",
"value": 1.297863909053 
},
{
 "id": "dataTrial83",
"name": "kh13",
"trialNumYAxis": 84,
"variable": "result",
"value": 1.577767300878 
},
{
 "id": "dataTrial84",
"name": "kh13",
"trialNumYAxis": 85,
"variable": "result",
"value": 0.9194451771774 
},
{
 "id": "dataTrial85",
"name": "kh13",
"trialNumYAxis": 86,
"variable": "result",
"value": 0.1042693426006 
},
{
 "id": "dataTrial86",
"name": "kh13",
"trialNumYAxis": 87,
"variable": "result",
"value": 0.6497062087973 
},
{
 "id": "dataTrial87",
"name": "kh13",
"trialNumYAxis": 88,
"variable": "result",
"value": 0.3117712096534 
},
{
 "id": "dataTrial88",
"name": "kh13",
"trialNumYAxis": 89,
"variable": "result",
"value": 0.05309830295533 
},
{
 "id": "dataTrial4",
"name": "dp02",
"trialNumYAxis": 5,
"variable": "result",
"value": 8.269542280055 
},
{
 "id": "dataTrial5",
"name": "dp02",
"trialNumYAxis": 6,
"variable": "result",
"value": 2.138538976287 
},
{
 "id": "dataTrial6",
"name": "dp02",
"trialNumYAxis": 7,
"variable": "result",
"value": 2.944216408186 
},
{
 "id": "dataTrial7",
"name": "dp02",
"trialNumYAxis": 8,
"variable": "result",
"value": 3.608104292576 
},
{
 "id": "dataTrial8",
"name": "dp02",
"trialNumYAxis": 9,
"variable": "result",
"value": 0.5377593682285 
},
{
 "id": "dataTrial9",
"name": "dp02",
"trialNumYAxis": 10,
"variable": "result",
"value": 1.544577056731 
},
{
 "id": "dataTrial10",
"name": "dp02",
"trialNumYAxis": 11,
"variable": "result",
"value": 0.6003993506749 
},
{
 "id": "dataTrial11",
"name": "dp02",
"trialNumYAxis": 12,
"variable": "result",
"value": 6.634742463564 
},
{
 "id": "dataTrial12",
"name": "dp02",
"trialNumYAxis": 13,
"variable": "result",
"value": 1.910803042574 
},
{
 "id": "dataTrial13",
"name": "dp02",
"trialNumYAxis": 14,
"variable": "result",
"value": 1.014611218582 
},
{
 "id": "dataTrial14",
"name": "dp02",
"trialNumYAxis": 15,
"variable": "result",
"value": 5.142753858291 
},
{
 "id": "dataTrial15",
"name": "dp02",
"trialNumYAxis": 16,
"variable": "result",
"value": 1.747137638511 
},
{
 "id": "dataTrial16",
"name": "dp02",
"trialNumYAxis": 17,
"variable": "result",
"value": 1.931341864337 
},
{
 "id": "dataTrial17",
"name": "dp02",
"trialNumYAxis": 18,
"variable": "result",
"value": 2.433245000488 
},
{
 "id": "dataTrial18",
"name": "dp02",
"trialNumYAxis": 19,
"variable": "result",
"value": 2.355267744227 
},
{
 "id": "dataTrial19",
"name": "dp02",
"trialNumYAxis": 20,
"variable": "result",
"value": 2.675410142065 
},
{
 "id": "dataTrial20",
"name": "dp02",
"trialNumYAxis": 21,
"variable": "result",
"value": 4.603858009564 
},
{
 "id": "dataTrial21",
"name": "dp02",
"trialNumYAxis": 22,
"variable": "result",
"value": 5.056830313363 
},
{
 "id": "dataTrial22",
"name": "dp02",
"trialNumYAxis": 23,
"variable": "result",
"value": 0.244717629588 
},
{
 "id": "dataTrial23",
"name": "dp02",
"trialNumYAxis": 24,
"variable": "result",
"value": 3.842289902907 
},
{
 "id": "dataTrial24",
"name": "dp02",
"trialNumYAxis": 25,
"variable": "result",
"value": 0.8499809089156 
},
{
 "id": "dataTrial25",
"name": "dp02",
"trialNumYAxis": 26,
"variable": "result",
"value":   2.2155434515 
},
{
 "id": "dataTrial26",
"name": "dp02",
"trialNumYAxis": 27,
"variable": "result",
"value": 3.737257253349 
},
{
 "id": "dataTrial27",
"name": "dp02",
"trialNumYAxis": 28,
"variable": "result",
"value": 3.629759460195 
},
{
 "id": "dataTrial28",
"name": "dp02",
"trialNumYAxis": 29,
"variable": "result",
"value": 2.679291941396 
},
{
 "id": "dataTrial29",
"name": "dp02",
"trialNumYAxis": 30,
"variable": "result",
"value": 1.880269467291 
},
{
 "id": "dataTrial30",
"name": "dp02",
"trialNumYAxis": 31,
"variable": "result",
"value": 2.106331415561 
},
{
 "id": "dataTrial31",
"name": "dp02",
"trialNumYAxis": 32,
"variable": "result",
"value": 0.7365727067032 
},
{
 "id": "dataTrial32",
"name": "dp02",
"trialNumYAxis": 33,
"variable": "result",
"value":  5.78745776262 
},
{
 "id": "dataTrial33",
"name": "dp02",
"trialNumYAxis": 34,
"variable": "result",
"value": 2.507306871327 
},
{
 "id": "dataTrial34",
"name": "dp02",
"trialNumYAxis": 35,
"variable": "result",
"value": 3.977546506756 
},
{
 "id": "dataTrial35",
"name": "dp02",
"trialNumYAxis": 36,
"variable": "result",
"value": 11.16110712753 
},
{
 "id": "dataTrial36",
"name": "dp02",
"trialNumYAxis": 37,
"variable": "result",
"value": 0.3081676541782 
},
{
 "id": "dataTrial37",
"name": "dp02",
"trialNumYAxis": 38,
"variable": "result",
"value": 3.672617823569 
},
{
 "id": "dataTrial38",
"name": "dp02",
"trialNumYAxis": 39,
"variable": "result",
"value": 5.955828851006 
},
{
 "id": "dataTrial39",
"name": "dp02",
"trialNumYAxis": 40,
"variable": "result",
"value": 2.429846573371 
},
{
 "id": "dataTrial40",
"name": "dp02",
"trialNumYAxis": 41,
"variable": "result",
"value":   9.1480012858 
},
{
 "id": "dataTrial41",
"name": "dp02",
"trialNumYAxis": 42,
"variable": "result",
"value": 1.319801917409 
},
{
 "id": "dataTrial42",
"name": "dp02",
"trialNumYAxis": 43,
"variable": "result",
"value": 1.339351101339 
},
{
 "id": "dataTrial43",
"name": "dp02",
"trialNumYAxis": 44,
"variable": "result",
"value": 5.591892733246 
},
{
 "id": "dataTrial44",
"name": "dp02",
"trialNumYAxis": 45,
"variable": "result",
"value": 7.506875550997 
},
{
 "id": "dataTrial45",
"name": "dp02",
"trialNumYAxis": 46,
"variable": "result",
"value": 7.380082384143 
},
{
 "id": "dataTrial46",
"name": "dp02",
"trialNumYAxis": 47,
"variable": "result",
"value": 3.912601648465 
},
{
 "id": "dataTrial47",
"name": "dp02",
"trialNumYAxis": 48,
"variable": "result",
"value": 2.824398078796 
},
{
 "id": "dataTrial48",
"name": "dp02",
"trialNumYAxis": 49,
"variable": "result",
"value":  20.3856350925 
},
{
 "id": "dataTrial49",
"name": "dp02",
"trialNumYAxis": 50,
"variable": "result",
"value": 2.041108886618 
},
{
 "id": "dataTrial50",
"name": "dp02",
"trialNumYAxis": 51,
"variable": "result",
"value": 0.6734373543128 
},
{
 "id": "dataTrial51",
"name": "dp02",
"trialNumYAxis": 52,
"variable": "result",
"value": 4.281522385381 
},
{
 "id": "dataTrial52",
"name": "dp02",
"trialNumYAxis": 53,
"variable": "result",
"value": 8.835772242133 
},
{
 "id": "dataTrial53",
"name": "dp02",
"trialNumYAxis": 54,
"variable": "result",
"value": 3.735799462269 
},
{
 "id": "dataTrial54",
"name": "dp02",
"trialNumYAxis": 55,
"variable": "result",
"value": 4.620369091961 
},
{
 "id": "dataTrial55",
"name": "dp02",
"trialNumYAxis": 56,
"variable": "result",
"value":  2.46832248729 
},
{
 "id": "dataTrial56",
"name": "dp02",
"trialNumYAxis": 57,
"variable": "result",
"value": 2.249848747927 
},
{
 "id": "dataTrial57",
"name": "dp02",
"trialNumYAxis": 58,
"variable": "result",
"value": 0.001922666237547 
},
{
 "id": "dataTrial58",
"name": "dp02",
"trialNumYAxis": 59,
"variable": "result",
"value": 2.700622115802 
},
{
 "id": "dataTrial59",
"name": "dp02",
"trialNumYAxis": 60,
"variable": "result",
"value": 5.620005829219 
},
{
 "id": "dataTrial60",
"name": "dp02",
"trialNumYAxis": 61,
"variable": "result",
"value": 5.146644974482 
},
{
 "id": "dataTrial61",
"name": "dp02",
"trialNumYAxis": 62,
"variable": "result",
"value": 2.746540604015 
},
{
 "id": "dataTrial62",
"name": "dp02",
"trialNumYAxis": 63,
"variable": "result",
"value": 7.126634967133 
},
{
 "id": "dataTrial63",
"name": "dp02",
"trialNumYAxis": 64,
"variable": "result",
"value": 2.713682944012 
},
{
 "id": "dataTrial64",
"name": "dp02",
"trialNumYAxis": 65,
"variable": "result",
"value": 3.542279079666 
},
{
 "id": "dataTrial65",
"name": "dp02",
"trialNumYAxis": 66,
"variable": "result",
"value":  4.34234331443 
},
{
 "id": "dataTrial66",
"name": "dp02",
"trialNumYAxis": 67,
"variable": "result",
"value": 31.50570351921 
},
{
 "id": "dataTrial67",
"name": "dp02",
"trialNumYAxis": 68,
"variable": "result",
"value": 5.413624996703 
},
{
 "id": "dataTrial68",
"name": "dp02",
"trialNumYAxis": 69,
"variable": "result",
"value": 0.1850283674193 
},
{
 "id": "dataTrial69",
"name": "dp02",
"trialNumYAxis": 70,
"variable": "result",
"value":  12.8378727265 
},
{
 "id": "dataTrial70",
"name": "dp02",
"trialNumYAxis": 71,
"variable": "result",
"value": 3.144163359444 
},
{
 "id": "dataTrial71",
"name": "dp02",
"trialNumYAxis": 72,
"variable": "result",
"value": 2.802132592502 
},
{
 "id": "dataTrial72",
"name": "dp02",
"trialNumYAxis": 73,
"variable": "result",
"value": 6.957655353274 
},
{
 "id": "dataTrial73",
"name": "dp02",
"trialNumYAxis": 74,
"variable": "result",
"value": 2.984906871936 
},
{
 "id": "dataTrial74",
"name": "dp02",
"trialNumYAxis": 75,
"variable": "result",
"value": 6.157190848332 
},
{
 "id": "dataTrial75",
"name": "dp02",
"trialNumYAxis": 76,
"variable": "result",
"value": 3.869959976962 
},
{
 "id": "dataTrial76",
"name": "dp02",
"trialNumYAxis": 77,
"variable": "result",
"value": 3.386969571358 
},
{
 "id": "dataTrial77",
"name": "dp02",
"trialNumYAxis": 78,
"variable": "result",
"value": 7.436733961715 
},
{
 "id": "dataTrial78",
"name": "dp02",
"trialNumYAxis": 79,
"variable": "result",
"value": 1.726610322498 
},
{
 "id": "dataTrial79",
"name": "dp02",
"trialNumYAxis": 80,
"variable": "result",
"value": 49.65050846238 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>

# Session info


```r
devtools::session_info()
```

```
Session info --------------------------------------------------------------
```

```
 setting  value                       
 version  R version 3.2.2 (2015-08-14)
 system   x86_64, darwin13.4.0        
 ui       X11                         
 language (EN)                        
 collate  C                           
 tz       Europe/Paris                
 date     2015-11-28                  
```

```
Packages ------------------------------------------------------------------
```

```
 package      * version date       source                           
 DBI            0.3.1   2014-09-24 CRAN (R 3.2.0)                   
 MASS           7.3-43  2015-07-16 CRAN (R 3.2.2)                   
 R6             2.1.1   2015-08-19 CRAN (R 3.2.0)                   
 RColorBrewer * 1.1-2   2014-12-07 CRAN (R 3.2.0)                   
 RJSONIO        1.3-0   2014-07-28 CRAN (R 3.2.0)                   
 Rcpp           0.12.1  2015-09-10 CRAN (R 3.2.0)                   
 assertthat     0.1     2013-12-06 CRAN (R 3.2.0)                   
 colorspace     1.2-6   2015-03-11 CRAN (R 3.2.0)                   
 devtools     * 1.9.1   2015-09-11 CRAN (R 3.2.0)                   
 digest         0.6.8   2014-12-31 CRAN (R 3.2.0)                   
 dplyr        * 0.4.3   2015-09-01 CRAN (R 3.2.0)                   
 evaluate       0.8     2015-09-18 CRAN (R 3.2.0)                   
 formatR        1.2.1   2015-09-18 CRAN (R 3.2.0)                   
 ggplot2      * 1.0.1   2015-03-17 CRAN (R 3.2.0)                   
 gtable         0.1.2   2012-12-05 CRAN (R 3.2.0)                   
 jsonlite       0.9.17  2015-09-06 CRAN (R 3.2.0)                   
 kfigr        * 1.2     2015-07-15 CRAN (R 3.2.0)                   
 knitr        * 1.11    2015-08-14 CRAN (R 3.2.2)                   
 labeling       0.3     2014-08-23 CRAN (R 3.2.0)                   
 lattice        0.20-33 2015-07-14 CRAN (R 3.2.2)                   
 lazyeval       0.1.10  2015-01-02 CRAN (R 3.2.0)                   
 magrittr       1.5     2014-11-22 CRAN (R 3.2.0)                   
 memoise        0.2.1   2014-04-22 CRAN (R 3.2.0)                   
 munsell        0.4.2   2013-07-11 CRAN (R 3.2.0)                   
 pander       * 0.5.2   2015-05-18 CRAN (R 3.2.0)                   
 plyr           1.8.3   2015-06-12 CRAN (R 3.2.0)                   
 proto          0.3-10  2012-12-22 CRAN (R 3.2.0)                   
 rCharts      * 0.4.5   2015-10-05 Github (ramnathv/rCharts@389e214)
 reshape2     * 1.4.1   2014-12-06 CRAN (R 3.2.0)                   
 rjson        * 0.2.15  2014-11-03 CRAN (R 3.2.0)                   
 scales       * 0.3.0   2015-08-25 CRAN (R 3.2.0)                   
 stringi        0.5-5   2015-06-29 CRAN (R 3.2.0)                   
 stringr        1.0.0   2015-04-30 CRAN (R 3.2.0)                   
 whisker        0.3-2   2013-04-28 CRAN (R 3.2.0)                   
 yaml           2.1.13  2014-06-12 CRAN (R 3.2.0)                   
 zoo          * 1.7-12  2015-03-16 CRAN (R 3.2.0)                   
```
  
