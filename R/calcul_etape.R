
#' Calcul de part pour un nombre donné de parents et d'enfants d'une famille
#'
#' @param p nombre de parents (2 pour famille biparentale, 1 pour famille monoparentale)
#' @param e nombre d'enfants
#'
#' @return les nombre de parts de la famille
#' @export
#'
#' @examples
#' part(2, 3)
part <- function(p,e){
  dplyr::case_match( p,
                     1 ~ 1.5,
                     2 ~ 2
  ) + 0.5 * e
}

#' pondération d'un quotient familial, la pondération converti le quotient familial en dénomination locale en EUR selon le taux de chancelerie en tennant compte des differences de pouvoir d'achat entre le lieux de vie de la famille et Paris.
#'
#' @param q quotient familial en denomination locale
#' @param i index de parité de pouvoir d'achat (IPPA)
#' @param tx taux de chancellerie
#'
#' @return un nombre, le quotient familial ponderé en EUR
#' @export
#'
#' @examples
#' ponderation(8500, 97, 1.23)
ponderation <- function(q, i, tx){
  q * (100/i) * tx
}

#' calcul de la quotité finale après application de la cps
#'
#' @param q quotient théorique en nombre entier (0.9 pour 90%)
#' @param t taux de cps en nombre entier (0.01 pour 1%)
#'
#' @return le quotient final après soustraction de la cps
#'
#' @export
#'
#' @examples
#' cps(0.37, 0.06)
cps <- function(q, t) {
  bound(q - t * bound(quotient(q, 0.8, 1)))
}

#' quotité théorique de bourse
#'
#' @param q quotient familial pondéré en EUR
#'
#' @return la quotité théorique de bourse
#' @export
#'
#' @examples
#' quotite(7000)
quotite <- function(q){
  quotient(q, 3000, 23000)
}

