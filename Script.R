library(ggplot)
library(dplyr)
library(plyr)
library(readxl)
df <- read_excel("worldbank.xlsx")
df1 <- df %>% group_by(`Country Name`,`Series Name`)
df1$count <- apply(df1,1,function(x) length(which(x==".." | x==0)))
df2 <- subset(df1, df1$count == 59) 
df2 <- arrange(df2, df2$`Country Name`)
count <- df2 %>% group_by(df2$`Country Name`) %>% summarise(count = n())
new <- filter(df1, df1$`Country Name`== 'Costa Rica')
df3 <- subset(df1, !(df1$count >= 40))
write.csv(df3,"Cleaned_set1.csv")

df4 <- unique(df3$`Series Name`)

write.csv(df4,"names.csv")

health<-c("Children (0-14) living with HIV",				
  "Death rate, crude (per 1,000 people)",				
  "Fertility rate, total (births per woman)",				
  "Immunization, DPT (% of children ages 12-23 months)",				
  "Immunization, HepB3 (% of one-year-old children)",				
  "Immunization, measles (% of children ages 12-23 months)",				
  "Incidence of HIV (% of uninfected population ages 15-49)",			
  "Newborns protected against tetanus (%)",				
  "Number of infant deaths",				
  "Number of maternal deaths",				
  "Number of neonatal deaths")
health_data <- filter(df3,`Series Name` %in% health)
health_data


economy <- c('Access to electricity (% of population)',
              'Adjusted net national income (current US$)',
              'Adjusted savings: education expenditure (current US$)',
              'Adjusted savings: energy depletion (% of GNI)',
              'Adjusted savings: net forest depletion (current US$)',
              'Adjusted savings: net national savings (current US$)',
              'Depth of the food deficit (kilocalories per person per day)',
              'GDP (current US$)',
              'GDP per capita, PPP (current international $)',
              'Investment in water and sanitation with private participation (current US$))')
economy_data <- filter(df3,`Series Name` %in% economy)

Access <- c('Access to electricity (% of population)',
            'Access to electricity, rural (% of rural population)',
            'Individuals using the Internet (% of population)',
            'Mobile cellular subscriptions',
            'School enrollment, primary (% net)',
            'Secondary education, teachers)')
access_data <- filter(df3,`Series Name` %in% access)

education <- c('Adjusted savings: education expenditure (current US$)')
education_data <- filter(df3,`Series Name` %in% education)

environment <- c('Access to electricity (% of population)',
                 'CO2 emissions (metric tons per capita)',
                 'CO2 emissions from solid fuel consumption (% of total)',
                 'Combustible renewables and waste (% of total energy)',
                 'Fossil fuel energy consumption (% of total)',
                 'Total greenhouse gas emissions (kt of CO2 equivalent)',
                 'Total reserves (includes gold, current US$))')
environment_data <- filter(df3,`Series Name` %in% environment)


others <- c('Population, total',
            'Sex ratio at birth (male births per female births))')
others_data <- filter(df3,`Series Name` %in% others)

