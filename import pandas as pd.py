

import pandas as pd
import requests
from time import sleep

# Carregar planilha
df = pd.read_excel("DATA_ART_TCC.xlsx", header=[0, 1])

# Extrair a coluna de DOIs/links
links = df.iloc[:, 1]

# Função para buscar metadados via Crossref


def fetch_crossref_metadata(doi_url):
    try:
        if "doi.org" in doi_url:
            doi = doi_url.split("doi.org/")[-1]
            url = f"https://api.crossref.org/works/{doi}"
            r = requests.get(url)
            if r.status_code == 200:
                data = r.json()["message"]
                return {
                    "title": data.get("title", [""])[0],
                    "year": data.get("issued", {}).get("date-parts", [[None]])[0][0],
                    "journal": data.get("container-title", [""])[0],
                    "language": data.get("language", ""),
                    "abstract": data.get("abstract", ""),
                }
    except Exception as e:
        print(f"Erro com {doi_url}: {e}")
    return {}


# Exemplo: aplicar nas primeiras linhas
for i in range(len(links)):
    url = str(links[i])
    meta = fetch_crossref_metadata(url)
    print(f"\n{i+1} - {url}")
    print(meta)
    sleep(1)  # evitar sobrecarga da API
