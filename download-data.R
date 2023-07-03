url <- "https://www.fjc.gov/research/idb/civil-cases-filed-terminated-and-pending-sy-1988-present"

parsed <- rvest::read_html(url) 
selector <- "body > div.l-page > div > div > div > div > div > div > div.panel-pane.pane-views.pane-idb-datasets > div > div"

parsed |> 
  rvest::html_element(css = selector ) |>  
  rvest::html_elements("a") |> 
  rvest::html_attrs() -> links

links |> as.character() |> strsplit(split = "/") |> 
  purrr::map(tail, n = 1) |> 
  purrr::flatten_chr() -> files
  
system("mkdir raw_data")

for(i in seq_along(links)){
  
  download.file(url = links[[i]], destfile = paste0("raw_data/",files[i] ))

}

raw_data <- list.files("raw_data/")
file_names <- substr(raw_data, 1,4)

safely_wds <- purrr::safely(arrow::write_dataset)
results <- list()

for(file_index in seq_along(raw_data)){
  print(file_index)
  results[file_index] <- safely_wds(
    haven::read_sas(data_file = paste0("raw_data/", raw_data[file_index]))
    , "data/"
    , partitioning = c('CIRCUIT', "TAPEYEAR"))$error
  
  gc()
  
}

# 2021 data files is broken. Lame.
# Maybe the five year file works? 
#unzip("cv18to23_0.zip")
ds <- haven::read_sas("https://www.fjc.gov/sites/default/files/idb/datasets/cv18to23_0.zip")
#write dataset by year
arrow::write_dataset(
  ds
  , path = "data"
  , partitioning = c('CIRCUIT', "TAPEYEAR")
)

