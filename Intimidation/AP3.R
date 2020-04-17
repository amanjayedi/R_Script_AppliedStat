
### 3a+b. Obtain Means, Medians, and Standard Deviations for the appropriate variables in your full data set.

# Checking level of measurement (Year)---
is.ordered(Aman_intimidation$Year)
# Correcting measurement and reordering (Year)---
Aman_intimidation$Year = factor(Aman_intimidation$Year, levels = c('FR', 'SO', 'JR', 'SR', 'GRAD'), ordered = TRUE)
Aman_intimidation$Year

# with base package, it is harder to generate mean values of all interval/ratio variables together. Therefore, I have used use 'tableone' package.

# Tableone Describtives---
library(tableone)
VarCont = c('Biosex', 'Major', 'Year', 'Final', 'IntimBF', 'IntimAF')
DescCont = CreateContTable(VarCont, data = Aman_intimidation)
print(DescCont)

DescAll = CreateTableOne(data = Aman_intimidation)
print(DescAll, showAlllevels = TRUE)
summary(DescAll)

# Check data by 'psych' package (APA writeup will be dependant on the data, analyzed by psych)---
library(psych)
#Descriptives for full data set---
desctable = describe(Aman_intimidation)
View(desctable)


### 3c+d. Obtain Means, Median, and Standard Deviations on all appropriate variables for each level of the Year variable for recording junior.

# Describtives by Year---
DescYear = describeBy(Aman_intimidation, group = Aman_intimidation$Year)
print(DescYear, showAllLevels = TRUE)

