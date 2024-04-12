


#' Calcul du quotient final des bourse AEFE en consideration de
#'
#' @param salaire salaire net en denomination locale (ex. 3 000 000 de Yen)
#' @param scolarite frais de scolarité strict en denomination locale (ex. 1 000 000 de Yen)
#' @param part part de la famille: 0.5 par enfants, 2 pour deux parents, 1.5 pour 1 parents seul (ex. 3 pour 2 parents et 2 enfants)
#' @param ippa taux IPPA (index de parité de pouvoir d'achat) fixé par l'AEFE pour l'école(ex. 78)
#' @param tx taux d'echange de la denomination locale en EUR, par Ex
#' @param t_cps taux CPS fixé par l'AEFE pour réduire les bourses à la hauteur du budget alloué
#'
#' @return la quotité qui détermine la hauteur de bourse accordée: (ex. 0.3, donc 30% des frais seront pris en charge par la bourse)
#' @export
#'
#' @examples
#' quotite_post_cps(7000000, 1100000, 2.5, 73, 0.0063, 0.05)
#'
quotite_post_cps <- function(salaire, scolarite, part, ippa, tx, t_cps) {
  cps(quotite_theorique(salaire, scolarite, part, ippa, tx), t_cps)
}

#' Calcul du quotient théorique, le pourcentage de bourse correspondant au besoin de la famille avant ajustement budgétaire
#'
#' @rdname quotite_post_cps
#'
#' @return la quotité qui détermine la hauteur de bourse correspondant au besoin reconnu par l'administration
#' @export
#'
#' @examples
#'  quotite_theorique(7000000, 1100000, 2.5, 73, 0.0063)
quotite_theorique <- function(salaire, scolarite, part, ippa, tx) {
  quotite(quotient_pondere(salaire, scolarite, part, ippa, tx))
}


#' Quotient ponderé
#'
#' @rdname quotite_post_cps
#'
#' @return un nombre, le quotient familial apres pondération en EUR
#' @export
#'
#' @examples
#' quotient_pondere(7000000, 1100000, 2.5, 73, 0.0063)
quotient_pondere <- function(salaire, scolarite, part, ippa, tx) {
  ponderation(quotient_f(salaire, scolarite, part), ippa, tx)
}

#' quotient familial
#'
#' @rdname quotite_post_cps
#'
#' @return quotient familial en denomination locale
#' @export
#'
#' @examples
#' quotient_f(7000000, 1100000, 2.5)
quotient_f <- function(salaire, scolarite, part) {
  pmax(0, (salaire - scolarite) / part)
}
