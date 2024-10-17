library(tidyverse)
library(janitor)

#setwd("C:/Users/Windows 10/Desktop/Facultad de Ciencias/Semestre 2025-1/polarizacion_extension_redes-experiment-table.csv")

data <- read.csv("C:\\Users\\Windows 10\\Desktop\\Facultad de Ciencias\\Semestre 2025-1\\Proyecto I\\polarizacion_extension_redes-experiment-table.csv", skip = 6) |>
  janitor::clean_names()

str(data)

data |>
  filter(x_step == max(data$x_step)) |>
  ggplot(aes(x = gamma, y = psi)) + 
  geom_point(alpha = 0.20) +
  facet_grid( . ~ tipo_red, labeller = label_bquote(col == .(tipo_red))) +
  labs(x = expression(gamma), y = expression(Psi)) +
  scale_x_continuous(breaks = seq(min(data$gamma), max(data$gamma), by = 0.2))

ggsave("tipos_de_red.png")
