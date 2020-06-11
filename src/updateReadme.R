library(dplyr)
library(readr)
library(knitr)
library(stringr)

# transform the standards table into a markdown display with emojis
read.table("data/standards.tsv.txt",sep="\t",header=TRUE) %>% 
  mutate(Publication=ifelse(Publication!='',paste0('[:books:](https://doi.org/',Publication,')'),'')) %>%
  mutate(Site=ifelse(Site!='',paste0('[:house:](',Site,')'),'')) %>%
  mutate(Example=ifelse(Example!='',paste0('[:clipboard:](data/examples/',Example,')'),'')) %>%
  mutate(Standard = paste(Standard,Publication,Site,Example,sep='&nbsp;')) %>% 
  select(-c(Publication,Site,Example)) -> stds

#insert this in the README using the template tags
readr::read_file("README.md") %>%
  stringr::str_replace(stringr::regex('<!--standards_begin-->.+<!--standards_end-->',multiline=TRUE,dotall=TRUE),paste('<!--standards_begin-->',paste(knitr::kable(stds),collapse="\n"),'<!--standards_end-->',collapse="\n",sep="\n")) %>%
  readr::write_lines(path="newreadme.md",append=FALSE)

# mv newreadme.md README.md
# git commit -m 'updated README.md with standards' README.md
# git push origin master
