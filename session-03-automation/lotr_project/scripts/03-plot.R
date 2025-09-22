## import clean data
lotr_dat <- read_tsv("./session-03-automation/lotr_project/data/processed/lotr_clean.tsv") %>% 
  # reorder Race based on words spoken
  mutate(Race = reorder(Race, Words, sum))

## make a plot
p <- ggplot(lotr_dat, aes(x = Race, weight = Words)) + geom_bar()
ggsave("./session-03-automation/lotr_project/outputs/figures/barchart-words-by-race.png", p)
