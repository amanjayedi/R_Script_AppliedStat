

# Checking level of measurement (Year)---
is.ordered(Aman_intimidation$Year)
# Correcting measurement and reordering (Year)---
Aman_intimidation$Year = factor(Aman_intimidation$Year, levels = c('FR', 'SO', 'JR', 'SR', 'GRAD'), ordered = TRUE)
Aman_intimidation$Year


### Question: a. Provide a scatterplot between Intimidation before and Intimidation after.


# Producing a titled scatterplot between Intimidation before and Intimidation after with labels for the x and y axis---
plot(Aman_intimidation$IntimBF, Aman_intimidation$IntimAF, main = "scatterplot", xlab = "Intimidation before", ylab = "Intimidation after")


### Question: b. What Score on the Final is at the 70th percentile?

# Producing a number that represents the Score on the Final variable at the .70 percentile---
priceat70 = quantile(Aman_intimidation$Final, c(.70))
priceat70


### Question: c. Provide a histogram for the Final variable.

# Final variable in Aman_intimidation is 'IntimAF'. producing a purple histogram for the IntimAF variable---
hist(Aman_intimidation$IntimAF, col = "purple")


### Question: d. Using the base R commands, determine what the frequencies, relative frequencies, 
### (continued question) and percentages are for each category of the Major variable.

## Frequencies.
# providing frequencies for each category---
table(Aman_intimidation$Major)

## Relative Frequencies.
#creating frequency table to get relative frequency---
MajorFreq = table(Aman_intimidation$Major)
# Getting relative frequency of each cell---
MajorRfreq = prop.table(MajorFreq)

## Percentages.
# Multipling the relative frequency by 100 to get perctenages---
MajorPerc = MajorRfreq*100

## Combining the three tables
cbind(MajorFreq, MajorRfreq, MajorPerc)


### Question: e. Provide a Bar chart for the Major variable.

# producing a Bar chart for the Major variable--- 
plot(Aman_intimidation$Major)


### Question: f. Using the tableone package, determine what the frequencies and percentages
### (continued question) are for each category of the Biosex and Year variables.

# loading tableone package---
library(tableone)

# creating on an object with all data of the Biosex and Year variables---
amancat = c("Biosex", "Year")

# creates an object that is a table for all the specified variables---
table1 = CreateCatTable(vars = amancat, data = Aman_intimidation)

# showing the table object in the console with all variable levels reported---
print(table1,showAllLevels = TRUE)




### APA write up

# creating on an object with all nominal and ordinal data---
amanallcat = c("Biosex", "Major", "Year")

# creates an object that is a table for all the specified variables---
apatable1 = CreateCatTable(vars = amanallcat, data = Aman_intimidation)

# showing the table object in the console with all variable levels reported---
print(apatable1,showAllLevels = TRUE)



## tableone is not providing the decimal digit more than one. Therefore, to get accurate percentage for 'Year', base package was used.

# Frequencies.
# providing frequencies for each category---
table(Aman_intimidation$Year)

# Relative Frequencies.
#creating frequency table to get relative frequency---
YearFreq = table(Aman_intimidation$Year)
# Getting relative frequency of each cell---
YearRfreq = prop.table(YearFreq)

# Percentages.
# Multipling the relative frequency by 100 to get perctenages---
YearPerc = YearRfreq*100

# Combining the three tables
cbind(YearFreq, YearRfreq, YearPerc)

## tableone is not providing the decimal digit more than one. Therefore, to get accurate percentage for 'Year', base package was used.

# Frequencies.
# providing frequencies for each category---
table(Aman_intimidation$Year)

# Relative Frequencies.
#creating frequency table to get relative frequency---
YearFreq = table(Aman_intimidation$Year)
# Getting relative frequency of each cell---
YearRfreq = prop.table(YearFreq)

# Percentages.
# Multipling the relative frequency by 100 to get perctenages---
YearPerc = YearRfreq*100

# Combining the three tables
cbind(YearFreq, YearRfreq, YearPerc)

