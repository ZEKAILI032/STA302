library(opendatatoronto)
d <- search_packages("Fire Incidents") %>%
  list_package_resources() %>%
  slice(2) %>%
  get_resource() 
d