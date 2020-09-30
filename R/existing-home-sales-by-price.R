library(magrittr)

dat <- pamngr::join_sheets(c("ehslu100", 
                             "ehslu250",
                             "ehslu500",
                             "ehslu750", 
                             "ehslu1m", 
                             "ehslu1mp")) %>%
  dplyr::slice_max(dates, n = 60) %>%
  magrittr::set_colnames(c("dates", 
                           "1. $0 - $100k", 
                           "2. $100k - $250k",
                           "3. $250k - $500k",
                           "4. $500k - $750k",
                           "5. $750k - $1m",
                           "6. $1m+")) %>%
  tidyr::pivot_longer(cols = -dates, names_to = "variable")

p <- dat %>%
  pamngr::barplot() %>%
  pamngr::pam_plot(
    plot_title = "US Existing Home Sales",
    plot_subtitle = "YoY Percent Change",
    show_legend = FALSE
  )

p <- p + ggplot2::facet_wrap(. ~ variable, ncol = 3)

p %>% pamngr::all_output("existing-home-sales-by-price")