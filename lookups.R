
disp <- bind_rows(
  Transfer <- list(
    DISP = c(0, 1, 10, 11)
    , name = c("transfer", "remanded" , "MDL", "agency"))
  ,Dismissals <- list(
    DISP = c(2, 3, 12, 13, 14)
    , name = c("abandoned", "jurisdiction", "voluntary", "settled", "other")
  )
  , Judgment <- list(
    DISP = c(4, 5, 6, 7, 8, 9, 15, 16, 17, 18, 19, 20 )
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
