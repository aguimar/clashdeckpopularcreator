popular_decks <- function() {
  # Script para montar ranking das cartas mais usada nos decks 
  #populares do site http://stattsroyale.com
  library(rvest)
  library(tidyverse)
  library(stringr)
  clash_top_decks <- read_html("http://statsroyale.com/top/decks")
  
  # Tests
  #html_nodes(clash_top_decks, ".popularDecks__deck .popularDecks__decklist")
  #html_nodes(clash_top_decks, ".popularDecks__decklist a")
  #nodes <- html_nodes(clash_top_decks, ".popularDecks__decklist a")
  #html_attr(nodes, "href")
  #html_text(nodes)
  # End Tests
  
  cards <- html_nodes(clash_top_decks, ".popularDecks__decklist a") %>%
    html_attr("href") %>%
    str_replace("/card/", "")
  tbl_cards <- as_tibble(table(cards)) %>%
    arrange(desc(n))
  
  tbl_cards
}
