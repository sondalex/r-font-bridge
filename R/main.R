#' Record a system font family in [sysfonts::font_add()]. Must be called in each new R session.
#' @param family The name of the family which exists in system fonts and is reported in [systemfonts::system_fonts()]
#' | path                                                                         | index | name                                      | family                                       | style     | weight         | width | italic | monospace |
#' |------------------------------------------------------------------------------|-------|-------------------------------------------|----------------------------------------------|-----------|----------------|-------|--------|-----------|
#' | /usr/share/fonts/truetype/noto/NotoSerifArmenian-ExtraCondensedExtraBold.ttf | 0     | NotoSerifArmenian-ExtraCondensedExtraBold | Noto Serif Armenian ExtraCondensed ExtraBold | ultrabold | extracondensed | FALSE | FALSE  |           |
#' 
#' @import systemfonts sysfonts
#' @export
font_add_system_family <- function(family) {
    sys_fonts <- systemfonts::system_fonts()
    if (!(family %in% sys_fonts$family)){
        stop(paste0("family:", family, " not reported in system fonts. Please enter a valid family name.", collapse=" "))
    }
    family_frame <- sys_fonts[(sys_fonts$family==family), ]
    # parse styles
    s_cats <- parse_styles(family_frame)
    
    font_add(family=family, regular=s_cats$regular, bold=s_cats$bold, italic=s_cats$italic, bolditalic=s_cats$bolditalic)
}

#' Change empty vector to null
normalize_empty <- function(v){
    if (length(v) == 0){
        return(NULL)
    }
    return(v)
        
}

#' Parse style elements
#' @param familyframe A frame derived from [systemfonts::system_fonts()]
#' @return A list of form: list(regular=c(path1, ...), bold=c(path2, ...), italic=c(path3, ...), bolditali=c(path3, ...))
parse_styles <- function(familyframe) {
    bold_italic_paths <- normalize_empty(familyframe[(familyframe$weight == "bold") & (familyframe$italic==TRUE), ]$path)
    bold_paths <- normalize_empty(familyframe[(familyframe$weight == "bold") & (familyframe$italic==FALSE), ]$path)
    italic_paths <- normalize_empty(familyframe[(familyframe$weight == "normal") & (familyframe$italic==TRUE), ]$path)
    regular_paths <- normalize_empty(familyframe[(familyframe$weight == "normal") & (familyframe$italic==FALSE), ]$path)
    styles_cats <- list(regular=regular_paths, bold=bold_paths, italic=italic_paths, bolditalic=bold_italic_paths)
    return(styles_cats)
}
