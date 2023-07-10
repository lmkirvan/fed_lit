
# write a bind with names functions that adds a column for the names
disp <- bind_rows(
  tibble(
    type = "transfer"
    , DISP = c(0, 1, 10, 11)
    , name = c("transfer", "remanded" , "MDL", "agency"))
  , tibble(
    type = "dismissal"
    , DISP = c(2, 3, 12, 13, 14)
    , name = c("abandoned", "jurisdiction", "voluntary", "settled", "other")
  )
  , tibble(
    type = "judgement"
    , DISP = c(4, 5, 6, 7, 8, 9, 15, 16, 17, 18, 19, 20 )
    , name = c(
      "default"
      , "consent"
      , "pre-trial"
      , "jury"
      , "directed"
      , "court"
      , "arbitrator"
      , "bankruptcy"
      , "other"
      , "statistical"
      , "appeal affirmed"
      , "appeal deny")
  )
)


?bind_rows
