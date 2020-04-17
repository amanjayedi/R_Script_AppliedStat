# Analysis Project 1_ Jayedi Aman

# Data imported from Aman_intimidation

# Checking level of measurement (Biosex)---
is.factor(Aman_intimidation$Biosex)
Aman_intimidation$Biosex


# Checking level of measurement (Major)---
is.ordered(Aman_intimidation$Major)
# Correcting measurement and reordering if needed (Major)---
Aman_intimidation$Major = factor(Aman_intimidation$Major, ordered = TRUE)
Aman_intimidation$Major


# Checking level of measurement (Year)---
is.ordered(Aman_intimidation$Year)
# Correcting measurement and reordering (Year)---
Aman_intimidation$Year = factor(Aman_intimidation$Year, levels = c('FR', 'SO', 'JR', 'SR', 'GRAD'), ordered = TRUE)
Aman_intimidation$Year


# Checking level of measurement (Final)---
is.numeric(Aman_intimidation$Final)
Aman_intimidation$Final


# Checking level of measurement (IntimBF)---
is.numeric(Aman_intimidation$IntimBF)
Aman_intimidation$IntimBF


# Checking level of measurement (IntimAF)---
is.numeric(Aman_intimidation$IntimAF)
Aman_intimidation$IntimAF
