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

urls <- glue::glue(
    template_url
    , page_number = seq(2, n_pages) |> as.character()
    )

get_partial <- purrr::partial(
    httr::GET
    , config = add_headers(
            'user-agent' = 'Legal Researcher (lmkirvan@gmail.com')
            ) 

result <- purrr::map(urls, get_partial)

get_json <- function(page) {
    page[["content"]]  |>
    rawToChar()  |>
    jsonlite::parse_json()
}

result_contents <- map(result, get_json)

contributors <- purrr::map(result_contents, "contributors")
contributors <- purrr::flatten(contributors)

topics <- purrr::map(contributors, "topics")  

topics <- map(topics, \(x){
    if(length(x) > 0){
        return( purrr::flatten_chr(x))
    } else {
        return("")
    }

})

contributors <- purrr::map(contributors, \(x) x[ names(x) != "topics"])

contributors  |> 
    purrr::map(\(x) map(x, \(x) ifelse(is.null(x), "", x)))  |>
    purrr::map(dplyr::as_tibble)  |>
    purrr::reduce(dplyr::bind_rows) -> df

df$topics <- topics

write_csv(df, "fed_soc_contributors.csv")
