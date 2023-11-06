df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu','Richards','George','Ema','Samantha','Catherine'), 
               State=c('Alaska','California','Texas','North Carolina','California','Texas', 'Alaska','Texas','North Carolina','Alaska','California','Texas'), 
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))
#above creates a data frame with three columns for name, state, and sales

aggregate(df1$Sales, by=list(df1$State), FUN=sum)
#this computes the sum for sales by state and returns the result in an easy to read list by state in alphabetical order

library(dplyr) 
#this provides tools for data management tasks

df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))
#this also computes the sum for sales by state, but it also includes column names
