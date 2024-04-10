
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bourseAEFE

<!-- badges: start -->
<!-- badges: end -->

Propose des fonctions qui facilite la verification et le débat autour du
calcul des bourse de l’AEFE. Ces fonctions n’existe qu’a titre
indicatif,

## Installation

You can install the development version of bourseAEFE like so:

``` r
devtools::install_github("Skl8em/bourseAEFE")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(bourseAEFE)

salaire <- 5000
scolarite <- 1000
IPPA <- 0.8
tx <- 1

(q <- quotient_final(salaire, scolarite, 3, IPPA, tx, 0.07))
#> [1] 0
```
