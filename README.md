# Demonetisation
# About Demonetisation Data Set
The data given in “Demon.csv” presents people’s reaction on demonetisation.
The data was collected from the states given in “Residence”.
The people’s id was given so as to protect the 	identity of the individual.
The variable “Urban” indicates whether the person is from the urban area of the state (TRUE) or rural area (FALSE).
The age and monthly income of the persons included in the study are given in “age” and “monthly.income” respectively.
If the concerned person supports demonetisation policy then  “Yes” is noted otherwise a “No”. Suppose you are a data scientist.
There are some exceptions in the dataset which is impossible(like having an age of 1130 years).
some assumptions, based on which we performed our extraction from the dataset.
1. The person having opinion “Not Yes” have been assumed not supporting the demonetisation and all these cases are treated as “No”.

2. The person with the age of 1130 years has not been considered as part of data-set and has been removed while analyzing the dataset.

3. In age, we have made three categories:
0-21: Teen
21-60: Adult
60-150: Old

4. In monthly income, we have made three categories:
0-30000rs: Poor
30000-100000rs: Middle
Above 100000rs: Rich
