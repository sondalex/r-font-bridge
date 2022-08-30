# r-font-bridge
Utility for loading system fonts families which are not sysfonts::font_families. Bridges `systemfonts` and `sysfonts.

## Installation


```r
devtools::install_github("sondalex/r-font-bridge")
```

## Usage

```r
library(rfontbridge)
font_add_system_family("Courier")
```

### Use case example

* You are trying to match the tex font in your RMarkdown document pdf with the font in figures, just add:
  ~~~
   ```{r}
   library(thematic)
   library(rfontbridge) 
   font_add_system_family("Latin Modern Roman")
   thematic_rmd(font = font_spec(families="Latin Modern Roman", install=FALSE))
   ```
  ~~~
  
