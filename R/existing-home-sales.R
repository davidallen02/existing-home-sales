library(magrittr)

dat <- pamngr::get_data("etsltotl") %>%
  dplyr::slice_max(dates, n = 60) %>%
  tidyr::pivot_longer(cols= -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "US Existing Home Sales",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )
  
p %>% pamngr::all_output("existing-home-sales")