library(wordcloud2)
library(tm)
library(RColorBrewer)



keywords <- c(
  "Militias", "Deforestation", "Brazilian", "Legislation", "Science", "Denialism", "Green", "Finance",
  "Faction", "Prison",
  "Parrot", "reintroduction", "Captive", "raised", "wildlife", "Conservation", "programs", "education", "Yellow", "shouldered",
  "Control", "Theater", "Persuasion", "Psychology", "Law",
  "Humanitarianism", "Photography", "Rubber", "Boom",
  "justice", "Industrial", "contamination", "Oil", "industry", "Capitalism", "critique", "Ecuadorian",
  "Brazil's", "Brand", "Image", "Country", "Branding", "Culture", "Destination",
  "Rainforest", "Deforestation", "Crimes", "Ethnographic", "Fieldwork", "Ethnographic", "Methodology",
  "Parrot", "trafficking", "Nestling", "harvest", "Amazonian", "wildlife", "trade", "Unsustainable", "practices", "Northeastern", "Peru",
  "Basin", "Deforestation", "Illicit", "Drug", "Crop", "Cultivation", "Drug", "Policy", "World", "Drug", "Report",
  "Armed", "Conflict", "Coca", "Cultivation", "Colombia", "Deforestation", "Transition", "Peace",
  "Rubber", "industry", "Indigenous", "violence", "basin", "Colonial", "exploitation", "Brazil",
  "Against", "Humanity", "Federal", "Brazilian", "Government", "Environment", "Socioenvironmental", "Necropolitics", "International", "Criminal", "Court",
  "Immigration", "Juveniles", "Portuguese",
  "Violence", "Against", "Women", "Public", "Policy", "Multicriteria", "Decision", "Analysis", "Socioeconomic", "Indicators", "Pará", "State",
  "Exploitation", "Rubber-Tappers", "Seringal", "Rubber", "Estate", "Violence",
  "Change", "Urban", "Environment", "Mining",
  "Groundwater", "Cemeteries", "Contamination", "Necro-leachate",
  "Against", "Humanity", "Federal", "Brazilian", "Government", "Environment", "Socioenvironmental", "Necropolitics", "International", "Criminal", "Court",
  "Brazil", "Journalistic", "Narratives", "Pragmatic", "Analysis", "Journalistic", "Narrative",
  "Crimes", "Laws", "Violations",
  "Blue-Fronted", "Parrot", "Population", "Monitoring", "Communal", "Roosts", "Conservation", "Management", "Wildlife", "Trade",
  "Edaphic", "Fauna", "Inceptisol", "Pesticides", "Springtails", "Terrestrial", "Ecotoxicology",
  "Coca", "Growers", "Colombian", "State", "Violence", "Collective", "Identity", "Political", "Exclusion",
  "Los", "Chimalapas", "Psittaciformes", "Resource", "Use", "Availability", "Secondary", "Cavity-Nesters", "Tree-Cavity", "Characteristics", "Tropical", "Moist", "Forest",
  "Chevron", "Crimes", "Against", "Humanity", "Ecuador", "Destruction", "International", "Criminal", "Court",
  "Narcotrafficking", "Networks", "Territories",
  "Prosecution", "Policy", "Enforcement", "Legal", "Ambiguity", "Basin", "State", "Capacity",
  "Accounting", "Ethics", "Wilful", "Blindness", "Modern", "Slavery", "Indigenous", "Rights", "Peruvian",
  "Offenses", "Forest", "Control", "Forestry", "Exploitation", "Single", "APU",
  "Amazonia", "Defenders", "Rights", "Human", "Rights", "Pará", "Conflicts",
  "Conservation", "Legislation", "Biodiversity", "Loss", "Manicoré", "Political", "Ecology",
  "Bird", "Trade", "Crimes", "Violations",
  "Environment", "Governance", "Infrastructure", "Development", "Stakeholder",
  "Command", "Control", "Inspection", "Security", "Military", "Police", "Public", "Policies",
  "Crops", "Crimes", "Pharmaceutics", "Physical", "Chemical", "Processes",
  "Economic", "Development", "Hydropower", "Infrastructure-Driven", "Development", "Social", "Impact", "Violence",
  "Land", "Conflicts", "Land", "Management", "Public", "Security",
  "State", "Morality", "Social", "Movements", "Violence",
  "Case", "Studies", "Dams", "Deforestation", "Forests", "Geographical", "Information", "Systems", "Landsat", "Remote", "Sensing", "Spatial", "Variation", "Temporal", "Variation",
  "Disease", "Eradication", "Labor", "Migration", "Malaria", "Miners", "Qualitative", "Research", "Social", "Perception", "Social", "Stigma", "Vulnerable", "Populations",
  "Brazil", "COVID-19", "Pandemic", "Public", "Health", "Policy", "Government", "Denial", "Health", "Crisis",
  "Gold", "Mining", "Law", "Enforcement", "Institutional", "Weakness",
  "Indigenous", "Rights", "Water", "Appropriation", "Landlord", "Exploitation", "Ecuador", "Community", "Protection",
  "Language", "Proficiency", "Labor", "Market", "Bilingualism", "Earnings", "Gap", "Bolivia",
  "Ecological", "Functions", "Parrot", "Poaching", "Seed", "Dispersal", "Threatened", "Species", "Urban", "Habitats",
  "Narcotrafficking", "Organization", "Networks", "Territory",
  "Entomology", "Violations", "Forensics", "Immatures", "Medical",
  "Brazilian", "Legislation", "Food", "Security", "Sovereignty", "Indigenous", "Lands", "Indigenous", "Rights", "Sustainable", "Use", "Reserves", "Traditional", "People", "Rights", "Wildlife", "Use", "Management",
  "America", "Region", "Gold", "Mines", "Guiana", "Shield", "Malaria", "Mobile", "Population",
  "Territorial", "Sovereignty", "State", "Authority", "Secession", "Self-Determination", "International", "Cooperation",
  "Endangered", "Species", "Freshwater", "Turtles", "Trade", "Tortoises", "Unsustainable", "Trade", "Wildlife", "Trade",
  "Parrot", "Biological", "Invasions", "Chimera", "Females", "Hybridization", "Males", "Monk", "Parakeet", "Population", "Density",
  "Femicide", "Spatial", "analysis", "Gender", "Violence", "Ecuador",
  "War", "Deforestation", "Green", "Militarization", "Operation", "Artemis", "Territorial", "Control", "Armed", "Non-State", "Actors",
  "Fear", "kinship", "forced", "migrants", "Colombia", "Ecuador",
  "Activity", "Patterns", "Flock", "Size", "Habitat", "Use", "Nonbreeding", "Behavior", "Parrot", "Roosting", "Sociality", "Survey", "Methods",
  "Biological", "Invasions", "Chimera", "Females", "Hybridization", "Males", "Monk", "Parakeet", "Population", "Density",
  "Base", "Ecclesial", "Communities", "Agrarian", "Reform", "Marx", "Weber", "Rural", "Parishes", "Religious", "Activism",
  "Animals", "Brazil", "Diptera", "Entomology", "Forensic", "Anthropology", "Humans", "Larva", "Growth", "Development", "Male", "Postmortem", "Changes", "Tropical", "Climate",
  "Indigenous", "People", "Human", "Rights", "Genocide", "UN", "Genocide", "Convention", "Annihilation",
  "Land", "Development", "Ordered", "Discrete", "Response", "Data", "Spatial", "Autocorrelation", "Temporal", "Dependency",
  "Animals", "Biological", "Extinction", "Conservation", "Natural", "Resources", "Culture", "Mexico", "Parrot", "Risk",
  "Colombian", "Decomposition", "Development", "Small", "Farmers", "Soil", "Violence", "War", "Drugs",
  "Fear", "Landscape", "Fear", "Predation", "Risk", "Political", "Populism", "Nationalism",
  "Amazonian", "Manatee", "Brazil", "Ethnobiology", "Feeding", "Habits", "Interview", "Rio", "Negro", "Rio", "Tapajós", "Trichechus", "Inunguis",
  "Amazonia", "Brazil", "Deforestation", "Environment", "Indigenous", "Peoples",
  "Agriculture", "Alto", "Huallaga", "Coca", "Drug", "Trafficking", "Narcotráfico", "State", "Development",
  "Acre", "Health", "Profile", "Inmates",
  "Maritime", "Piracy", "Maritime", "Transportation", "Security", "Natural", "Resource", "Curse", "Neoliberalism", "Peru",
  "Justice", "Indigenous", "Rights", "Lawfare", "Oil",
  "Access", "Land", "Agriculture", "Amazonia", "Capitalism", "Coca",
  "Defenders", "Deforestation", "Dependents", "Inhumane", "Acts", "Persecution", "Right", "Healthy", "Environment",
  "Anthropocene", "Apocalypse", "Iquitos", "Salvage", "Punk", "Utopia",
  "Space", "Urban", "Violence",
  "Climate", "Change", "Economic", "Inequality", "Energy", "Justice", "Just", "Transition", "Social", "Contract",
  "Brazilian", "Biomes", "Far-Right", "Jair", "Bolsonaro", "Deforestation", "Tipping", "Point",
  "United", "States", "Colombian", "Government", "Aerial", "Fumigation", "Cocaleros", "Putumayo",
  "Agrarian", "Conflict", "Accounting", "Rainforest", "Forest", "Management", "Sustainable", "Development", "Project",
  "Scientific", "Exploration", "Native", "Hunters", "Cultural", "Intermediaries", "African", "Rivers", "Uncharted", "Forests",
  "Civil", "Police", "Mining",
  "Access", "Justice", "Region", "Digital", "Justice", "Geographic", "Vulnerability", "Riverside", "Communities",
  "Labor", "Law", "Public", "International", "Law", "International", "Criminal", "Law", "Forced", "Labor", "Criminal", "Law",
  "Deforestation", "Markets", "Modern", "Slavery",
  "Decolonization", "Myth", "Origin", "Peruvian",
  "Criminologists", "Crimes", "Powerful", "Structural", "Inequalities", "State", "Indigenous", "Lands",
  "Andes-Amazon", "Extractive", "Activities", "Uneven", "Development", "Indigenous", "Territory", "Justice",
  "Chico", "Mendes", "Rubber", "Tappers", "Local", "Ranchers", "Public", "Security", "Justice", "System",
  "Amerindian", "Warfare", "Development", "Violence", "Politics", "Indigenous", "Sovereignty",
  "Tameness", "Parent-reared", "Orange-winged", "Neonatal", "Handling", "Artificial", "Rearing",
  "Colombia", "Conservation", "Counterinsurgency", "Militarization", "Necropolitics", "Transitional", "Justice",
  "Colonialism", "Latin", "America", "Biosphere", "Integrity", "Climate", "Change", "Community", "Rights",
  "Courtroom", "Drama", "Prosecutor", "Judicial", "Process", "Legal", "Proceedings",
  "Labor", "Law", "Public", "International", "Law", "Criminal", "Law", "International", "Criminal", "Law", "Forced", "Labor",
  "Water", "Cycle", "Origin", "Life", "Ecological", "Connection", "Nature's", "Elements", "Life's", "Fluidity",
  "Argentina", "Bolivia", "Brazil", "Chile", "China", "Climate", "Change", "Colombia", "Critical", "Minerals", "Debt-for-Nature", "Swap", "Deforestation", "Ecuador", "Energy", "Transition", "Lithium", "OPEC", "Rainforests", "Rare-Earth", "Elements", "South", "America", "Soy",
  "Protection", "Jair", "Bolsonaro", "Regional", "Cooperation", "Role", "Theory", "Social", "Vandalism",
  "Rainforest", "Geospatial", "Artificial", "Intelligence", "Geospatial", "Intelligence", "Transnational", "Crimes",
  "Migration", "Remittances", "Family", "dynamics", "Economic", "stability", "Cross-cultural", "analysis",
  "Brazil", "Gold", "Humans", "Indians", "South", "American", "Mercury", "Analysis", "Mining",
  "violence", "mining", "Drug", "trafficking", "Cross-border", "armed", "groups", "Investigative", "journalism",
  "Water", "pollution", "policy", "Pollution", "control", "United", "States", "Policy", "effectiveness",
  "Illicit", "cattle", "ranching", "Coca", "farming", "Forest", "loss", "Colombian", "Land", "use", "change",
  "Adolescent", "Health", "Detained", "Adolescent", "Health", "Vulnerability", "Social", "Vulnerability", "Violence",
  "Defence", "Homicide", "Security", "Transnational",
  "Parrot", "Ecuador", "Endangered", "Pet", "Trade",
  "Coca", "Deforestation", "Fires", "Logit", "Model", "Probit", "Model", "Remote", "Sensing",
  "Role", "Psychologist", "History", "Psychology",
  "Alien", "Species", "Amazona", "Distribution", "Range", "Assessment", "Establishment", "Success", "Impacts",
  "Pará", "Agrarian", "Conflicts", "Correio", "Tocantins", "Depth", "Hermeneutics", "Violence",
  "Recognition", "respect", "Appraisal", "respect", "Moral", "philosophy", "Inherent", "worth", "Ethical", "evaluation",
  "Coca", "history", "Cocaine", "trade", "Peru-US", "relations", "Drug", "policies", "Cultural", "perceptions",
  "Agriculture", "Economic", "Development", "Environment", "Behavior", "Enforcement", "Law", "Natural", "Resources", "Other", "Primary", "Products",
  "Agriculture", "Economic", "Development", "Environment", "Behavior", "Enforcement", "Law", "Natural", "Resources", "Other", "Primary", "Products",
  "Child", "sorcery", "Colonialism", "Southern", "Arawak", "cultures", "Indigenous", "violence",
  "Bird", "pollination", "Erythrina", "fusca", "Colombian", "Avian", "interactions", "Reproductive", "ecology",
  "Femicide", "Journalistic", "Narrative",
  "Amazona", "Arausiaca", "Amazona", "Imperialis", "Conservation", "Flagships", "Dominica", "Parrot",
  "Archaeology", "BNDES", "Belo", "Monte", "Biodiversity", "Convention", "169", "ILO", "Impact", "Fauna", "Hydrovia", "Indigenous", "Land", "Licensing", "Socioenvironmental", "Impact", "Tapajós", "River", "UHE", "Conservation", "Unit",
  "Soil", "practitioners", "policy", "Agricultural", "policy", "Life", "politics", "Socio-political", "dynamics",
  "Amazonian", "criminality", "Narcotrafficking", "Social", "impact", "Illicit", "activities", "Local", "communities",
  "Amazonia", "Cocaine", "Drug", "Trafficking", "Guerrilla", "Peru", "Political", "Violence", "Reduced", "Ability", "Govern", "Vulnerability", "Violence",
  "Crime", "Defence", "Homicide", "Security", "Transnational",
  "Amazon", "Parrot", "Ecuador", "Endangered", "Pet", "Trade",
  "Coca", "Deforestation", "Fires", "Logit", "Model", "Probit", "Model", "Remote", "Sensing",
  "Role", "Psychologist", "History", "Psychology",
  "Alien", "Species", "Amazona", "Distribution", "Range", "Assessment", "Establishment", "Success", "Impacts",
  "Pará", "Amazon", "Agrarian", "Conflicts", "Correio", "Tocantins", "Depth", "Hermeneutics", "Violence",
  "Recognition", "respect", "Appraisal", "respect", "Moral", "philosophy", "Inherent", "worth", "Ethical", "evaluation",
  "Coca", "history", "Cocaine", "trade", "Peru-US", "relations", "Drug", "policies", "Cultural", "perceptions",
  "Agriculture", "Economic", "Development", "Environment", "Illegal", "Behavior", "Enforcement", "Law", "Natural", "Resources", "Other", "Primary", "Products",
  "Agriculture", "Economic", "Development", "Environment", "Illegal", "Behavior", "Enforcement", "Law", "Natural", "Resources", "Other", "Primary", "Products",
  "Child", "sorcery", "Colonialism", "Southern", "Arawak", "Amazon", "cultures", "Indigenous", "violence",
  "Bird", "pollination", "Erythrina", "fusca", "Colombian", "Amazon", "Avian", "interactions", "Reproductive", "ecology",
  "Amazon", "Femicide", "Journalistic", "Narrative",
  "Amazona", "Arausiaca", "Amazona", "Imperialis", "Conservation", "Flagships", "Dominica", "Parrots",
  "Archaeology", "BNDES", "Belo", "Monte", "Biodiversity", "Convention", "169", "ILO", "Environmental", "Impact", "Fauna", "Hydrovia", "Indigenous", "Land", "Licensing", "Socioenvironmental", "Impact", "Tapajós", "River", "UHE", "Conservation", "Unit",
  "Soil", "practitioners", "Environmental", "policy", "Agricultural", "policy", "Life", "politics", "Socio-political", "dynamics",
  "Amazonian", "criminality", "Narcotrafficking", "Social", "impact", "Illicit", "activities", "Local", "communities",
  "Amazonia", "Cocaine", "Drug", "Trafficking", "Guerrilla", "Peru", "Political", "Violence", "Reduced", "Ability", "Govern"
)


#excluir
keywords2_clean <- keywords2[!grepl("amazon", keywords2, ignore.case = TRUE)]


# Create frequency table (weighted)
keyword_freq <- table(keywords2_clean)
keyword_freq <- as.data.frame(keyword_freq)
colnames(keyword_freq) <- c("word", "freq")


# Generate word cloud with customizations
wordcloud2(
  data = keyword_freq,
  size = 1.5,           # Base size scaling
  color = "random-dark", # Color scheme options: "random-dark", "random-light"
  backgroundColor = "white",
  shape = "circle",      # Try "diamond", "triangle", or "cardioid"
  minRotation = -pi/4,   # Rotation angles
  
  
  ## test
  maxRotation = pi/4,
  rotateRatio = 0.4,
  ellipticity = 0.7      # Roundness (0.7 = slightly oval)
)

# For Amazon-shaped cloud (requires image file)
# wordcloud2(keyword_freq, figPath = "amazon_silhouette.png", size = 0.5)