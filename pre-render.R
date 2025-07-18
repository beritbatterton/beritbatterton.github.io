library(tidyverse)
library(glue)
library(lubridate)
library(stringr)
library(RefManageR)
library(readODS)
library(gt)
library(yaml)

# source("~/Documents/Resumes/functions.R")

inst <- tribble(~short, ~long,
                "UPenn", "University of Pennsylvania",
                "UTAustin", "University of Texas at Austin",
                "UTMSI", "University of Texas Marine Science Institute")

# workshops <- read_ods("~/Documents/Resumes/jobs.ods", sheet = "Workshops") |>
#   mutate(across(everything(), ~str_replace_all(., setNames(inst$long, inst$short))))
# extra <- read_ods("~/Documents/Resumes/jobs.ods", sheet = "Extra") |>
#   bind_rows(read_ods("~/Documents/Resumes/jobs.ods", sheet = "Teaching and Community")) |>
#   mutate(across(everything(), ~str_replace_all(., setNames(inst$long, inst$short))))



fmt_gt <- function(d) {
  gt(d) %>%
    fmt_markdown(columns = any_of(c("content", "title"))) %>%
    cols_align(align = "left") %>%
    tab_options(column_labels.hidden = TRUE,
                table.width = "100%") |>
    cols_width(1 ~ "20%")
}
