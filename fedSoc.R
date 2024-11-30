library("rvest")
library(httr)

base_url <- "https://fedsoc.org/json/contributors?
showRecent=true&topic=0&letter=0&page=1"

initial_page <- httr::GET(base_url, add_headers('user-agent' = 'Legal Researcher (lmkirvan@gmail.com'))

initial_page$content |>
    rawToChar() |>
    jsonlite::parse_json() -> initial_page


n_pages <- initial_page$pages

initial_page$contributors

template_url <- "https://fedsoc.org/json/contributors?showRecent=true&topic=0&letter=0&page={page_number}&search="

urls <- glue::glue(template_url, seq(2, n_pages)   %>% )