# First Scatterplot Ggplot2 Birthweight
#
# Jesse Bockstedt
# bockstedt.com
# For ISOM 675 Data Visualization, Goizueta Business School, Emory University
#
# Description:
# Quick tutorial on basic options for scatterplots in ggplot2 R library.
# Uses the birthweithg_reduced dataset from https://www.sheffield.ac.uk/mash/data
# Assumes csv data file is in same directory as this script


require(ggplot2)

birthweight.df <- read.csv('birthweight_reduced.csv')

# Look at the first few rows, structure and dimensions of the data
head(birthweight.df) 
str(birthweight.df) 
dim(birthweight.df)


## First ScatterplotS
# Let's see if there's a relationship between the Gestation (week of birth) and 
# baby's weight
birthweight.p <- ggplot(data = birthweight.df, aes(y = Birthweight, x = Gestation))

birthweight.p + geom_point()

# Let's look at whether being a smoker impacted this relationship
birthweight.p <- ggplot(data = birthweight.df, aes(y = Birthweight, x = Gestation, color=factor(smoker)))
birthweight.p + geom_point()

# What happens if we don't factorize the smoker variable?
birthweight.p <- ggplot(data = birthweight.df, aes(y = Birthweight, x = Gestation, color=smoker))
birthweight.p + geom_point()

# Let's check the relationships for smokers and non smokers a little closer
birthweight.p <- ggplot(data = birthweight.df, aes(y = Birthweight, x = Gestation, color=factor(smoker), shape=factor(smoker)))
birthweight.p + geom_point() + geom_smooth(method="lm", fill=NA)

# Finally, let's clean up the formatting
birthweight.p <- ggplot(data = birthweight.df, 
                        aes(y = Birthweight, 
                            x = Gestation, 
                            color=factor(smoker, labels = c("No", "Yes")), 
                            shape=factor(smoker, labels = c("No", "Yes"))))

birthweight.p + geom_point() + 
  geom_smooth(method="lm", fill=NA) +
  labs(x = "Gestation Time at Birth (weeks)", 
       y = "Birth Weight (lbs)", 
       title = "How Smoking Impacts Gestation and Birth Weight", 
       shape="Mother Smoked?", 
       color="Mother Smoked?") +
  theme_light()
  
