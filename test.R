
ggx <- function(dtx, fin, varx){
  ddx <- formula(paste(fin," ~ ",paste(dd, collapse=" + ")))
  print(ddx)
  ll <- glm(ddx, data = tt, family="binomial")
  summary(ll)
}



dd <- c("cabinet","sexe", "age")