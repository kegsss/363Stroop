library(tidyverse)
dtben <- read_csv("363Stroop_Data_Dec_4.csv")


###
###
###


## An example of how our data is structured
head(dtben, 10)

## A quick summary of the meaningful means and quartiles of each variable
summary(dtben)

## The total number of trials
rng <- max(dtben$Time.Length) - min(dtben$Time.Length)
rng


###
###
###


## Creating a linear regression between time and congruence
attach(dtben)
lmben <- lm( Time ~ Congruent, data = dtben)

lmben

## Summary of the linear regression including T-Tests
summary(lmben)

## Specialized T-Test
t.test(Time ~ Congruent, mu=0, alt="two.sided", conf=0.95, var.eq=F, paired=F, data = dtben)

## Analysis of Varience including F-Tests
anova(lmben)


###
###
###


## Creating a linear regression between time and each of the other variables
attach(dtben)
lmben2 <- lm( Time ~ Congruent + Trial + Colour + Response, data = dtben)

lmben2

## Summary of the linear regression including T-Tests
summary(lmben2)

## Analysis of Varience including F-Tests
anova(lmben2)

