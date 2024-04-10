
#' Quotite théorique implicite
#'  valeur de quotité théorique qui resulterait dans la quotité finale donné, en fonction du taux de CPS applicable
#'
#' @rdname revenu_net_imp
#' @return la quotite theorique de bourse
#'
#' @export
#'
#' @examples
#' quotite_theorique_imp(0.3, 0.05)
quotite_theorique_imp <- function(q, t) {
  q + t * (1 - quotient(q, 1, 0.8 - t))
}

#' @rdname revenu_net_imp
#' @export
quotient_pondere_imp <- function(q, t) {
  quotient_imp(quotite_theorique_imp(q, t))
}


#' @rdname revenu_net_imp
#' @export
quotient_familial_imp <- function(q, i, tx, t) {
  quotient_pondere_imp(q, t) * (i/100) / tx
}

#' @rdname revenu_net_imp
#' @export
revenu_ref_imp <- function(q, p, i, tx, t) {
  quotient_familial_imp(q, i, tx, t) * p
}

#' Revenu net implicite
#'
#' @param q quotité finale de bourse accordée: (ex. 0.3, donc 30% des frais seront pris en charge par la bourse)
#' @param s frais de scolarité strict en denomination locale (ex. 1 000 000 de Yen)
#' @param p part de la famille: 0.5 par enfants, 2 pour deux parents, 1.5 pour 1 parents seul (ex. 3 pour 2 parents et 2 enfants)
#' @param i index de parité de pouvoir d'achat (IPPA) fixé par l'AEFE pour l'école(ex. 78)
#' @param tx taux d'echange de la denomination locale en EUR, par Ex
#' @param t taux CPS fixé par l'AEFE pour réduire les bourses à la hauteur du budget alloué
#'
#' @return un nombre, les revenus net necessaire pour obternir la quotité finale dans le contexte parametré
#' @export
#'
#' @examples
#' revenu_net_imp(0.5, 1000, 3, 80, 1, 0.05)
revenu_net_imp <- function(q, s, p, i, tx, t) {
  revenu_ref_imp(q, p, i, tx, t) + s
}

#' Quotient implicite
#'  valeur du quotient pondéré necéssaire pour obtenir la quotité théorique donné
#'
#' @param q quotité théorique
#'
#' @return un nombre, le quotient pondéré necessaire pour obtenir quotité theorique donné
#' @export
#'
#' @examples
#' quotient_imp(0.75)
quotient_imp <- function(q){
  quotient_inv(q, 3000, 23000)
}
