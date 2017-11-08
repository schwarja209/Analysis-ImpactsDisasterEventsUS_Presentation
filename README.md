# Health Impacts and Economic Costs of Disaster Events in the US
Jacob Schwartz  
September 15, 2017  
<style type="text/css">
body,td{font-size: 14px;}
code.r{font-size: 10px; line-height: 1.5; columns: 2; -webkit-columns: 2; -moz-columns: 2}
pre{font-size: 10px; line-height: 1.5; columns: 2; -webkit-columns: 2; -moz-columns: 2}
</style>





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

<!--html_preserve--><div id="3f901dae5ac0" style="width:816px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="3f901dae5ac0">{"x":{"data":[{"x":["tsunami","hurricanetyphoon","excessiveheat","heat","tornado","ripcurrent","duststorm","icestorm","avalanche","marinestrongwind","tropicalstorm","densefog","wildfire","lightning","highsurf","blizzard","dustdevil","extremecoldwindchill","flood","coldwindchill"],"y":[8.1,4.90969899665552,4.38923395445135,3.57951219512195,1.59875424315328,1.42342342342342,1.07692307692308,1.02837232453957,1.02072538860104,0.75,0.644189383070301,0.632096069868996,0.400850862680217,0.383673728276037,0.345094664371773,0.33198973983144,0.3,0.298783712321523,0.246256018595384,0.196330275229358],"name":"Health Impacts","type":"bar","marker":{"fillcolor":"rgba(34,139,34,1)","color":"rgba(34,139,34,1)","line":{"color":"transparent"}},"xaxis":"x","yaxis":"y","frame":null},{"x":["hurricanetyphoon","stormsurgetide","tropicalstorm","tsunami","drought","flood","icestorm","wildfire","tornado","frostfreeze"],"y":[8.48276142070823,8.06920638326685,7.08152637340245,6.85757973262428,6.77851800803975,6.72864039227642,6.64966923617545,6.32267095217047,5.98753976743845,5.91502824683221],"name":"log10(Cost ($))","type":"bar","marker":{"fillcolor":"rgba(255,48,48,1)","color":"rgba(255,48,48,1)","line":{"color":"transparent"}},"xaxis":"x2","yaxis":"y2","frame":null}],"layout":{"xaxis":{"domain":[0,0.45],"autotick":false,"type":"category","categoryorder":"array","categoryarray":["avalanche","blizzard","coldwindchill","densefog","dustdevil","duststorm","excessiveheat","extremecoldwindchill","flood","heat","highsurf","hurricanetyphoon","icestorm","lightning","marinestrongwind","ripcurrent","tornado","tropicalstorm","tsunami","wildfire"],"anchor":"y"},"xaxis2":{"domain":[0.55,1],"type":"category","categoryorder":"array","categoryarray":["drought","flood","frostfreeze","hurricanetyphoon","icestorm","stormsurgetide","tornado","tropicalstorm","tsunami","wildfire"],"anchor":"y2"},"yaxis2":{"domain":[0,1],"title":"Top 10 Natural Disasters by Avg Economic Cost","anchor":"x2"},"yaxis":{"domain":[0,1],"title":"Top 20 Natural Disasters by Avg Health Impact","anchor":"x"},"margin":{"b":110,"l":60,"t":25,"r":10},"hovermode":"closest","showlegend":true},"attrs":{"3f90368c4708":{"x":{},"y":{},"name":{},"color":["forestgreen"],"alpha":1,"sizes":[10,100],"type":"bar"},"3f905fcd7790":{"x":{},"y":{},"name":{},"color":["firebrick1"],"alpha":1,"sizes":[10,100],"type":"bar"}},"source":"A","config":{"modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"subplot":true,"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->

## Absolute Impact/Cost

Our second approach was to look at the total human impacts (from fatalities and injuries) and total economic costs (from property and crop damage). This approach is shown in the graphs on slides 9 and 11 respectively.

- In terms of population health, **tornados** have clearly caused by far the most harm. However, from the stacked figure, it appears that **excessive heat** has actually caused slightly more fatalities. Also of note is the fact that, here, tsunamis aren't even on the list, in contrast to the average impact. This is likely due to tsunamis being a rare occurence in the US, as opposed to tornados which happen quite frequently.

## Absolute Human Impact

<!--html_preserve--><div id="3f9060df608" style="width:816px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="3f9060df608">{"x":{"visdat":{"3f90430a2f4d":["function () ","plotlyVisDat"]},"cur_data":"3f90430a2f4d","attrs":{"3f90430a2f4d":{"x":{},"y":{},"color":{},"alpha":1,"sizes":[10,100],"type":"bar"}},"layout":{"margin":{"b":80,"l":60,"t":25,"r":10},"barmode":"stack","xaxis":{"domain":[0,1],"title":"","type":"category","categoryorder":"array","categoryarray":["blizzard","densefog","excessiveheat","flashflood","flood","hail","heat","heavysnow","highwind","hurricanetyphoon","icestorm","lightning","ripcurrent","strongwind","thunderstormwind","tornado","tropicalstorm","wildfire","winterstorm","winterweather"]},"yaxis":{"domain":[0,1],"title":"Count of Impacts"},"title":"Top 20 Natural Disasters in US by Total Human Impact since 1996","hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"data":[{"x":["excessiveheat","tornado","flashflood","lightning","ripcurrent","flood","thunderstormwind","highwind","heat","winterstorm","strongwind","hurricanetyphoon","heavysnow","wildfire","icestorm","blizzard","densefog","winterweather","tropicalstorm","hail"],"y":[1799,1511,887,651,542,444,379,238,237,193,129,125,113,87,82,70,69,61,57,7],"type":"bar","name":"Fatalitities","marker":{"fillcolor":"rgba(102,194,165,0.5)","color":"rgba(102,194,165,1)","line":{"color":"transparent"}},"xaxis":"x","yaxis":"y","frame":null},{"x":["tornado","flood","excessiveheat","thunderstormwind","lightning","flashflood","wildfire","winterstorm","hurricanetyphoon","heat","highwind","densefog","heavysnow","hail","ripcurrent","winterweather","blizzard","strongwind","tropicalstorm","icestorm"],"y":[20667,6838,6391,5129,4141,1674,1456,1371,1328,1309,1108,855,747,713,503,483,385,383,338,318],"type":"bar","name":"Injuries","marker":{"fillcolor":"rgba(141,160,203,0.5)","color":"rgba(141,160,203,1)","line":{"color":"transparent"}},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->

## Absolute Impact/Cost cont.

- As for economic consequences, this time **floods** cost the US the most by a long shot (the y axis is in terms of billions of dollars). In this case, though, **hurricanes** (which had the highest average costs) do at least come in second, at about half the total cost of floods. This is again likely do to the frequency of floods versus hurricanes. One other very notable item is that **draughts** are far an away the most costly disasters in terms of crop damage, as can be seen from the stacked bar on the left in the following graph. In fact, while property damage is clearly quite a bit more costly than crop damage generally, the amount of crop damage caused by draughts makes it chart at high property damage levels.

## Absolute Property Cost

<!--html_preserve--><div id="3f9036b34d4f" style="width:816px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="3f9036b34d4f">{"x":{"visdat":{"3f9032d24d1":["function () ","plotlyVisDat"]},"cur_data":"3f9032d24d1","attrs":{"3f9032d24d1":{"x":{},"y":{},"color":{},"alpha":1,"sizes":[10,100],"type":"bar"}},"layout":{"margin":{"b":80,"l":60,"t":25,"r":10},"barmode":"stack","xaxis":{"domain":[0,1],"title":"","type":"category","categoryorder":"array","categoryarray":["drought","flashflood","flood","hail","hurricanetyphoon","stormsurgetide","thunderstormwind","tornado","tropicalstorm","wildfire"]},"yaxis":{"domain":[0,1],"title":"Cost (billion $)"},"title":"Top 10 Natural Disasters in US by Total Economic Cost since 1996","hovermode":"closest","showlegend":true},"source":"A","config":{"modeBarButtonsToAdd":[{"name":"Collaborate","icon":{"width":1000,"ascent":500,"descent":-50,"path":"M487 375c7-10 9-23 5-36l-79-259c-3-12-11-23-22-31-11-8-22-12-35-12l-263 0c-15 0-29 5-43 15-13 10-23 23-28 37-5 13-5 25-1 37 0 0 0 3 1 7 1 5 1 8 1 11 0 2 0 4-1 6 0 3-1 5-1 6 1 2 2 4 3 6 1 2 2 4 4 6 2 3 4 5 5 7 5 7 9 16 13 26 4 10 7 19 9 26 0 2 0 5 0 9-1 4-1 6 0 8 0 2 2 5 4 8 3 3 5 5 5 7 4 6 8 15 12 26 4 11 7 19 7 26 1 1 0 4 0 9-1 4-1 7 0 8 1 2 3 5 6 8 4 4 6 6 6 7 4 5 8 13 13 24 4 11 7 20 7 28 1 1 0 4 0 7-1 3-1 6-1 7 0 2 1 4 3 6 1 1 3 4 5 6 2 3 3 5 5 6 1 2 3 5 4 9 2 3 3 7 5 10 1 3 2 6 4 10 2 4 4 7 6 9 2 3 4 5 7 7 3 2 7 3 11 3 3 0 8 0 13-1l0-1c7 2 12 2 14 2l218 0c14 0 25-5 32-16 8-10 10-23 6-37l-79-259c-7-22-13-37-20-43-7-7-19-10-37-10l-248 0c-5 0-9-2-11-5-2-3-2-7 0-12 4-13 18-20 41-20l264 0c5 0 10 2 16 5 5 3 8 6 10 11l85 282c2 5 2 10 2 17 7-3 13-7 17-13z m-304 0c-1-3-1-5 0-7 1-1 3-2 6-2l174 0c2 0 4 1 7 2 2 2 4 4 5 7l6 18c0 3 0 5-1 7-1 1-3 2-6 2l-173 0c-3 0-5-1-8-2-2-2-4-4-4-7z m-24-73c-1-3-1-5 0-7 2-2 3-2 6-2l174 0c2 0 5 0 7 2 3 2 4 4 5 7l6 18c1 2 0 5-1 6-1 2-3 3-5 3l-174 0c-3 0-5-1-7-3-3-1-4-4-5-6z"},"click":"function(gd) { \n        // is this being viewed in RStudio?\n        if (location.search == '?viewer_pane=1') {\n          alert('To learn about plotly for collaboration, visit:\\n https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html');\n        } else {\n          window.open('https://cpsievert.github.io/plotly_book/plot-ly-for-collaboration.html', '_blank');\n        }\n      }"}],"cloud":false},"data":[{"x":["flood","hurricanetyphoon","stormsurgetide","tornado","flashflood","hail","thunderstormwind","wildfire","tropicalstorm","drought"],"y":[144.1295902,81.71888901,47.834724,24.61694571,15.22225891,14.59514342,7.91355588,7.7604495,7.64247555,1.046101],"type":"bar","name":"Property","marker":{"fillcolor":"rgba(102,194,165,0.5)","color":"rgba(102,194,165,1)","line":{"color":"transparent"}},"xaxis":"x","yaxis":"y","frame":null},{"x":["drought","hurricanetyphoon","flood","hail","flashflood","thunderstormwind","tropicalstorm","wildfire","tornado","stormsurgetide"],"y":[13.367566,5.3501078,5.0131615,2.47602945,1.3349017,1.0169426,0.677711,0.40225513,0.28342501,0.000855],"type":"bar","name":"Crop","marker":{"fillcolor":"rgba(141,160,203,0.5)","color":"rgba(141,160,203,1)","line":{"color":"transparent"}},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1}},"base_url":"https://plot.ly"},"evals":["config.modeBarButtonsToAdd.0.click"],"jsHooks":{"render":[{"code":"function(el, x) { var ctConfig = crosstalk.var('plotlyCrosstalkOpts').set({\"on\":\"plotly_click\",\"persistent\":false,\"dynamic\":false,\"selectize\":false,\"opacityDim\":0.2,\"selected\":{\"opacity\":1}}); }","data":null}]}}</script><!--/html_preserve-->

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
