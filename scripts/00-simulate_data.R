library(tidyverse)
library(opendatatoronto)

d <- search_packages("Fire Incidents") %>%
  list_package_resources() %>%
  slice(2) %>%
  get_resource() 

newd <- d %>% 
  mutate(
    personnel = Number_of_responding_personnel,
    loss = Estimated_Dollar_Loss
  ) %>%  
  select(loss, 
         personnel) %>%   
  na.omit() %>%
  sample_n(df, 1000)


summary(newd) %>%
  knitr::kable(caption = "Statistical Summary")


p1 <- ggplot(newd,
             mapping = aes(x = personnel, 
                           y = loss)) + 
  geom_point(size = 3, alpha = 0.5) + 
  labs(title = "Toronto Fire Incidents",
       caption = "Figure 1")
p1


p2 <- ggplot(newd,
             mapping = aes(x = log(personnel), 
                           y = log(loss))) + 
  geom_point(size = 3, alpha = 0.5) + 
  labs(title = "Toronto Fire Incidents with Log Scale",
       caption = "Figure 2")
p2