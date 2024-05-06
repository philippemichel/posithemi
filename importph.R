

#  ------------------------------------------------------------------------
#
# Title : Import POSI-HEMI
#    By : PhM
#  Date : 2024-05-06
#    
#  ------------------------------------------------------------------------



importph <- function(){
  rm(list=ls())
  library(readODS)
  library(tidyverse)
  library(janitor)
  library(baseph)
  library(labelled)
  library(lubridate)
  #
  nan <- c("NA","ND",""," ", "Manquant")
  
  tt <- read_ods("datas/POSIT-HEMI.ods", sheet = "datas", na = nan) |>
    janitor::clean_names() |>
    dplyr::mutate_if(is.character, as.factor)
  bn <- read_ods("datas/POSIT-HEMI.ods", sheet = "bnom")
  var_label(tt) <- bn$nom
  ltt <- ncol(tt)-1
  
tt <-   tt |> 
    mutate(across(starts_with("date_"), dmy)) |> 
    mutate(delai_avc = round(as.numeric(date_mcpaa_2_0 - date_avc)/30.5,1)) |> 
  relocate(delai_avc,.after = mode_propulsion_fauteuil_roulant) |> 
  dplyr::select(-starts_with("date_"))
var_label(tt$delai_avc) <- "Délai avc/inclusion(mois)"
  

pa <- read_ods("datas/PARCOURS_AVEUGLE.ods", sheet = "datas", na = nan)|>
  janitor::clean_names() |>
  dplyr::mutate_if(is.character, as.factor)
bn <- read_ods("datas/PARCOURS_AVEUGLE.ods", sheet = "bnom")
var_label(pa) <- bn$nom

save(tt, pa, file = "datas/posithemi.RData")
}

#load(file = "datas/posithemi.RData")

