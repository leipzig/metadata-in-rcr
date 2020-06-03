library(bib2df)
library(dplyr)
library(tidytext)
library(stringr)
library(wordcloud)
library(knitr)

pal <- brewer.pal(8,"Dark2")
path<-"~/Downloads/References from .bib"
df <- bib2df(path)
df %>% dplyr::filter(!is.na(ABSTRACT)) %>% unnest_tokens(word,ABSTRACT) %>% anti_join(stop_words) %>% count(word, sort = TRUE) %>% ungroup() -> tokens_clean
tokens_clean %>%
with(wordcloud(word, n, random.order = FALSE, max.words = 100, colors=pal))
