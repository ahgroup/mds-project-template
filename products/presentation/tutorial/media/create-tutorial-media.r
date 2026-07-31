# Purpose:
#   Generate tutorial presentation diagrams for the MDS project template deck.
#
# Inputs:
#   None. Diagram content is defined below from the template documentation.
#
# Outputs:
#   PNG files in this media folder:
#   orderly-framework.png, template-concept.png, toolchain-map.png, folder-map.png,
#   code-stages.png, run-order.png, ai-working-loop.png
#
# How to run:
#   Rscript products/presentation/tutorial/media/create-tutorial-media.r
#
# Notes:
#   This script uses only base R and grid so it does not add package
#   dependencies to the template.

script_args <- commandArgs(trailingOnly = FALSE)
file_arg <- "--file="
script_path <- sub(file_arg, "", script_args[startsWith(script_args, file_arg)][1])
if (is.na(script_path)) {
  script_path <- "products/presentation/tutorial/media/create-tutorial-media.r"
}
media_dir <- dirname(normalizePath(script_path, winslash = "/", mustWork = FALSE))

library(grid)

colors <- list(
  blue = "#123c66",
  green = "#2a7f62",
  orange = "#b35c33",
  purple = "#5f56b3",
  slate = "#4e5b66",
  ink = "#26313c",
  muted = "#5b6772",
  line = "#cfd7e0",
  soft = "#f4f7f9",
  soft_blue = "#edf3f8",
  soft_green = "#edf6f2",
  soft_orange = "#fbf1eb",
  soft_purple = "#f3f1fb",
  soft_slate = "#edf3f6"
)

open_png <- function(filename) {
  png(
    filename = file.path(media_dir, filename),
    width = 1600,
    height = 900,
    units = "px",
    res = 125,
    bg = "white",
    pointsize = 12,
    type = "cairo"
  )
  grid.newpage()
  pushViewport(viewport(width = unit(1, "npc"), height = unit(1, "npc")))
}

close_png <- function() {
  popViewport()
  dev.off()
}

rect_box <- function(x, y, w, h, fill, border, lwd = 4) {
  grid.rect(
    x = unit(x, "npc"),
    y = unit(y, "npc"),
    width = unit(w, "npc"),
    height = unit(h, "npc"),
    gp = gpar(fill = fill, col = border, lwd = lwd)
  )
}

label <- function(text, x, y, size = 18, col = colors$ink, face = "plain", just = "centre") {
  grid.text(
    text,
    x = unit(x, "npc"),
    y = unit(y, "npc"),
    just = just,
    gp = gpar(fontsize = size, col = col, fontface = face, fontfamily = "sans")
  )
}

box_label <- function(x, y, w, h, title, lines = character(), fill, border,
                      title_col = border, title_size = 19, line_size = 13) {
  rect_box(x, y, w, h, fill, border)
  label(title, x, y + h * 0.22, title_size, title_col, "bold")
  if (length(lines) > 0) {
    line_gap <- if (length(lines) >= 3) 0.035 else 0.045
    start <- y + if (length(lines) >= 3) 0.015 else 0.01
    for (i in seq_along(lines)) {
      label(lines[i], x, start - (i - 1) * line_gap, line_size, colors$ink)
    }
  }
}

arrow_line <- function(x0, y0, x1, y1, col = "#9aa8b5", lwd = 3) {
  grid.segments(
    x0 = unit(x0, "npc"), y0 = unit(y0, "npc"),
    x1 = unit(x1, "npc"), y1 = unit(y1, "npc"),
    arrow = arrow(length = unit(0.18, "inches"), type = "closed"),
    gp = gpar(col = col, lwd = lwd, lineend = "round")
  )
}

curved_arrow <- function(x0, y0, x1, y1, curvature = 0.25, col = "#9aa8b5", lwd = 3) {
  grid.curve(
    x1 = unit(x0, "npc"), y1 = unit(y0, "npc"),
    x2 = unit(x1, "npc"), y2 = unit(y1, "npc"),
    curvature = curvature,
    arrow = arrow(length = unit(0.18, "inches"), type = "closed"),
    gp = gpar(col = col, lwd = lwd, lineend = "round")
  )
}

make_orderly_framework <- function() {
  open_png("orderly-framework.png")
  xs <- c(0.14, 0.38, 0.62, 0.86)
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple)
  titles <- c("Organized", "Recorded", "Documented", "Executable")
  lines <- list(
    c("predictable", "places"),
    c("changes", "and decisions"),
    c("purpose", "and instructions"),
    c("saved steps", "that run")
  )
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.62, 0.19, 0.30, titles[i], lines[[i]], fills[i], borders[i], title_size = 17, line_size = 12)
    if (i < length(xs)) {
      label("+", (xs[i] + xs[i + 1]) / 2, 0.62, 22, colors$slate, "bold")
    }
  }
  arrow_line(0.50, 0.44, 0.50, 0.34, colors$slate, lwd = 4)
  box_label(
    0.50, 0.20, 0.48, 0.20, "Reproducible",
    c("a stated result can be recreated"),
    colors$soft_slate, colors$blue, title_size = 22, line_size = 13
  )
  close_png()
}

make_template_concept <- function() {
  open_png("template-concept.png")
  xs <- c(0.11, 0.27, 0.43, 0.59, 0.75, 0.91)
  names <- c("Data", "Code", "Results", "Products", "Share", "Review")
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple, colors$soft_slate, colors$soft)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple, colors$slate, colors$blue)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.56, 0.13, 0.20, names[i], character(), fills[i], borders[i], title_size = 18)
    if (i < length(xs)) arrow_line(xs[i] + 0.065, 0.56, xs[i + 1] - 0.065, 0.56)
  }
  box_label(0.31, 0.22, 0.34, 0.18, "AI assistance", c("draft", "explain", "check"), colors$soft_purple, colors$purple, title_size = 18)
  box_label(0.69, 0.22, 0.34, 0.18, "Human ownership", c("decide", "verify", "interpret"), colors$soft_blue, colors$blue, title_size = 18)
  arrow_line(0.48, 0.22, 0.52, 0.22)
  close_png()
}

make_toolchain_map <- function() {
  open_png("toolchain-map.png")
  xs <- c(0.12, 0.31, 0.50, 0.69, 0.88)
  titles <- c("IDE", "R / Python", "Quarto", "GitHub", "AI")
  subtitles <- list(
    c("workbench", "edit / run / view"),
    c("compute", "clean / model / save"),
    c("publish", "reports / slides"),
    c("history", "share / review"),
    c("assist", "draft / explain / check")
  )
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple, colors$soft_slate)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple, colors$slate)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.53, 0.16, 0.45, titles[i], subtitles[[i]], fills[i], borders[i], title_size = 18, line_size = 12)
  }
  for (i in 1:4) arrow_line(xs[i] + 0.08, 0.53, xs[i + 1] - 0.08, 0.53)
  rect_box(0.5, 0.16, 0.68, 0.13, colors$soft, colors$line, lwd = 3)
  label("The project folder is the shared map for all tools.", 0.5, 0.16, 17, colors$blue, "bold")
  close_png()
}

make_folder_map <- function() {
  open_png("folder-map.png")
  xs <- c(0.14, 0.38, 0.62, 0.86)
  titles <- c("data/", "code/", "results/", "products/")
  lines <- list(c("inputs", "derived data"), c("workflow", "stages"), c("generated", "outputs"), c("deliverables", "for audience"))
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.58, 0.18, 0.22, titles[i], lines[[i]], fills[i], borders[i], title_size = 19, line_size = 12)
  }
  for (i in 1:3) arrow_line(xs[i] + 0.09, 0.58, xs[i + 1] - 0.09, 0.58)
  box_label(0.25, 0.23, 0.22, 0.16, "assets/", c("stable", "support"), colors$soft, colors$line, title_col = colors$slate, title_size = 17, line_size = 11)
  box_label(0.50, 0.23, 0.22, 0.16, "docs", c("readme", "usage"), colors$soft, colors$line, title_col = colors$slate, title_size = 17, line_size = 11)
  box_label(0.75, 0.23, 0.22, 0.16, "ai/", c("policy", "summary", "log"), colors$soft, colors$line, title_col = colors$slate, title_size = 17, line_size = 11)
  close_png()
}

make_code_stages <- function() {
  open_png("code-stages.png")
  xs <- c(0.14, 0.38, 0.62, 0.86)
  titles <- c("data-processing", "data-exploration", "modeling-analysis", "figures-tables")
  lines <- list(c("raw to", "processed"), c("checks", "summaries"), c("models", "results"), c("final", "outputs"))
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.56, 0.20, 0.24, titles[i], lines[[i]], fills[i], borders[i], title_size = 14, line_size = 12)
  }
  for (i in 1:3) arrow_line(xs[i] + 0.10, 0.56, xs[i + 1] - 0.10, 0.56)
  rect_box(0.5, 0.22, 0.66, 0.14, colors$soft, colors$line, lwd = 3)
  label("utilities/ is optional support for repeated helper logic", 0.5, 0.22, 16, colors$blue, "bold")
  close_png()
}

make_run_order <- function() {
  open_png("run-order.png")
  xs <- c(0.11, 0.305, 0.50, 0.695, 0.89)
  titles <- c("1 Process", "2 Explore", "3 Analyze", "4 Package", "5 Render")
  lines <- list(c("raw to", "processed"), c("checks", "summaries"), c("models", "results"), c("figures", "tables"), c("reports", "slides"))
  fills <- c(colors$soft_blue, colors$soft_green, colors$soft_orange, colors$soft_purple, colors$soft_slate)
  borders <- c(colors$blue, colors$green, colors$orange, colors$purple, colors$slate)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.57, 0.15, 0.24, titles[i], lines[[i]], fills[i], borders[i], title_size = 17, line_size = 12)
  }
  for (i in 1:4) arrow_line(xs[i] + 0.075, 0.57, xs[i + 1] - 0.075, 0.57)
  rect_box(0.5, 0.22, 0.72, 0.14, colors$soft, colors$line, lwd = 3)
  label("Regenerate results before rendering products", 0.5, 0.24, 16, colors$blue, "bold")
  label("A stale report is often an old render.", 0.5, 0.19, 12, colors$ink)
  close_png()
}

make_ai_working_loop <- function() {
  open_png("ai-working-loop.png")
  xs <- c(0.10, 0.30, 0.50, 0.70, 0.90)
  titles <- c("Orient", "Ask", "Review", "Run + check", "Record")
  lines <- list(
    c("goal", "relevant files"),
    c("specific", "bounded"),
    c("proposal", "diffs + logic"),
    c("code", "actual output"),
    c("decision", "meaningful use")
  )
  fills <- c(colors$soft_slate, colors$soft_purple, colors$soft_blue, colors$soft_green, colors$soft_orange)
  borders <- c(colors$slate, colors$purple, colors$blue, colors$green, colors$orange)
  for (i in seq_along(xs)) {
    box_label(xs[i], 0.60, 0.15, 0.25, titles[i], lines[[i]], fills[i], borders[i], title_size = 16, line_size = 11)
  }
  for (i in 1:4) arrow_line(xs[i] + 0.075, 0.60, xs[i + 1] - 0.075, 0.60)
  curved_arrow(0.90, 0.43, 0.10, 0.43, curvature = -0.24)
  rect_box(0.5, 0.20, 0.52, 0.14, colors$soft, colors$line, lwd = 3)
  label("Human judgment remains the gate", 0.5, 0.22, 16, colors$blue, "bold")
  label("AI output remains a proposal until checked.", 0.5, 0.17, 12, colors$ink)
  close_png()
}

make_orderly_framework()
make_template_concept()
make_toolchain_map()
make_folder_map()
make_code_stages()
make_run_order()
make_ai_working_loop()