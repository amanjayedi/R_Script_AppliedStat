### What is the mean and standard deviation for Achievement variable

# Hand calculating mean and standard deviation of Achievement variable---
# Mean Value---
Achievement = Aman_Part1$Achievment
X = sum(Achievement)
X
N = length(Achievement)
N
Xbar = X/N
Xbar

#Variance---
Dif = (Achievement-Xbar)^2
SS = sum(Dif)
S2 = SS/(N-1)
S2

#Standard deviation---
S = sqrt(S2)
S

# Crosschecking with R script--
mean(Aman_Part1$Achievment)
sd(Aman_Part1$Achievment)


# Hand calculating mean and standard deviation of Aptitude variable---
# Mean Value---
Aptitude = Aman_Part1$Aptitude
X1 = sum(Aptitude)
X1
N1 = length(Aptitude)
N1
Xbar1 = X1/N1
Xbar1

#Variance---
Dif1 = (Aptitude-Xbar1)^2
SS1 = sum(Dif1)
S21 = SS1/(N1-1)
S21

#Standard deviation---
S1 = sqrt(S21)
S1

# Crosschecking with R script--
mean(Aman_Part1$Aptitude)
sd(Aman_Part1$Aptitude)
