

plotly_count_linechart_target <- function(data, x, y, x_lab, y_lab) {
  require(ggplot2)
  ggplot() +
    geom_line(data = pdata, aes(x = x, y = y,
                        color = "red")) +
  geom_line(size = 1) +
  labs(x = x_lab, y = y_lab) +
  #scale_y_continuous(limits = c(0, max(plotly_df$y))) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  theme(legend.key.size = unit(1, 'cm'), #change legend key size
        legend.key.height = unit(1, 'cm'), #change legend key height
        legend.text = element_text(size=8),
        legend.box.background = element_rect(fill = "blue",
                                             colour = "transparent"),
        legend.key = element_rect(fill = "transparent", colour = "transparent"),
        axis.ticks.y = ggplot2::element_blank(),
        axis.line = ggplot2::element_blank(),
        # grid line options
        panel.grid.minor = ggplot2::element_blank(),
        panel.grid.major.y = ggplot2::element_line(color = "#cbcbcb"),
        panel.grid.major.x = ggplot2::element_blank(),
        # background options
        panel.background = ggplot2::element_blank(),
        strip.background = ggplot2::element_rect(fill = "white"),
        strip.text = ggplot2::element_text(size  = 18,  hjust = 0))
}
