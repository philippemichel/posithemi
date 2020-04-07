#' Tableau & graphique d'une regression lineaire
#'
#' @param dfx dataframe a explorer
#' @param varf Variable de tri
#' @param vardef Vecteur de variables explicatives
#' @param graph TRUE : arbre de noel FALSE (default) : tableau
#'
#' @return tableau ou arbre de noel
#' @import finalfit,
#' rlang,
#' knitr,
#' kableExtra
#' 
#' @examples
#' @export
#'  
orgraph <- function(dfx, varf, vardef, graph = FALSE) {
  ddx <- as.formula(paste(varf, " ~ ", paste(vardef, collapse = " + ")))
  # return(ddx)
  # reg <- glm(ddx, data = dfx, family="binomial")
  # summary(reg)
  if (graph) {
   dfx %>% 
      or_plot(varf,vardef)
  }
  else{
    dfx %>%
      finalfit(varf, vardef) %>%
      kable(row.names = FALSE) %>%
      kable_styling(bootstrap_options = c("striped", "condensed"),
                    full_width = F)
  }
}