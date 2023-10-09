
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


presidents <- c("George Washington","John Adams","Thomas Jefferson"
                ,"James Madison","James Monroe","John Quincy Adams"
                ,"Andrew Jackson","Martin Van Buren","William Henry Harrison"
                ,"John Tyler","James K. Polk","Zachary Taylor","Millard Fillmore"
                ,"Franklin Pierce","James Buchanan","Abraham Lincoln","Andrew Johnson"
                ,"Ulysses S. Grant","Rutherford B. Hayes","James A. Garfield"
                ,"Chester Arthur","Grover Cleveland^","Benjamin Harrison"
                ,"Grover Cleveland^","William McKinley","Theodore Roosevelt"
                ,"William Howard Taft","Woodrow Wilson","Warren G. Harding"
                ,"Calvin Coolidge","Herbert Hoover","Franklin D. Roosevelt"
                ,"Harry S. Truman","Dwight D. Eisenhower","John F. Kennedy"
                ,"Lyndon B. Johnson","Richard M. Nixon","Gerald Ford","Jimmy Carter"
                ,"Ronald Reagan","George H. W. Bush","Bill Clinton","George W. Bush"
                ,"Barack Obama","Donald Trump","Joe Biden")