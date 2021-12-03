##########################
## Nathen Byford
## Dec. 2, 2021
##########################

library("tidyverse")

input <- tibble("dir" = c("forward", "down", "forward", "up", "down", "forward"),
    "amt" = c(5, 5, 8, 3, 8, 2))

input

end_position <- function(df) {
    horizontal = 0
    depth = 0
    aim = 0
    for(i in 1:dim(df)[1]) {
        if(df[i, 1] == "up") {
           aim = aim - df[i, 2]
        } else if (df[i, 1] == "down") {
           aim = aim + df[i, 2]
        } else if (df[i, 1] == "forward") {
           horizontal = horizontal + df[i, 2]
           depth = depth + (aim * df[i, 2])
        } 
    }
    return(horizontal * depth)
}

end_position(input)


## With the large data set
new <- read_table(".//data//Day_02.txt", col_names = FALSE)

end_position(new)

