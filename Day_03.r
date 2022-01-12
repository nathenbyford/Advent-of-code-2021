##########################
## Nathen Byford
## Dec. 3, 2021
##########################

library("tidyverse")

examp <- c(
    "00100",
    "11110",
    "10110",
    "10111",
    "10101",
    "01111",
    "00111",
    "11100",
    "10000",
    "11001",
    "00010",
    "01010"
)

length(examp)

str_sub(examp, start = 2, end = 2) |> 
    as.numeric() |> 
    sum()


mcbit <- function(list, dig) {
    new_list <- list()
    amt = length(list)
    for(i in 1:dig) {
        ones = str_sub(list, start = i, end = i) |> as.numeric() |> sum()
        if(ones / amt > 0.5) {
            new_list[i] = "1"
        } else {
            new_list[i] = "0"
        }
    }
    bin = unlist(new_list) |> str_c(collapse = "")
    return(bin)
}

lcbit <- function(list, dig) {
    new_list <- list()
    amt = length(list)
    for(i in 1:dig) {
        ones = str_sub(list, start = i, end = i) |> as.numeric() |> sum()
        if(ones / amt < 0.5) {
            new_list[i] = "1"
        } else {
            new_list[i] = "0"
        }
    }
    bin = unlist(new_list) |> str_c(collapse = "")
    return(bin)
}


power_consumpt <- function(list) {
    len <- mean(str_length(list))
    gamma <- strtoi(mcbit(list, len), base = 2) 
    epsi <- strtoi(lcbit(list, len), base = 2)
    return(gamma * epsi)
}

dat <- read_lines("./data/Day_03.txt")
str(dat)

power_consumpt(dat)
