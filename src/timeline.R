library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)
library(rvest)
library(readxl)

#try to parse the github repo
useLiveVersion<-FALSE
if(useLiveVersion){
  url <- "https://raw.githubusercontent.com/leipzig/awesome-reproducible-research/master/readme.md"
  url %>%
    rvest::html() %>%
    html_nodes(xpath='//*[@id="case_studies"]') %>%
    html_table(header=TRUE) %>% first() %>%
    dplyr::filter(Approach != 'Theoretical') %>% mutate(Date=as.Date(Date)) -> timeline
  timeline[timeline$Approach %in% c('Reproduction','Refactor','Robustness test'),"Approach"]<-"Reproduction/\nRefactor/\nTest of Robustness"
}else{
  #just use this cached copy
  read_excel("../data/arr/timeline.xlsx") %>% 
    filter(!is.na(Macrofield)) %>% 
    mutate(Date=lubridate::ymd(Publication_Date)) %>%
    dplyr::mutate(SizeGroup=cut(Size, breaks = c(0,1,10,1000,10000,100000),labels=c("1","2-10","11-1000","1001-10000","10001+"))) -> timeline
}

ggplot(timeline) +
  geom_point(aes(x = Date, y = Approach, color = Macrofield,
                    size = log10(Size))) +
  scale_size_continuous(name = 'Study size (log10)',breaks=c(0,2,4,6)) + #,range=c(2,5)) +
  scale_color_discrete(name = 'Field') +
  scale_x_date(date_breaks="2 years",date_labels = "%Y")
