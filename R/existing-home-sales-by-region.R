library(magrittr)

dat <- pamngr::join_sheets(c("etslne", "etslmw", "etslso","etslwe")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  magrittr::set_colnames(c("dates", "Northeast", "Midwest", "South", "West")) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "US Exisiting Home Sales",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::facet_wrap(.~variable, ncol = 2)

p %>% pamngr::all_output("existing-home-sales-by-region")


# Northeast -------------------------------------------------------------------------

dat <- pamngr::get_data("etslne") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Northeast",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[2])

p %>% pamngr::all_output("existing-home-sales-northeast")


# Midwest ---------------------------------------------------------------------------

dat <- pamngr::get_data("etslmw") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "Midwest",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[3])

p %>% pamngr::all_output("existing-home-sales-midwest")


# South -----------------------------------------------------------------------------

dat <- pamngr::get_data("etslso") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "South",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[4])

p %>% pamngr::all_output("existing-home-sales-south")


# West ------------------------------------------------------------------------------

dat <- pamngr::get_data("etslwe") %>%
  dplyr::slice_max(dates, n = 12) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "West",
    plot_subtitle = "Millions, SAAR",
    show_legend = FALSE
  )

p <- p + ggplot2::scale_fill_manual(values = pamngr::pam.pal()[5])

p %>% pamngr::all_output("existing-home-sales-west")

