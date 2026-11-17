utils::globalVariables("temperature_data")

#' Get Maximum Daily Temperature for a Given Date
#'
#' This function returns the maximum daily temperature in Hamilton, ON
#' for a specified date in Degree Celsius.
#'
#' If no temperature is available for the requested date,
#' an informative message is returned.
#'
#' @param date A date in YYYY-MM-DD format or a Date object.
#'
#' @return A numeric temperature value or a character
#' message if no temperature is available.
#'
#' @export
#'
#' @examples
#' get_max_temperature("2024-07-15")
get_max_temperature <- function(date) {

  date <- as.Date(date)

  if (length(date) != 1 || is.na(date)) {
    stop("Please provide one valid date.")
  }

  matching_data <- temperature_data[
    temperature_data$date == date,
  ]

  available_temperatures <- matching_data$max_temperature

  if (length(available_temperatures) == 0 ||
      all(is.na(available_temperatures))) {

    day <- as.integer(format(date, "%d"))
    month <- month.name[as.integer(format(date, "%m"))]
    year <- format(date, "%Y")

    suffix <- if (day %% 100 %in% 11:13) {
      "th"
    } else {
      switch(
        as.character(day %% 10),
        "1" = "st",
        "2" = "nd",
        "3" = "rd",
        "th"
      )
    }

    return(
      paste0(
        "There is no max. temperature available for the ",
        day, suffix, " of ", month, " ", year
      )
    )
  }

  max(available_temperatures, na.rm = TRUE)
}

