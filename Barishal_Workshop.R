library(tidyverse) # import library tidyverse and load dplyr and other
library(haven)
library(dslabs)


data(gapminder)

write.csv(gapminder, "gapminder.csv")

#inspect data
head(gapminder)
tail(gapminder)
colnames(gapminder)


data(bems)

colnames(bems)

bems <- read_dta("bems_panel.dta")
bems <- as_factor(bems)

write.csv(bems, "bems.csv")


colnames(bems)

#dplyr for data wrangling
#what was infant mortality in BD in 2000?

gapminder %>% 
  filter(country == "Bangladesh", year == 2000) %>%
  select(infant_mortality)

gapminder %>%
  filter(country == "Bangladesh", year == 2005) %>%
  select(infant_mortality)


#summarize function
#how has GDP in Bangladesh over time?
gapminder %>% 
  filter(country == "Bangladesh") %>%
  select(year, gdp) %>%
  summarize(avg_gdp = mean(gdp, na.rm = T),
            max_gdp = max(gdp, na.rm = T))


#look at BEMS data
glimpse(bems)


#mutate creates new columns
#create a new variable called "total_mig"
bems <- bems %>%
  mutate(total_mig = bdmig + indiamig + intlmig)
colnames(bems)

bems %>%
  filter(div == "Barisal") %>%
  group_by(dist) %>%
  summarize(av_total_mig = mean(total_mig))


bems %>%filter(div == "Barisal") %>%
  group_by(dist) %>%
  summarize(av_total_mig = mean(total_mig))

write.csv(results, "district_migration.csv")


bems %>%
  ggplot()+
  geom_smooth(aes(x = dep_ratio, y = bdmig))
  

