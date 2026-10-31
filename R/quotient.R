#' calcule le quotient d'un point x entre deux bornes a et b, mesuré depuis b,
#' borné entre 0 et 1 : 1 pour x <= a, 0 pour x >= b
#' en formule x = b - quotient * (b - a)
#'
#' @param x point dont on veut connaitre le quotient
#' @param a borne basse
#' @param b borne haute
#'
#' @return a number
#'
quotient <- function(x, a, b) {
  bound((b - x) / (b - a))
}

bound <- function(x) {
  pmax(0, pmin(1, x))
}

quotient_inv <- function(x, a, b) {
  b - (b - a) * x
}
