#let's load the library and the data and take a look at it

library(faraway)
require(faraway)
data(sat)
head(sat)

#now we have to make some changes to the data to check our assumptions

by.math <- sat[order(sat$math),]
by.verbal <- sat[order(sat$verbal),]
by.salary <- sat[order(sat$salary),]
attach(sat)
out <- lm(total ~ expend + ratio + salary + takers)
summary(out)

#let's look at the hat values

hatv <- hatvalues(out)
head(hatv)
sum(hatv)
states <- row.names(sat)
halfnorm(hatv, labs=states, ylab="Leverage Values")
qqnorm(rstandard(out))
abline(0,1)
shapiro.test(rstandard(out))

#There isn’t too much of an issue with normality of the standardized residuals according to the qqnorm and shapiro test.
