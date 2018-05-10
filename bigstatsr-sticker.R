library(ggplot2)
library(hexSticker)

img <- magick::image_read("caution-crop.jpg")
g <- grid <- rasterGrob(img)

p <- ggplot() + 
  annotation_custom(g, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) +
  theme_void()

s <- sticker(p,
  package = "bigstatsr", p_color = "#0bb70e",
  h_fill = "#ffff00ff", p_family = "wqy-microhei",
  p_size = 80, h_color = "#0bb70e", h_size = 6,
  p_y = 1.35,
  s_x = 1, s_y = 0.75, s_width = 1, s_height = 0.8,
  url = "https://github.com/privefl/bigstatsr", u_size = 13
)

plot(s)

width <- 1500
ratio <- 2.01 / 1.73
ggsave("bigstatsr.png",
  scale = 1 / 300, width = width, height = width * ratio, bg = "transparent"
)
