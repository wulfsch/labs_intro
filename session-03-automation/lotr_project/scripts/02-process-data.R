## import raw data
lotr_dat <- read_tsv("./session-03-automation/lotr_project/data/raw/lotr_raw.tsv")

## reorder Film factor levels based on story
old_levels <- levels(as.factor(lotr_dat$Film))
j_order <- sapply(c("Fellowship", "Towers", "Return"),
                  function(x) grep(x, old_levels))
new_levels <- old_levels[j_order]

## process data set 
lotr_dat <- lotr_dat %>%
  # apply new factor levels to Film
  mutate(Film = factor(as.character(Film), new_levels),
         # revalue Race
         Race = recode(Race, `Ainur` = "Wizard", `Men` = "Man")) #%>%
  ## <skipping some steps here to avoid slide overflow>
  
  ## write data to file
  write_tsv(lotr_dat, file = "./session-03-automation/lotr_project/data/processed/lotr_clean.tsv")
