library(dplyr)
library(ggplot2)

path = 'data.csv'
data = read.csv2(path, header = FALSE, col.names = c("ds", "y"))
data = data %>%
  mutate(ds = as.Date(ds))

plot1 = data %>%
  ggplot(., aes(ds, y)) +
  geom_path() + 
  theme_minimal()
print(plot1)

plot2 = data %>%
  ggplot(., aes(y = y)) +
  geom_boxplot() + 
  theme_minimal()
print(plot2)

plot3 = data %>% 
  ggplot(., aes(x = y)) +
  geom_histogram(bins =  1 + log2(nrow(data)), color = "white") +
  theme_minimal()
print(plot3)
