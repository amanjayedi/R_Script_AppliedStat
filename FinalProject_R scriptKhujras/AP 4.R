# Checking level of measurement (SchoolSES)---
is.ordered(Aman_reading$SchoolSES)
# Correcting measurement and reordering (SchoolSES)---
Aman_reading$SchoolSES = factor(Aman_reading$SchoolSES, levels = c('Low', 'Medium', 'High'), ordered = TRUE)
Aman_reading$SchoolSES


###a. Were there significant differences between the starting readings scores and end reading scores?

#Dependent Samples t-test---
#Assumptions
##Normality
a_difexternal = (Aman_reading$ReadEnd - Aman_reading$ReadStart)
shapiro.test(a_difexternal)
## Assumption met!

#t-test
t.test(Aman_reading$ReadEnd, Aman_reading$ReadStart, paired = TRUE)

#Effect Size
detach("package:psych", unload = TRUE)
library(effsize)
cohen.d(Aman_reading$ReadEnd, Aman_reading$ReadStart, paired = TRUE)

#Descriptives
mean(Aman_reading$ReadStart)
sd(Aman_reading$ReadStart)
mean(Aman_reading$ReadEnd)
sd(Aman_reading$ReadEnd)
#OR
library(psych)
describe(Aman_reading)




### b. Were there significant differences between the intervention groups on end reading scores?

#Independent Samples t-test---
#Assumptions
##Normality
shapiro.test(Aman_reading$ReadEnd) # Assumption violated!!!

##Visualizing Aman_reading---
library(ggplot2)

ReadEnd_hist = ggplot(Aman_reading, aes(ReadEnd)) +
  theme(legend.position = "none") +
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + 
  labs(x = "Reading level after intervention", y = "Density") + 
  stat_function(fun = dnorm, args = list(mean = mean(Aman_reading$ReadEnd, na.rm = TRUE), sd = sd(Aman_reading$ReadEnd, na.rm = TRUE)), colour = "purple", size = 1)
ReadEnd_hist

##HOV_ homogenity of varience (levene's test)
library(car)
leveneTest(Aman_reading$ReadEnd, Aman_reading$Intervention)

#Visualizing HOV & the mean differnece
b_lineindepttest = ggplot(Aman_reading,  aes(Intervention, ReadEnd))
b_lineindepttest + stat_summary(fun.y = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Intervention", y = "ReadEnd") + 
  stat_summary(fun.y = mean, geom = "line", aes(group=1),colour = "Red", linetype = "dashed")

#t-test
t.test(Aman_reading$ReadEnd ~ Aman_reading$Intervention, var.equal = TRUE)

#Effect Size
detach("package:psych", unload = TRUE)
library(effsize)
cohen.d(Aman_reading$ReadEnd, Aman_reading$Intervention)

#Descritpives
library(psych)
describeBy(Aman_reading$ReadEnd, group = Aman_reading$Intervention)


