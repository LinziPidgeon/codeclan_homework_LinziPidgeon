
#Project - Meteorites homework
Project contains a .R file (called "Meteorite_homework.R") and a .Rmd file (called "Meteorites_homework_pt2")


#The .R file cleans the meteorite data with the code specifically: 
  Cleaning column names
  Separating latitude and longitude coordinates into 2 columns
  Replacing missing coordinate values with 0
  Removing meteorites less than 1000g in weight from the data
  Ordering the data by the year of discovery
  
The final dataset from the R script, post cleaning, is called "meteorite_ordered"
  
  
#The .Rmd file analyses the "meteorite_ordered" dataset, the code specifically looks at:
  Identifies the names and years of the 10 largest meteorites in the dataset
  Finds the average mass of meteorites that were recorded falling, vs. those which were just found
  Finds the number of meteorites in each year, for every year since 2000
  