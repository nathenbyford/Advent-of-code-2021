##########################
## Nathen Byford
## Dec. 1, 2021
##########################
library("tidyverse")

dat <- c(199, 200, 208, 210, 200, 207, 240, 269, 260, 263)

count_increases <- function(input, lag = 1) {
    count = sum(diff(input, lag = lag) > 0)
    return(count)
}

count_increases(dat, 3)

large_dat <- read_lines(".//data//day_01.txt")

large_dat |> 
    as.numeric() |> 
    count_increases(lag = 3)
