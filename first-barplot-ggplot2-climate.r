# first-barplot-ggplot2-climate.r
# First Barplot in Ggplot2 using Climate Dat
#
# Jesse Bockstedt
# bockstedt.com
# For ISOM 675 Data Visualization, Goizueta Business School, Emory University
#
# Description:
# Quick tutorial on basic options for a barplot (not histogram) in ggplot2 R library.
# Uses the gcookbook library, which includes the climate data set


require(ggplot2)
require(gcookbook)
#if you get an error, make sure you've installed these packages locally using the install.packages() function


#create a subset of the climate data
csub <- subset(climate, Source=="Berkeley" & Year >=1900)
# create a new column based on whether the Anomaly10y is positive or negative
csub$pos <- csub$Anomaly10y >= 0
csub

#invoke the help function
?climate

#----#
#First barplot
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat="identity", position="identity")

#Notes
#Basically this says: ggplot(dataset, aes(xvalues, yvalues, what to fill the bar with) + bar chart geometr(bar chart options)
#stat="identity" uses the value in the Y variable as the height of the bar. In other words we've prebinned our data
#The default is stat="bin", which will bin your data for you. 
#For histograms, you probably haven't prebinned your data, for bar charts you probably have
#See this great explanation: https://stackoverflow.com/questions/15651084/error-with-ggplot2-mapping-variable-to-y-and-using-stat-bin

#-----#
#Now make it more user friendly
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + 
  geom_bar(stat="identity", position="identity", color="black", size=0.25) + 
  scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE)

#Notes
#color is the outline color for the bar (colour works too)
#fill is the color filled in the bar
#size for geom_bar is the thickness of the bar outline 
#scale_fill_manual is a function that allows you to assign specific colors to your fill values

#-----#
#Finishing Touches
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + 
  geom_bar(stat="identity", position="identity", color="black", size=0.25) + 
  scale_fill_manual(values=c("#CCEEFF", "#FFDDDD"), guide=FALSE) + 
  labs(y="10 year Anomaly in degrees C") + 
  ggtitle("Its getting hot in here!") + 
  theme_minimal()

#Notes: labs function adds labels to the graph and ggtitle adds a title (obviously). 
#Theme functions have preset values for all the formatting options. Check out the ggthemes library
