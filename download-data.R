#install.packages("rvest") install.packages("httr") this files work except that
#the sas file for 2021 doesn't open. I will go back and look at the text files.
#those also had bad characters, but maybe I can manually fix them. For now I
#feel like working with actual data and not fixing the file

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

links <- links |> purrr::discard( ~ grepl('to23', .))
files <- files |> purrr::discard( ~ grepl('to23', .))

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
  
  safely_wds(
    haven::read_sas(data_file = paste0("raw_data/", raw_data[file_index]))
    , "data/"
    , partitioning = c('CIRCUIT', "TAPEYEAR")
    , basename_template = paste0(file_names[file_index], "-{i}")
    , max_open_files = 100
    )
  
  gc()

}

