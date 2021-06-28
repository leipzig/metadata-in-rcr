library("bibtex")
library("dplyr")
library("tidytext")
library("stringr")
library("wordcloud")
library("knitr")
library("readr")
library("here")

pal <- brewer.pal(8, "Dark2")

useFullText <- FALSE

if (useFullText == TRUE) {
  #full text from pdfs, cannot be shared publicly
  readr::read_file("../data/citations/tokens.txt.gz") %>%
    stringr::str_replace_all("'", "") %>%
    stringr::str_replace_all("\\[", "") %>%
    stringr::str_replace_all("\\]", "") %>%
    stringr::str_replace_all(" ", "") %>%
    stringr::str_split(pattern = ",", simplify = TRUE) %>%
    stringr::str_to_lower() -> tokenvec
    data.frame(word = tokenvec) %>%
      anti_join(stop_words) %>%
      count(word, sort = TRUE) %>%
      ungroup() -> tokens_clean
} else {
  #just the abstracts
  path <- here::here("data/citations/metadata-in-rcr-refs.bib")
  bib <- bibtex::read.bib(path)
  df <- data.frame(`ABSTRACT` = unlist(
    sapply(bib, function(b) { b$abstract })))
  df %>% dplyr::filter(!is.na(ABSTRACT)) %>%
    unnest_tokens(word, ABSTRACT) %>%
    anti_join(stop_words) %>%
    count(word, sort = TRUE) %>%
    ungroup() -> tokens_clean
}

tokens_clean %>%
  with(wordcloud(word,
    n,
    random.order = FALSE,
    max.words = 100,
    colors = pal)) -> word_cloud
