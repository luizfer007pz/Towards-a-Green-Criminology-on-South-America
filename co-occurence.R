# Load required libraries
library(igraph)
library(dplyr)

# Create data frame with provided variables
data <- data.frame(
  var1 = c("Sociology", "Geography", "Ecology", "Environmental science", 
           "Anthropology", "Anthropology", "Economy", "Criminology", 
           "Mechanical Engineering", "Psychiatry", "Criminology", "Biology", 
           "Sociology", "Environmental science", "Sociology", 
           "Environmental science", "Literature", "Environmental science", 
           "Human Resources", "Law", "Sociology", "Political Science", 
           "Environmental science", "Biology", "Anthropology", "Biology", 
           "Anthropology", "Environmental science", "Political Science", 
           "Economy", "Biology", "Environmental science", "Environmental science", 
           "Biology", "Criminology", "Environmental science", "Ecology", 
           "Sociology", "Sociology", "Anthropology", "Mechanical Engineering", 
           "Biology", "Psychiatry", "Biology", "Political Science", "Economy", 
           "Biology", "Environmental science", "Environmental science", 
           "Sociology", "Public health", "Political Science", "Biology", 
           "Ecology", "Ecology", "Public health", "Political Science", 
           "Anthropology", "Sociology", "Ecology", "Anthropology", "Biology", 
           "Sociology", "Mechanical Engineering", "Biology", "Anthropology", 
           "Biology", "Ecology", "Law", "Sociology", "Biology", 
           "Environmental science", "Anthropology", "Sociology", 
           "Political Science", "Environmental science", "Geography", "Law", 
           "Environmental science", "Anthropology", "Economy", "Ecology", 
           "Environmental science", "Law", "Law", "Political Science", 
           "Literature", "Law", "Law", "Anthropology", "Sociology", "Biology", 
           "Ecology", "Geography", "Law", "Law", "Sociology", "Political Science", 
           "Political Science", "Environmental Science", "Sociology", 
           "Epidemiologist", "Journalism", "Economy", "Geography", "Biology", 
           "Criminology", "Biology", "Environmental Science", "Psicologia", 
           "Biology", "Sociology", "Sociology", "Sociology", "Economy", "Law", 
           "Anthropology", "Biology", "Sociology", "Biology", "Anthropology", 
           "Anthropology", "Law", "Environmental Science"),
  var2 = c("Brazil", "Brazil", "Venezuela", "United States", "United States", 
           "United States", "Brazil", "Netherlands", "Spain", "United States", 
           "Germany", "United States", "Australia", "Brazil", "Brazil", "Brazil", 
           "Brazil", "Brazil", "United States", "Brazil", "Portugal", "Brazil", 
           "Brazil", "Brazil", "Colombia", "Mexico", "United States", "Brazil", 
           "United States", "United Kingdom", "Brazil", "Brazil", "Brazil", 
           "United States", "United States", "Brazil", "United States", 
           "Switzerland", "Brazil", "Brazil", "United States", "Brazil", 
           "Canada", "Indonesia", "United States", "United States", "Brazil", 
           "Brazil", "Brazil", "Brazil", "France", "United Kingdom", 
           "United States", "Spain", "Spain", "Sweden", "United States", 
           "Canada", "United States", "United States", "United States", "Brazil", 
           "United States", "United States", "Spain", "United States", 
           "United Kingdom", "Brazil", "Brazil", "Peru", "Brazil", 
           "United States", "United States", "United Kingdom", "Germany", 
           "United Kingdom", "Brazil", "France", "Brazil", "Colombia", "Brazil", 
           "Italy", "United States", "Brazil", "United States", "Canada", 
           "United States", "Netherlands", "United States", "United States", 
           "N/A", "United States", "United Kingdom", "Switzerland", 
           "United States", "United States", "United States", "United Kingdom", 
           "Poland", "Brazil", "United States", "Brazil", "Belgium", 
           "United States", "United States", "Brazil", "Brazil", 
           "United Kingdom", "Austria", "Brazil", "Italy", "Brazil", 
           "United States", "United States", "Brazil", "United States", 
           "United States", "United Kingdom", "Brazil", "United States", 
           "Brazil", "United States", "Brazil", "France")
)

# Count co-occurrences
co_occur <- data %>%
  group_by(var1, var2) %>%
  summarise(weight = n(), .groups = 'drop')

# Create an edge list for the graph
edges <- co_occur %>%
  rename(from = var1, to = var2)

# Create graph
g <- graph_from_data_frame(edges, directed = FALSE)

# Plot graph with larger plot area and adjusted layout
set.seed(123)  # for reproducibility
plot(
  g,
  edge.width = E(g)$weight,
  vertex.label.cex = 0.8,
  vertex.size = 20,
  vertex.color = "lightblue",
  vertex.label.color = "black",
  edge.color = "gray50",
  layout = layout_with_fr(g),
  main = "Co-occurrence Graph: Author Background vs. Institution Country",
  margin = c(0, 0, 0.5, 0)
)

# Add legend for edge weights
legend("bottomright", 
       legend = paste("Weight:", 1:max(E(g)$weight)), 
       lwd = 1:max(E(g)$weight), 
       bty = "n")


# Create graph
g <- graph_from_data_frame(edges, directed = FALSE)

# Identify which vertices belong to var1 (author background) vs var2 (countries)
var1_nodes <- unique(data$var1)
var2_nodes <- unique(data$var2)

# Create color vector based on vertex type
V(g)$color <- ifelse(V(g)$name %in% var1_nodes, "lightgreen", "lightcoral")

# Plot graph with colored nodes
set.seed(123)  # for reproducibility
plot(
  g,
  edge.width = E(g)$weight,
  vertex.label.cex = 0.8,
  vertex.size = 20,
  vertex.label.color = "black",
  edge.color = "gray50",
  layout = layout_with_fr(g),
  main = "Co-occurrence Graph: Author Background (green) vs Institution Country (red)",
  margin = c(0, 0, 0.5, 0)
)

# Add legend explaining node colors
legend("topleft",
       legend = c("Author Background", "Institution Country"),
       pch = 21,
       pt.bg = c("lightgreen", "lightcoral"),
       pt.cex = 2,
       bty = "n")


