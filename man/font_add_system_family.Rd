% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{font_add_system_family}
\alias{font_add_system_family}
\title{Record a system font family in \code{\link[sysfonts:font_add]{sysfonts::font_add()}}. Must be called in each new R session.}
\usage{
font_add_system_family(family)
}
\arguments{
\item{family}{The name of the family which exists in system fonts and is reported in \code{\link[systemfonts:system_fonts]{systemfonts::system_fonts()}}\tabular{lllllllll}{
   path \tab index \tab name \tab family \tab style \tab weight \tab width \tab italic \tab monospace \cr
   /usr/share/fonts/truetype/noto/NotoSerifArmenian-ExtraCondensedExtraBold.ttf \tab 0 \tab NotoSerifArmenian-ExtraCondensedExtraBold \tab Noto Serif Armenian ExtraCondensed ExtraBold \tab ultrabold \tab extracondensed \tab FALSE \tab FALSE \tab  \cr
}}
}
\description{
Record a system font family in \code{\link[sysfonts:font_add]{sysfonts::font_add()}}. Must be called in each new R session.
}
