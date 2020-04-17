### 1. Inspect all variables and ensure that each are identified at the appropriate level of measurement.

# Identifying all the appropriate level of measurement---

# Checking level of measurement (Size)---
is.ordered(Aman_safety$Size)
# Correcting measurement and reordering (Size)---
Aman_safety$Size = factor(Aman_safety$Size, levels = c('<300', '300-499', '500-999', '1000+'), ordered = TRUE)
Aman_safety$Size
# Checking level of measurement (Crime)---
is.ordered(Aman_safety$Crime)
# Correcting measurement and reordering (Crime)---
Aman_safety$Crime = factor(Aman_safety$Crime, levels = c('Low', 'Moderate', 'High'), ordered = TRUE)
Aman_safety$Crime


### 2. Compute the appropriate Descriptive Statistics (frequencies, percentages, mean, medians, and standard deviation) for each variable in the file.

# Computing frequencies and percentages for nominal and ordinal values--
# loading tableone package---
library(tableone)
# creating on an object with all data of the variables---
amansafcat = c('Position', 'Corporal', 'OSS','Size', 'Crime')
# creates an object that is a table for all the specified variables---
table1 = CreateCatTable(vars = amansafcat, data = Aman_safety)
# showing the table object in the console with all variable levels reported---
print(table1,showAllLevels = TRUE)
View(table1)

# Computing mean, medians, and standard deviation for appropriate variables--
# Check data by 'psych' package---
library(psych)
#Descriptives for full data set---
desctable = describe(Aman_safety)
View(desctable)
# Here, only interval/ratio variables have mean, medians, and standard deviation.


### 3b. provide an APA write up detailing the appropriate descriptive statistics for at least one nominal/ordinal variable and at least one interval/ratio variable in the data file.
### 3c. provide a graph for each variable discussed in (b).

# Graph for one nominal/ordinal variable---
# producing a Bar chart for the Size variable--- 
plot(Aman_safety$Size)

# Graph for one interval/ratio variable---
# producing a green colored histogram for the Violent variable---
hist(Aman_safety$Violent, col = "green")



