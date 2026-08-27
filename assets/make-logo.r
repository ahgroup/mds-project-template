###############################
# logo-generation script
#
# Purpose:
#   Create the project logo/icon for the MDS project template. The logo is a
#   hexagon "sticker" in the style commonly used for R projects. It shows the
#   project name and a small four-step workflow (data -> code -> results ->
#   products) that mirrors the folder structure of this template.
#
#   The logo is a static asset rather than an analysis result, so it lives in
#   assets/ and not in results/. It is regenerated only when the design changes.
#
# Inputs:
#   none (the logo is drawn from the parameters defined below)
#
# Outputs:
#   assets/logo.png        (1200 px wide, transparent background, main version)
#   assets/logo-small.png  (300 px wide, for thumbnails and web listings)
#   assets/logo.svg        (vector version, for scaling to any size)
#
# How to run:
#   Rscript assets/make-logo.r
#
# Notes:
#   Only base R graphics packages are used (grid, grDevices), so no extra
#   packages need to be installed. The `here` package is used for paths, as
#   everywhere else in this template.
###############################

library(here) # for project-relative paths
library(grid) # for the low-level drawing primitives used below

## ---- checks --------
# The PNG and SVG devices below are cairo based. Fail early with a clear message
# rather than writing a broken or empty file if this R build lacks cairo.
if (!capabilities("cairo")) {
  stop("This R installation was built without cairo support, ",
       "so the logo devices are not available.")
}

output_folder <- here::here("assets")
if (!dir.exists(output_folder)) {
  stop("Output folder not found at:\n  ", output_folder)
}

## ---- design-parameters --------
# Colors are chosen to match the other project logos on
# https://www.andreashandel.com/projects.html: a navy hexagon border, a warm
# neutral fill, and muted accent colors for the workflow boxes.
col_border   <- "#282560" # navy hexagon outline
col_fill     <- "#D6C7BC" # warm neutral hexagon fill
col_text     <- "#1A1A1A" # near-black for the project name
col_arrow    <- "#1C7080" # teal for the workflow arrows
col_data     <- "#A22833" # dark red   -> data/
col_code     <- "#C4622D" # orange     -> code/
col_results  <- "#D3A44E" # gold       -> results/
col_products <- "#4B6B3C" # olive      -> products/

# The hexagon has radius 1 and is drawn "pointy" left and right, with flat top
# and bottom edges, matching the other logos. All coordinates below are in these
# hexagon-radius units: x runs from -1 to 1, y from -sqrt(3)/2 to sqrt(3)/2.
hex_radius <- 1
hex_height <- sqrt(3) / 2 # half-height of the hexagon, about 0.866

# Device size in inches. Font sizes and line widths are given in points, so
# keeping the physical size fixed and only varying the resolution guarantees
# that every exported version looks identical apart from its pixel count.
device_width_in  <- 6
device_height_in <- device_width_in * hex_height / hex_radius

## ---- helper-functions --------
# Corner coordinates of the hexagon. Angles of 0, 60, ..., 300 degrees put
# vertices at the left and right points and give flat top and bottom edges.
hex_corners <- function(radius = hex_radius) {
  angles <- seq(0, 300, by = 60) * pi / 180
  list(x = radius * cos(angles), y = radius * sin(angles))
}

# Horizontal half-width of the hexagon at a given height y. Used to check that
# text and boxes stay inside the sloped upper and lower edges.
hex_half_width <- function(y, radius = hex_radius) {
  radius - 0.5 * abs(y) / hex_height * radius
}

# One workflow box: a rounded rectangle with a short label. The label color is
# passed in because the light gold box needs dark text while the others need
# white text.
draw_box <- function(x, y, width, height, fill, label, label_col = "white",
                     label_size = 13) {
  grid::grid.roundrect(
    x = x, y = y, width = width, height = height,
    r = grid::unit(0.06, "npc"), default.units = "native",
    gp = grid::gpar(fill = fill, col = NA)
  )
  grid::grid.text(
    label, x = x, y = y, default.units = "native",
    gp = grid::gpar(col = label_col, fontsize = label_size, fontface = "bold")
  )
}

# One workflow arrow between two points, drawn in the accent color.
draw_arrow <- function(x0, y0, x1, y1) {
  grid::grid.lines(
    x = c(x0, x1), y = c(y0, y1), default.units = "native",
    arrow = grid::arrow(length = grid::unit(0.16, "inches"),
                        type = "closed", angle = 25),
    gp = grid::gpar(col = col_arrow, fill = col_arrow, lwd = 6, lineend = "butt")
  )
}

## ---- the-logo --------
# Draw the complete logo into whatever graphics device is currently open. The
# viewport maps the hexagon-radius coordinate system onto the device, with a
# small margin so the border stroke is not clipped at the left and right points.
draw_logo <- function() {
  margin <- 1.04
  grid::pushViewport(grid::viewport(
    xscale = c(-margin, margin) * hex_radius,
    yscale = c(-margin, margin) * hex_height
  ))

  # hexagon background and border
  corners <- hex_corners()
  grid::grid.polygon(
    x = corners$x, y = corners$y, default.units = "native",
    gp = grid::gpar(fill = col_fill, col = col_border, lwd = 9,
                    linejoin = "mitre")
  )

  # project name: a large "MDS" with a smaller descriptive line underneath
  grid::grid.text(
    "MDS", x = 0, y = 0.60, default.units = "native",
    gp = grid::gpar(col = col_text, fontsize = 52, fontface = "bold")
  )
  grid::grid.text(
    "PROJECT TEMPLATE", x = 0, y = 0.40, default.units = "native",
    gp = grid::gpar(col = col_text, fontsize = 17, fontface = "bold")
  )

  # Workflow: three boxes in a row, then products below. This is the core loop
  # of the template, so it is the part of the logo that carries the meaning.
  box_w <- 0.44
  box_h <- 0.30
  row_y <- 0.08          # vertical center of the top row of boxes
  bottom_y <- -0.50      # vertical center of the products box
  row_x <- c(-0.63, 0, 0.63)

  # The top row must fit inside the sloped hexagon edges at its outer corners.
  if (max(abs(row_x)) + box_w / 2 > hex_half_width(row_y + box_h / 2)) {
    stop("The workflow boxes stick out of the hexagon. Adjust box_w or row_x.")
  }

  draw_box(row_x[1], row_y, box_w, box_h, col_data, "data")
  draw_box(row_x[2], row_y, box_w, box_h, col_code, "code")
  draw_box(row_x[3], row_y, box_w, box_h, col_results, "results",
           label_col = col_text)
  draw_box(0, bottom_y, 0.72, box_h, col_products, "products")

  # arrows: data -> code -> results, then results down to products
  gap <- 0.04 # small gap so arrows do not touch the boxes
  draw_arrow(row_x[1] + box_w / 2 + gap, row_y, row_x[2] - box_w / 2 - gap, row_y)
  draw_arrow(row_x[2] + box_w / 2 + gap, row_y, row_x[3] - box_w / 2 - gap, row_y)
  draw_arrow(row_x[3] - 0.04, row_y - box_h / 2 - gap, 0.30, bottom_y + box_h / 2 + gap)

  grid::popViewport()
}

## ---- write-files --------
# The PNG versions differ only in resolution: 200 dpi for the main file and
# 50 dpi for the small thumbnail version.
png_file <- file.path(output_folder, "logo.png")
grDevices::png(png_file, width = device_width_in, height = device_height_in,
               units = "in", res = 200, bg = "transparent", type = "cairo")
draw_logo()
grDevices::dev.off()

png_small_file <- file.path(output_folder, "logo-small.png")
grDevices::png(png_small_file, width = device_width_in,
               height = device_height_in, units = "in", res = 50,
               bg = "transparent", type = "cairo")
draw_logo()
grDevices::dev.off()

svg_file <- file.path(output_folder, "logo.svg")
grDevices::svg(svg_file, width = device_width_in, height = device_height_in,
               bg = "transparent")
draw_logo()
grDevices::dev.off()

# Confirm that all three files were actually written before reporting success.
created_files <- c(png_file, png_small_file, svg_file)
if (!all(file.exists(created_files))) {
  stop("One or more logo files were not created:\n  ",
       paste(created_files[!file.exists(created_files)], collapse = "\n  "))
}

message("Logo files written:\n  ", paste(created_files, collapse = "\n  "))
