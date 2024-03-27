# Meuse data
# Load necessary libraries
library(mapview) # For map plotting
library(sp)      # For spatial data structures
library(sf)      # For handling spatial data as simple features

# Load the meuse dataset (from the sp package, need to convert it to sf)
data(meuse, package = "sp") # Ensure the dataset is loaded correctly

# Convert 'meuse' from SpatialPointsDataFrame (sp) to sf object for mapview compatibility
meuse_sf <- st_as_sf(meuse, coords = c("x", "y"), crs = 28992, agr = "constant")

# Plot the 'zinc' variable using mapview
mapview(meuse_sf["zinc"])

#Crimes Data
user_data <- read.csv("C:/Users/chloe/OneDrive/AY2024 FYP/FYP-Code/FYP-Spatial-Analytics/crimes_processed_vehicle.csv")


# Assuming 'latitude' and 'longitude' are the names of the coordinate columns in your CSV
# Convert the data frame to an sf object, specifying WGS 84 as the CRS (EPSG:4326)
user_data_sf <- st_as_sf(user_data, coords = c("Longitude", "Latitude"), crs = 4326, agr = "constant")

mapview(user_data_sf["n"])

library(sf)
library(ggplot2)

# Assuming meuse_sf is your spatial dataframe prepared as shown previously
# Replace meuse_sf with your sf object name

# Convert 'meuse' dataset to an sf object, if not already

user_data_sf <- st_as_sf(user_data, coords = c("Longitude", "Latitude"), crs = 4326, agr = "constant") %>%
  st_transform(crs = 4326) # Transforming to a common lat/lon CRS for plotting

# Using ggplot2 to plot the data with size adjustments
ggplot(data = user_data_sf) +
  geom_sf(aes(size = n), color = "blue", show.legend = "point") +  # Adjust point sizes based on the 'zinc' value
  scale_size_continuous(range = c(1, 5)) + # Adjust the range of sizes here
  labs(title = "Spatial plot with ggplot2", size = "N Values") +
  theme_minimal() +
  coord_sf()

