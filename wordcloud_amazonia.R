
# Instalar pacotes necessários (se ainda não instalados)
if (!require("wordcloud")) install.packages("wordcloud", dependencies=TRUE)
if (!require("tm")) install.packages("tm", dependencies=TRUE)
if (!require("RColorBrewer")) install.packages("RColorBrewer", dependencies=TRUE)

# Carregar pacotes
library(wordcloud)
library(tm)
library(RColorBrewer)

# Inserir suas palavras-chave
palavras_chave <- c(
  "Rubber Boom",
  "Parrot trafficking",
  "Nestling harvest",
  "...",
  "Brazilian Environmental Legislation",
  "Amazon Rainforest",
  "Faction",
  "Science Denialism",
  "Captive raised wildlife",
  "Persuasion",
  "Amazon Deforestation",
  "Environmental justice",
  "Cocaine",
  "Ethnographic Methodology",
  "Amazonia",
  "Parrot reintroduction",
  "Brazil’s Brand Image",
  "Crime Control Theater",
  "Deforestation",
  "Amazon",
  "Environmental Militias",
  "Drug Trafficking",
  "Destination Branding",
  "Psychology and Law",
  "Oil industry",
  "Reduced Ability to Govern",
  "Country Brand",
  "Ethnographic Fieldwork",
  "Unsustainable practices",
  "Crime",
  "Prison",
  "Photography",
  "Conservation programs",
  "Industrial contamination",
  "Yellow shouldered amazon",
  "Humanitarianism",
  "Country Branding",
  "Peru",
  "Amazonian wildlife trade",
  "Green Finance",
  "Guerrilla",
  "Deforestation Crimes",
  "Northeastern Peru",
  "Culture",
  "Ecuadorian Amazon",
  "Capitalism critique",
  "Political Violence",
  "Environmental education"
)

# Criar corpus
corpus <- Corpus(VectorSource(palavras_chave))

# Limpar texto
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

# Criar matriz de termos
dtm <- TermDocumentMatrix(corpus)
matriz <- as.matrix(dtm)
frequencia <- sort(rowSums(matriz), decreasing = TRUE)

# Gerar word cloud
set.seed(123)
wordcloud(
  words = names(frequencia),
  freq = frequencia,
  min.freq = 1,
  max.words = 200,
  random.order = FALSE,
  colors = brewer.pal(8, "Dark2")
)
