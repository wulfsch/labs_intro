#Coding Solutions - Session 1

# Base R section
# Ex 1

# Ex 2
penguins[10, 1]
#or
penguins[10, "species"]

# Ex 3
penguins[15:20, 1:3]

# Ex 4
table(penguins$species, penguins$sex, useNA = "always")

# Ex 5
female_biscoe <- penguins[penguins$sex == "female" & penguins$island == "Biscoe", ]
nrow(female_biscoe)

# Tidyverse Section

#Ex 1
dplyr::select(penguins, species, island, year, body_mass_g, sex)

#Ex 2
penguins |>
  dplyr::filter(year == 2009 & species == "Chinstrap") |>
  dplyr::select(species, sex, year)

#Ex 3
penguins |>
  dplyr::group_by(species, year) |>
  dplyr::summarize(lightest_penguin = min(body_mass_g, na.rm = T))

#Ex 4

penguins |>
  dplyr::filter(island == "Dream") |>
  dplyr::arrange(body_mass_g)

# Exercise 5 ####
# Way 1: base R solution
get_mode <- function(v) {
  
  v <- na.omit(v)
  uniq_v <- unique(v)
  
  return(uniq_v[which.max(tabulate(match(v, uniq_v)))])
  
}

get_mode(study$age) #example

# Way 2: tidyverse solution
get_mode <- function(v) {
  
  out <- v |> 
    janitor::tabyl() |> 
    filter(n == max(n)) |> 
    pull(v)
  
  return(out)
  
}

get_mode(study$age) #example

# Way 3:
get_mode <- function(x){
  freq_table <- table(x)
  my_mode <- as.numeric(names(which.max(freq_table)))
  return(my_mode)
}

get_mode(study$age) #example

#Ex 6
get_mode(study$bmi_3cat) 


#Ex 7
replace_emotions <- function(x) {
  result <- recode(x, "happy" = ":)", "sad" = ":(", "neutral" = ":|")
  return(result)
}

replace_emotions(study$emotions)

#Ex 8
is.vector(map_dbl(df, mean, na.rm = TRUE))

#Ex 9
mean_sd <- function(x){
  if(!(is.numeric(x))) {
    # stop("x is not a numeric value")
    return(NULL)
  } else{ 
    list("mean" = mean(x, na.rm = TRUE),
         "sd" = sd(x, na.rm = TRUE))
  }  
}

#Ex 10
#Way 1
map(study %>% select_if(is.numeric), mean_sd)


#Way 2: dataframe
map_df(study |> select(where(is.numeric)), mean_sd) |> 
  cbind(
    'col' = study |> 
      select(where(is.numeric)) |> 
      colnames()
  )

#Way 3: 
map_vec(study$emotions, replace_w_emoticons)



#Ex 11
study |> select(where(is.character)) |> map_df(tolower)

