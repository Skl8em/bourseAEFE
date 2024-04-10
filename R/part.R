


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
