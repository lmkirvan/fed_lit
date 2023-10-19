# start of a file for testing the data

#the total number of courts should match the commisions plust assigments for judges that are terminated
commissions <- purrr::map(dates, 2) |> lengths()

assign <- (purrr::map(dates, 4) |> lengths()) + (purrr::map(dates, 5) |> lengths()) 

total <- commissions + assign
terminations <- purrr::map(dates, 6) |> lengths()

terminations <- ifelse(terminations == 0, 1, terminations)
terminations
total
sum(total != terminations)

total_courts <- (purrr::map(courts, 1) |> lengths()) + 
  (purrr::map(courts,2) |> lengths() ) 

sum(total != total_courts) %in%  
  
  which(total != terminations) 

which(total_courts != total) 

courts[[1517]]

judges[[1517]]
get_dates(short_texts[[1517]])
get_courts(texts)
short_texts[[1517]]
judges[[1518]]