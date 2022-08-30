test_normalize_empty <- function(){
    expect_identical(
    normalize_empty(numeric(0)), NULL
    )
    character_vec <- c("/usr/", "/share")
    expect_identical(
        normalize_empty(character_vec), character_vec)
    
}

test_font_add_system_family <- function() {
    expect_error(font_add_system_family("xyzljb"))
    # record Courrier
    font_add_system_family("Courier")
    boolrecord <- "Courier" %in% sysfonts::font_families()
    expect_identical(boolrecord, TRUE)
}


test_normalize_empty()
test_font_add_system_family()
