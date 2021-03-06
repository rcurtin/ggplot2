#' @export
#' @rdname position_stack
position_fill <- function() {
  PositionFill
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
PositionFill <- ggproto("PositionFill", Position,
  adjust = function(self, data) {
    if (empty(data)) return(data.frame())

    check_required_aesthetics(c("x", "ymax"), names(data), "position_fill")
    if (!all(data$ymin == 0)) warning("Filling not well defined when ymin != 0")
    collide(data, NULL, "position_fill", pos_fill)
  }
)
