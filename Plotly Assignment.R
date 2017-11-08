library(plyr)
library(dplyr)
library(reshape2)
library(ggplot2)
library(gridExtra)
library(plotly)

download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2","StormData.csv.bz2")
StormData_RAW<-read.csv("StormData.csv.bz2") #download and load data
StormData<-StormData_RAW #store RAW data for reference

######################
# Cleaning Event Types
######################
EVTYPE_official<-c("astronomicallowtide","avalanche","blizzard","coastalflood","coldwindchill", #load official EVTYPE list
                   "debrisflow","densefog","densesmoke","drought","dustdevil","duststorm",   #for comparison
                   "excessiveheat","extremecoldwindchill","flashflood","flood","freezingfog",
                   "frostfreeze","funnelcloud","hail","heat","heavyrain","heavysnow","highsurf",
                   "highwind","hurricanetyphoon","icestorm","lakeeffectsnow","lakeshoreflood",
                   "lightning","marinehail","marinehighwind","marinestrongwind","marinethunderstormwind",
                   "ripcurrent","seiche","sleet","stormsurgetide","strongwind","thunderstormwind",
                   "tornado","tropicaldepression","tropicalstorm","tsunami","volcanicash",
                   "waterspout","wildfire","winterstorm","winterweather")

StormData$EVTYPE<-tolower(StormData$EVTYPE) #make EVTYPE lowercase to narrow down options
StormData$EVTYPE<-gsub("[^A-Za-z]","",StormData$EVTYPE) #remove all non alphabetic characters to narrow further
for(i in 1:length(EVTYPE_official)){ #sub in official EVTYPE for all EVTYPES that are similar
    StormData$EVTYPE<-gsub(paste0(EVTYPE_official[i],".*"),paste0(EVTYPE_official[i]),StormData$EVTYPE)
}

#use data documentation to fit top unofficialEVTYPES (and other similar ones) into official categories
StormData$EVTYPE<-gsub("marinetstm.*","marinethunderstormwind",StormData$EVTYPE)
StormData$EVTYPE<-gsub("tstm.*|thunder.*","thunderstormwind",StormData$EVTYPE)
StormData$EVTYPE<-gsub("urban.*|riverflood.*","flood",StormData$EVTYPE)
StormData$EVTYPE<-gsub("wild.*","wildfire",StormData$EVTYPE) #where we'd cut off with 1000 threshold 
StormData$EVTYPE<-gsub("extremecold$|extremewindchill.*|extendedcold.*","extremecoldwindchill",StormData$EVTYPE)
StormData$EVTYPE<-gsub("^snow.*","heavysnow",StormData$EVTYPE)
StormData$EVTYPE<-gsub("landslide.*|landslump.*","debrisflow",StormData$EVTYPE)
StormData$EVTYPE<-gsub("^fog.*","densefog",StormData$EVTYPE)
StormData$EVTYPE<-gsub("^wind.*","strongwind",StormData$EVTYPE)
StormData$EVTYPE<-gsub("stormsurge.*","stormsurgetide",StormData$EVTYPE)
StormData$EVTYPE<-gsub("freezingrain.*","sleet",StormData$EVTYPE)
StormData$EVTYPE<-gsub("heavysurf.*|.*hightide.*","highsurf",StormData$EVTYPE)
StormData$EVTYPE<-gsub("^drymicroburst.*","highwind",StormData$EVTYPE)
StormData$EVTYPE<-gsub("lightsnow.*|moderatesnow.*|wintrymix.*","winterstorm",StormData$EVTYPE)
StormData$EVTYPE<-gsub("^hurricane.*|^typhoon.*","hurricanetyphoon",StormData$EVTYPE)
StormData$EVTYPE<-gsub("recordw.*|recordh.*","excessiveheat",StormData$EVTYPE)
StormData$EVTYPE<-gsub("unseasonablyw.*|unseasonablyh.*|unusuallyw.*","heat",StormData$EVTYPE)

###################################
# Cleaning Property and Crop Damage
###################################
EXP<-function(x){ #create a function to translate PROPDMGEXP and CROPDMGEXP into usable integers
    if(x %in% 0:9) return(as.numeric(paste0("1e",x)))
    else if(x=="h"|x=="H") return(1e2) 
    else if(x=="k"|x=="K") return(1e3)
    else if(x=="m"|x=="M") return(1e6)
    else if(x=="b"|x=="B") return(1e9)
    else return(1)
}
StormData<-mutate(StormData,PROPDMGEXP=as.numeric(sapply(PROPDMGEXP,FUN=EXP)))%>%
    mutate(CROPDMGEXP=as.numeric(sapply(CROPDMGEXP,FUN=EXP))) #run all EXP data through the function

################
# Cleaning Dates
################
StormData$BGN_DATE<-as.Date(StormData$BGN_DATE,format="%m/%d/%Y") #convert dates to date format
StormData$END_DATE<-as.Date(StormData$END_DATE,format="%m/%d/%Y")

################
# Narrowing Data
################
StormData_Complete<-filter(StormData,EVTYPE %in% EVTYPE_official)%>% #narrow data to only official EVTYPES
    mutate(EVTYPE=as.factor(EVTYPE),PROPDMG=PROPDMG*PROPDMGEXP,CROPDMG=CROPDMG*CROPDMGEXP)%>% #condense damage costs
    select(STATE,EVTYPE,BGN_DATE,FATALITIES,INJURIES,PROPDMG,CROPDMG)%>% #narrow variables of interest
    group_by(EVTYPE) #set factors for later summarization

StormData_Modern<-filter(StormData_Complete,BGN_DATE>="1996-01-01")%>% #create separate data set
    group_by(EVTYPE)                                                   #for just post 1995 data

##################
# Summarizing Data
##################
StormData_Fatalities_Avg<-summarize(StormData_Complete,FATALITIES=mean(FATALITIES))%>%
    arrange(desc(FATALITIES)) #get average fatalities
StormData_Injuries_Avg<-summarize(StormData_Complete,INJURIES=mean(INJURIES))%>%
    arrange(desc(INJURIES)) #get average injuries
StormData_PropDMG_Avg<-summarize(StormData_Complete,PROPDMG=mean(PROPDMG))%>%
    arrange(desc(PROPDMG)) #get average property damage
StormData_CropDMG_Avg<-summarize(StormData_Complete,CROPDMG=mean(CROPDMG))%>%
    arrange(desc(CROPDMG)) #get average crop damage

# use modern data set for totals, so it's a fair comparison
StormData_Fatalities_Tot<-summarize(StormData_Modern,FATALITIES=sum(FATALITIES))%>%
    arrange(desc(FATALITIES)) #get total fatalities
StormData_Injuries_Tot<-summarize(StormData_Modern,INJURIES=sum(INJURIES))%>%
    arrange(desc(INJURIES)) #get total injuries
StormData_PropDMG_Tot<-summarize(StormData_Modern,PROPDMG=sum(PROPDMG))%>%
    arrange(desc(PROPDMG)) #get total property damage
StormData_CropDMG_Tot<-summarize(StormData_Modern,CROPDMG=sum(CROPDMG))%>%
    arrange(desc(CROPDMG)) #get total crop damage

print(head(StormData_Fatalities_Avg)) #take a look at the summary results
print(head(StormData_Fatalities_Tot)) 
print(head(StormData_Injuries_Avg)) #similar distributions of effects for fatalities and injuries
print(head(StormData_Injuries_Tot))
print(head(StormData_PropDMG_Avg))
print(head(StormData_PropDMG_Tot))
print(head(StormData_CropDMG_Avg)) #more prop dmg from droughts, more prop dmg from storm surges
print(head(StormData_CropDMG_Tot))

# Note: the difference in averages is much more extreme than the difference in totals
HumanImpact_Avg<-mutate(StormData_Complete,HealthImpacts=FATALITIES+INJURIES)%>% #condense summaries for emphasis
    summarize(HealthImpacts=mean(HealthImpacts))%>%rename(Disaster_Type=EVTYPE)%>% #make variable nicer for graph
    arrange(desc(HealthImpacts))
HumanImpact_Tot<-merge(StormData_Fatalities_Tot,StormData_Injuries_Tot,all=TRUE)%>%
    mutate(HealthImpacts=FATALITIES+INJURIES)%>%rename(Fatalitities=FATALITIES,Injuries=INJURIES)%>%
    arrange(desc(HealthImpacts))
EconomicCost_Avg<-mutate(StormData_Complete,TotalCost=PROPDMG+CROPDMG)%>%
    summarize(TotalCost=mean(TotalCost)/1000000000)%>%rename(Disaster_Type=EVTYPE)%>% #divide cost by a billion for scaling
    arrange(desc(TotalCost))
EconomicCost_Tot<-merge(StormData_PropDMG_Tot,StormData_CropDMG_Tot,all=TRUE)%>%
    mutate(TotalCost=(PROPDMG+CROPDMG)/1000000000,PROPDMG=PROPDMG/1000000000,CROPDMG=CROPDMG/1000000000)%>%
    rename(Property=PROPDMG,Crop=CROPDMG)%>%arrange(desc(TotalCost))

# What is a representative slice of each category?
EconomicCost_Avg<-mutate(StormData_Complete,TotalCost=PROPDMG+CROPDMG)%>% #use log10 instead for avg costs, due to extreme range
    summarize(TotalCost=log10(mean(TotalCost)))%>%rename(Disaster_Type=EVTYPE)%>%
    arrange(desc(TotalCost))

HumanImpactTot_Molten<-melt(HumanImpact_Tot[1:20,])%>%arrange(variable,desc(value)) #make type of impact/cost a factor
HumanImpactTot_Molten<-HumanImpactTot_Molten[1:40,]%>%rename(Types_of_Impact=variable)%>%droplevels() #remove total damage
EconomicCostTot_Molten<-melt(EconomicCost_Tot[1:10,])%>%arrange(variable,desc(value))
EconomicCostTot_Molten<-EconomicCostTot_Molten[1:20,]%>%rename(Types_of_Damage=variable)%>%droplevels()

##########
# Graphing
##########
p1<-plot_ly(data=droplevels(HumanImpact_Avg[1:20,]),x=~Disaster_Type,y=~HealthImpacts,type="bar",
            color=I("forestgreen"),name=~"Health Impacts")%>%
    layout(yaxis=list(title="Top 20 Natural Disasters by Avg Health Impact"))

p2<-plot_ly(data=droplevels(EconomicCost_Avg[1:10,]),x=~Disaster_Type,y=~TotalCost,type="bar",
            color=I("firebrick1"),name=~"log10(Cost ($))")%>%
    layout(yaxis=list(title="Top 10 Natural Disasters by Avg Economic Cost"))

pp<-subplot(p1,p2,titleY=TRUE,margin=0.05)#print first set of graphs together
print(pp)

p3<-plot_ly(data=HumanImpactTot_Molten,x=~EVTYPE,y=~value,type="bar",color=~Types_of_Impact)%>%
    layout(barmode="stack",xaxis=list(title="Event Type"),yaxis=list(title="Count of Impacts"),
           title="Top 20 Natural Disasters in US by Total Human Impact since 1996")

p4<-plot_ly(data=EconomicCostTot_Molten,x=~EVTYPE,y=~value,type="bar",color=~Types_of_Damage)%>%
    layout(barmode="stack",xaxis=list(title="Event Type"),yaxis=list(title="Cost (billion $)"),
           title="Top 10 Natural Disasters in US by Total Economic Cost since 1996")

print(p3) #print second set of graphs separately
print(p4)