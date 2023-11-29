todo 

- [] convert to package format (look at how to document data scripts in r packages book
- [] write a function (I think just) that converts the dense version into a time series groupings (e.g. take the have for each day the unique combination of judges in a court. ) what about nominating presidents?
  - does this look at creating a long time series first and then just nesting as needed? 
- [] suggest weights for senior status( .2 for senior status and 1 for judges)
- [] consider including schools?
- [] look for a federalist society list? 

function that takes court list and date lists and does a join of some kind

Modeling questions

do we want to have groups for each set of unique judges in a district. That could be done by just concatenating their names together?

We want to look at a couple of things

-   how long it takes for cases to get resolved over time
-   how filing behavior changes as judges get added
-   how different groups of appointees--most importantly grouped appointing president change flows into different courts
    -   do they change the mix of lawsuits brought to each court (interaction with nature of suit?)
    -   do they change the pace of filings
    -   do they change which kinds of parties are filing
