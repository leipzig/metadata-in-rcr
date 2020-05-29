library(dplyr)
library(ggplot2)
library(readr)
library(lubridate)
library(rvest)
library(readxl)
library(stringr)

#try to parse the github repo as it is now vs a commit we know will work
useLive<-TRUE
if(useLive){
  url<-"https://raw.githubusercontent.com/leipzig/awesome-reproducible-research/master/readme.md"
}else{
  url<-"https://raw.githubusercontent.com/leipzig/awesome-reproducible-research/98a6fbaafd70eb80b2bc9c7987bb4618b5d0bd2b/readme.md"
}

#fetch ARR readme, convert meta props as table cells, make size numeric, classify macrofields
  read_html(url) %>%
  as.character()  %>% 
    stringr::str_replace_all("<meta property=\"datePublished\" content=\"(\\d\\d\\d\\d-\\d\\d-\\d\\d)\">","</td><td>\\1</td><td>") %>% 
    stringr::str_replace_all("<meta property=\"embeddedDate\">","</td><td>Date</td><td>Year") %>% 
    xml2::read_html() %>%
    html_nodes(xpath='//*[@id="case_studies"]') %>%
    html_table(header=TRUE) %>% first() %>%
    mutate(Date=as.Date(Date)) %>%
    mutate(Size=stringr::str_replace_all(Size,'[,A-Za-z]','')) %>% 
    rowwise() %>%
    mutate(Size=max(as.numeric(stringr::str_split(string = Size,pattern = '\\s+',simplify=TRUE)),na.rm = TRUE)) %>%
    mutate(Approach = stringr::str_replace(Approach,'Robustness test','Test of Robustness')) %>%
    mutate(Field=case_when(
        str_detect(Field,'[Bb]io|Med|Gene|geno|Epidem|Anaes|Viro|Pharma|Geno|Eco|Neuro|Cell|Neph') ~ "Life Sciences",
        str_detect(Field,'(Econ|Social|Psych|rchae)') ~ 'Social Sciences',
        str_detect(Field,'(Compu|Mach|Physics|Eng|NLP|earning|Signal|Soft|Geo|Arti)') ~ 'Physical Sciences & Engr',
        TRUE ~ as.character(Field)
    )) -> timeline

ggplot(timeline) +
  geom_point(aes(x = Date, y = Approach, color = Field,
                    size = log10(Size))) +
  scale_size_continuous(name = 'Study size (log10)',breaks=c(0,2,4,6),labels=c("1","100","1000","1e6")) +
  scale_color_discrete(name = 'Field') +
  scale_x_date(date_breaks="2 years",date_labels = "%Y")
