# R simple bullet chart

library(ggplot2)
library(lubridate)
library(ggthemes)
# Difference between real progress and planned

Today <- as.Date("2016-02-17")
LastDayofMonth <- ceiling_date(Today, "month")-1

# performance according to plan (percent)

Performance <- 0.60

progress <- Performance  - as.numeric(format(Today,"%d"))/as.numeric(format(LastDayofMonth,"%d"))

# set color of bar

if (progress> - 0.05) {
  fill_progress = "#54a41f"  #green
} else { 
    if (progress> - 0.20) {
      fill_progress = "#e8b202" # yellow
    } else {
      fill_progress = "#ea2134" # red
    }
  }




df <- data.frame( month = c("February"),
                  Performance = c(Performance*100))



ggplot(df, aes(y = Performance, x = month)) + 
  geom_bar(stat = "identity", fill = fill_progress) +
  theme_few() +
  theme(panel.border = element_blank(),
        axis.text.y   = element_text(size=14),
        axis.title.y  = element_blank(),
        axis.title.x  = element_blank(),
        legend.position="none") +
  scale_y_continuous(breaks = c(as.numeric(format(Today,"%d"))/as.numeric(format(LastDayofMonth,"%d"))*100,
                                100),
                     labels = c(format(Today,"%d.%m"),
                                format(LastDayofMonth,"%d.%m"))) +
  coord_flip(ylim = c(0,100)) 
  

