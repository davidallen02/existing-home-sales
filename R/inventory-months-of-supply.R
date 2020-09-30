library(magrittr)

dat <- pamngr::get_data("ehslmssa") %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::lineplot() %>%
  pamngr::pam_plot(
    plot_title = "Existing Homes for Sale",
    plot_subtitle = "Months of Sales at Current Sales Pace",
    show_legend = FALSE
  )

p %>% pamngr::all_output("existing-homes-inventory-months-of-supply")