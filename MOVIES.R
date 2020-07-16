# inport the data
movies <- read.csv(file.choose())

# explore data
head(movies)
summary(movies)
str(movies)

# ggplot2
library(ggplot2)

#Build filters for genre and studio
filter1 <- (movies$Genre == "action") | (movies$Genre == "adventure") | (movies$Genre == "animation") | (movies$Genre == "comedy") | (movies$Genre == "drama")
filter2 <- movies$Studio == "Buena Vista Studios" | movies$Studio == "Fox" | movies$Studio == "Paramount Pictures" | movies$Studio == "Sony" | movies$Studio == "Universal" | movies$Studio == "WB"

movies2 <- movies[filter1 & filter2,]
movies2

#prepare the data and aes layers for plot
m <- ggplot(data=movies2, aes(x=Genre, y=Gross...US))
m

# add geometries
n <- m + geom_jitter(aes(color=Studio), size=0.5) + 
         geom_boxplot(alpha=0.6, outlier.color = NA)

w <- n + xlab("Genre") + ylab("Gross % US") + 
         ggtitle("Domestic Gross % by Genre")

#theme
w + theme(
  axis.title.x = element_text(color="Blue", size=10),
  axis.title.y = element_text(color="Blue", size=10),
  axis.text.x = element_text(size=8),
  axis.text.y = element_text(size=8),
  
  plot.title = element_text(size=15),
  
  legend.title = element_text(size=10),
  legend.text = element_text(size=8),
)

# final result
w

