
# Load original research data

raw_data <- read.csv(
  "data-raw/temperature_data.csv",
  stringsAsFactors = FALSE,
  check.names = FALSE
)

# Select only column 2 (date) and column 6 (max temp)

temperature_data <- raw_data[, c(2, 6)]

# Rename columns

names(temperature_data) <- c(
  "date",
  "max_temperature"
)

# Convert date to Date format
# IMPORTANT: Adjust the format if necessary

temperature_data$date <- as.Date(
  trimws(as.character(temperature_data$date)),
  format = "%m/%d/%Y"
)

# Convert temperature to numeric

temperature_data$max_temperature <- as.numeric(
  temperature_data$max_temperature
)

# Save dataset in package

usethis::use_data(
  temperature_data,
  overwrite = TRUE
)

