pacman::p_load(tidyverse, ggplot2, text2vec, glmnet, uwot, keras, stopwords, udpipe, word2vec)

df <- read_csv("ideas_rows.csv")

df <- df %>% 
  mutate(
    text = paste(title, summary, author, sourced) %>% tolower()
)

x = tolower(df$text)

set.seed(123)
model <- word2vec(x, type="cbow", dim=15, iter=20)

embedding <- as.matrix(model)
embedding