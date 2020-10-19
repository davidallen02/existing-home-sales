library(magrittr)

dat <- pamngr::get_data("etslmp") %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable") %>%
  pamngr::pchange(k = 12) %>%
  dplyr::slice_max(dates, n = 60)

p <- dat %>%
  pamngr::lineplot() %>%
  pamngr::pam_plot(
    plot_title = "Existing Home Sales",
    plot_subtitle = "Median Home Price, Annual Percent Change",
    show_legend = FALSE
  )

p %>% pamngr::all_output("median-home-price-annual-pchange")


