library(shiny)
library(readr)

source("modules/selectorsGoButton.R")
source("modules/histogram.R")
source("modules/table.R")
source("modules/scatter.R")

students_big <- read_csv("data/students_big.csv")