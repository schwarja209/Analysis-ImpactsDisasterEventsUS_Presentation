# Health Impacts and Economic Costs of Disaster Events in the US
Jacob Schwartz  
September 15, 2017  

## Overview

This project is an exploration of the U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database. This database tracks characteristics of major storms and weather events in the United States, including when and where they occur, as well as estimates of any fatalities, injuries, and property or crop damage. NOAA has maintained this database of storm events since 1950. 

## Questions
**This analysis will investigate the costs and human impact of these disaster events. We endeavor to answer the questions:**

**1. Across the United States, which types of events are most harmful with respect to population health?**

**2. Across the United States, which types of events have the greatest economic consequences?**

## Additional Info
Although the data goes as far back as 1950, it wasn't until 1996 that NOAA created a list of 48 standardized event types. Events prior to 1996 were classed into fewer types, and even after 1996 many reports of storm events do not stick to the official list of events. For the purposes of this analysis, we observe the data both in total and with the data post 1995 separated out, and determine which, if either, is more suited to answer our questions.

The method used to clean and sort the data from NOAA can be found [here](http://rpubs.com/schwarja209/ReproducibleResearch_Assign2).

## Average Impact/Cost

Our first approach was to look at the average human impacts (from fatalities and injuries combined) and average economic costs (from both property and crop damage). This approach is shown in the graphs on slide 7.

- The first graph clearly shows that, on average, **tsunamis** are the most harmful disaster events, with respect to population health. However, the next three most harmful disasters (which all have fairly similar effects on average) are **hurricanes**, **excessive heat** and just **heat**. So one could say that heat in general is collectively more harmful to population health than even tsunamis.

## Average Impact/Cost cont.

- The second graph is slightly less clear, as it is a scaled graph of log10(cost). With this in mind, however, it quickly becomes evident that, on average, **hurricanes** have costs that are literal orders of magnitude higher than other disaster events. That being said, **storm surges** are not too too far behind. One thing to note, though, is that storm surges generally accompany hurricanes. So in reality the top two disasters on this graph are essentially one and the same, and their economic consequences are simply amplified further.

## Average Impact/Cost Graphed

Go [here](http://rpubs.com/schwarja209/US_Disaster_Impacts) for presentation with interactive graphs.

## Absolute Impact/Cost

Our second approach was to look at the total human impacts (from fatalities and injuries) and total economic costs (from property and crop damage). This approach is shown in the graphs on slides 9 and 11 respectively.

- In terms of population health, **tornados** have clearly caused by far the most harm. However, from the stacked figure, it appears that **excessive heat** has actually caused slightly more fatalities. Also of note is the fact that, here, tsunamis aren't even on the list, in contrast to the average impact. This is likely due to tsunamis being a rare occurence in the US, as opposed to tornados which happen quite frequently.

## Absolute Human Impact

Go [here](http://rpubs.com/schwarja209/US_Disaster_Impacts) for presentation with interactive graphs.

## Absolute Impact/Cost cont.

- As for economic consequences, this time **floods** cost the US the most by a long shot (the y axis is in terms of billions of dollars). In this case, though, **hurricanes** (which had the highest average costs) do at least come in second, at about half the total cost of floods. This is again likely do to the frequency of floods versus hurricanes. One other very notable item is that **draughts** are far an away the most costly disasters in terms of crop damage, as can be seen from the stacked bar on the left in the following graph. In fact, while property damage is clearly quite a bit more costly than crop damage generally, the amount of crop damage caused by draughts makes it chart at high property damage levels.

## Absolute Property Cost

Go [here](http://rpubs.com/schwarja209/US_Disaster_Impacts) for presentation with interactive graphs.

## Overall Assessment

**Overall, we can probably state that excessive heat is the most dangerous disaster for population health, as it's present in the top 3 for *both* the average and the absolute approaches. Similarly we can safely say that hurricanes have the greatest economic consequences from a general standpoint.**

## Additional Notes

It would not be wise to put too much weight on this analysis. Though we captured more than 99% of the values recorded, it is still limited in many ways.

- For one thing, the recording of event types is extremely imprecise, and therefore some of our re-working of the `EVTYPE` data may have been faulty (details [here](http://rpubs.com/schwarja209/ReproducibleResearch_Assign2)). And considering the level of disarray of this variable, there are no doubt many other errors that we didn't see in this brief exercise. The improper coding of even just one crop or property damage exponent from a K or M to a B would throw out the entire analysis. Additionally, it is possible that one of the very few event types we ignored was a single record with *huge* human or economic impacts. Such an occurence could severely skew our results.

## Additional Notes cont.

- Another thing that would be worth considering is inflation adjusted figures in the economic analysis. Or we could observe the data year by year, to see the effects of climate change on natural disasters over time.

- Speaking of climate, it could be more useful to look at the results on a region by region or state by state basis, since the types of events in any particular region are heavily influenced by geography. The original storm dataset from NOAA has many additional variables to help with this kind of mapping.

Suffice it to say that while we can draw broad conclusions from our analysis, this is only a first step in really answering our core questions about natural disasters in the United State.

## Appendix

This analysis and these graphs were created on a computer with the following system running:

```
R version 3.4.1 (2017-06-30)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 15063)

Matrix products: default

locale:
[1] LC_COLLATE=English_United States.1252 
[2] LC_CTYPE=English_United States.1252   
[3] LC_MONETARY=English_United States.1252
[4] LC_NUMERIC=C                          
[5] LC_TIME=English_United States.1252    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] bindrcpp_0.2   plotly_4.7.1   gridExtra_2.3  ggplot2_2.2.1 
[5] reshape2_1.4.2 dplyr_0.7.3    plyr_1.8.4    

loaded via a namespace (and not attached):
 [1] Rcpp_0.12.12       RColorBrewer_1.1-2 compiler_3.4.1    
 [4] bindr_0.1          tools_3.4.1        digest_0.6.12     
 [7] jsonlite_1.5       evaluate_0.10.1    tibble_1.3.4      
[10] gtable_0.2.0       viridisLite_0.2.0  pkgconfig_2.0.1   
[13] rlang_0.1.2        shiny_1.0.5        crosstalk_1.0.0   
[16] yaml_2.1.14        stringr_1.2.0      httr_1.3.1        
[19] knitr_1.17         htmlwidgets_0.9    rprojroot_1.2     
[22] grid_3.4.1         glue_1.1.1         data.table_1.10.4 
[25] R6_2.2.2           rmarkdown_1.6      purrr_0.2.3       
[28] tidyr_0.7.1        magrittr_1.5       backports_1.1.1   
[31] scales_0.5.0       codetools_0.2-15   htmltools_0.3.6   
[34] assertthat_0.2.0   xtable_1.8-2       mime_0.5          
[37] colorspace_1.3-2   httpuv_1.3.5       stringi_1.1.5     
[40] lazyeval_0.2.0     munsell_0.4.3     
```
