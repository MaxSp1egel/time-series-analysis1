library(dplyr)

Utest <- function(x, y, p) {
  x <- data.frame(value = x, group = 0)
  y <- data.frame(value = y, group = 1)
  z <- rbind(x, y) %>%
    arrange(value)
  
  data <- data.frame(z, rank = 1:nrow(z))
  data <- data %>%
    group_by(value) %>%
    mutate(rank = mean(rank)) %>%
    ungroup()
  
  U <- data %>%
    select(rank, group) %>%
    group_by(group) %>%
    summarise(value = sum(rank) - n() * (n() + 1) / 2)
  
  if (min(U$value) <= qwilcox(p, nrow(x), nrow(y))) {
    print('Difference is significant')
  } else {
    print('Difference is insignificant')
  }
}