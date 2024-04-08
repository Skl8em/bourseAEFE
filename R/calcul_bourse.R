


#' Calcul du quotient final des bourse AEFE en consideration de
#'
#' @param salaire salaire net en denomination locale (ex. 3 000 000 de Yen)
#' @param scolarite frais de scolarité strict en denomination locale (ex. 1 000 000 de Yen)
#' @param part part de la famille: 0.5 par enfants, 2 pour deux parents, 1.5 pour 1 parents seul (ex. 3 pour 2 parents et 2 enfants)
#' @param ippa taux IPPA (index de parité de pouvoir d'achat) fixé par l'AEFE pour l'école(ex. 78)
#' @param tx taux d'echange de la denomination locale en EUR, par Ex
#' @param t_cps CPS fixé par l'AEFE pour réduire les bourses à la hauteur du budget alloué
#'
#' @return le quotient qui détermine la hauteur de bourse accordé: (ex. 0.3, donc 30% des frais seront pris en charge par la bourse)
#' @export
#'
#' @examples
#' quotient_final(7000000, 1100000, 2.5, 73, 0.0063, 0.05)
#'
quotient_final <- function(salaire, scolarite, part, ippa, tx, t_cps) {
  cps(quotient_theorique(salaire, scolarite, part, ippa, tx), t_cps)
}

#' calcul du quotient final après application de la cps
#'
#' @param q quotient théorique en nombre entier (0.9 pour 90%)
#' @param t taux de cps en nombre entier (0.01 pour 1%)
#'
#' @return le quotient final après soustraction de la cps
#'
cps <- function(q, t) {
  bound(q - t * bound(quotient(q, 0.8, 1)))
}

quotient_f <- function(salaire, scolarite, part) {
  pmax(0, (salaire - scolarite) / part)
}

quotient_pondere <- function(salaire, scolarite, part, ippa, tx) {
  quotient_f(salaire, scolarite, part) * (100 / ippa) * tx
}

quotient_theorique <- function(salaire, scolarite, part, ippa, tx) {
  quotient(quotient_pondere(salaire, scolarite, part, ippa, tx), 3000, 23000)
}
