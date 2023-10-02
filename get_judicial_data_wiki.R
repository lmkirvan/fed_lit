circuits <- c(
  "First"
  , "Second"
  , "Third"
  , "Fourth"
  , "Fifth"
  , "Sixth"
  , "Seventh"
  , "Eighth"
  , "Ninth"
  , "Tenth"
  , "Eleventh")

base_string <- c(
  "https://en.wikipedia.org/wiki/United_States_Court_of_Appeals_for_the_{circuit}_Circuit")

urls <- stringr::str_replace(
  base_string
  , pattern = "\\{circuit\\}"
  , circuits
  )

site <- rvest::read_html(urls[2]) 

tables <- site |> rvest::html_elements("table")
  
tables |> 
  purrr::map(rvest::html_table) |>
  purrr::keep( ~ ncol(.) == 9) -> final_tables
  
final_tables[[1]]

