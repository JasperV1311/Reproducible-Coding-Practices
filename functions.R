convert_ordinal <- function(x) {
  as.numeric(
    factor(
      x,
      levels = c("no", "Sometimes", "Frequently", "Always")
    )
  ) - 1
}
  
convert_binary <- function(x) {
  ifelse(x == "yes", 1L, 0L)
}