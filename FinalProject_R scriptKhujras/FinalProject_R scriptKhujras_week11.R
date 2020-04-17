### project Plan_ Script from AP 4

### 1. Were there significant differences between the sample of Solar Radiation on inner surface before installation and population?

#One Case t-test-----
##Assuming mean of population is 28650
#assumptions
##Normality
shapiro.test(AmanFinal$SRinnerBF)
#t-test
t.test(AmanFinal$SRinnerBF, mu=28648)


# Checking level of measurement (SchoolSES)---
is.ordered(AmanFinal$BldgHeight)
# Correcting measurement and reordering (BldgHeight)---
AmanFinal$BldgHeight = factor(AmanFinal$BldgHeight, levels = c('Lowrise', 'Midrise', 'Highrise'), ordered = TRUE)
AmanFinal$BldgHeight


### 2a. Were there significant differences between the solar radiation on outer surface before and after installing photovoltaics?

#Dependent Samples t-test---
#Assumptions
##Normality
a_difexternal = (AmanFinal$SRouterBF - AmanFinal$SRouterAF)
shapiro.test(a_difexternal)
## Assumption violated!!!

#t-test
t.test(AmanFinal$SRouterBF, AmanFinal$SRouterAF, paired = TRUE)

#Effect Size
detach("package:psych", unload = TRUE)
library(effsize)
cohen.d(AmanFinal$SRouterBF, AmanFinal$SRouterAF, paired = TRUE)

#Descriptives
mean(AmanFinal$SRouterBF)
sd(AmanFinal$SRouterBF)
mean(AmanFinal$SRouterAF)
sd(AmanFinal$SRouterAF)
#OR
library(psych)
describe(AmanFinal)




### 2b. Were there significant differences between the building location solar radiation on the inner surfaces after placing photovoltaics?

#Independent Samples t-test---
#Assumptions
##Normality
shapiro.test(AmanFinal$SRinnerAF) # Assumption violated!!!

##Visualizing Aman_reading---
library(ggplot2)

SRinnerAF_hist = ggplot(AmanFinal, aes(SRinnerAF)) +
  theme(legend.position = "none") +
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + 
  labs(x = "solar radiation on the inner surfaces after placing photovoltaics", y = "Density") + 
  stat_function(fun = dnorm, args = list(mean = mean(AmanFinal$SRinnerAF, na.rm = TRUE), sd = sd(AmanFinal$SRinnerAF, na.rm = TRUE)), colour = "purple", size = 1)
SRinnerAF_hist

##HOV_ homogenity of varience (levene's test)
library(car)
leveneTest(AmanFinal$SRinnerAF, AmanFinal$BldgLoc)

#Visualizing HOV & the mean differnece
b_lineindepttest = ggplot(AmanFinal,  aes(BldgLoc, SRinnerAF))
b_lineindepttest + stat_summary(fun.y = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Building Location", y = "Radiation on inner surfaces after installation") + 
  stat_summary(fun.y = mean, geom = "line", aes(group=1),colour = "Red", linetype = "dashed")

#t-test
t.test(AmanFinal$SRinnerAF ~ AmanFinal$BldgLoc, var.equal = TRUE)

#Effect Size
detach("package:psych", unload = TRUE)
library(effsize)
cohen.d(AmanFinal$SRinnerAF, AmanFinal$BldgLoc)

#Descritpives
library(psych)
describeBy(AmanFinal$SRinnerAF, group = AmanFinal$BldgLoc)









## Just to try visualization with different types of data with AmanFinal1 Dataset-

#Visualizing HOV & the mean differnece--------------Building Height & solar radiation on the inner surfaces after placing photovoltaics
b_lineindepttest1 = ggplot(AmanFinal,  aes(BldgHeight, SRinnerAF))
b_lineindepttest1 + stat_summary(fun.y = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Building Location", y = "Radiation on inner surfaces after installation") + 
  stat_summary(fun.y = mean, geom = "line", aes(group=1),colour = "Red", linetype = "dashed")

#Visualizing HOV & the mean differnece--------------Building Type & solar radiation on the inner surfaces after placing photovoltaics
b_lineindepttest3 = ggplot(AmanFinal,  aes(BldgType, SRinnerAF))
b_lineindepttest3 + stat_summary(fun.y = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Building Type", y = "Radiation on inner surfaces after installation") + 
  stat_summary(fun.y = mean, geom = "line", aes(group=1),colour = "Red", linetype = "dashed")

#Visualizing HOV & the mean differnece--------------Building No & solar radiation on the inner surfaces after placing photovoltaics
b_lineindepttest2 = ggplot(AmanFinal1,  aes(BldgNo, SRinnerAF))
b_lineindepttest2 + stat_summary(fun.y = mean, geom = "point") + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = 0.2) + 
  labs(x = "Building Number", y = "Radiation on inner surfaces after installation") + 
  stat_summary(fun.y = mean, geom = "line", aes(group=1),colour = "Red", linetype = "dashed")



## 3d Scatterplot for Solar Radiation outer before, Solar Radiation outer after and inner before

library(scatterplot3d)
library(rgl)
# Add a new column with color
mycolors = c('royalblue1', 'darkcyan', 'oldlace')
mycolors
AmanFinal$color = mycolors[as.numeric(AmanFinal$BldgHeight)]
AmanFinal$color

# Plot
par(mar=c(0,0,0,0))
plot3d( 
  x=AmanFinal$SRouterBF, y=AmanFinal$SRouterAF, z=AmanFinal$SRinnerBF, 
  col = AmanFinal$color, 
  type = 's', 
  radius = .1,
  xlab="Solar Radiation outer before", ylab="Solar Radiation outer after", zlab="Solar Radiation inner after")

writeWebGL( filename="HtmlWidget/3dscatter.html" ,  width=600, height=600)



