# Utilisez une image de base avec Python
FROM python:3.9-slim

# Mettez à jour les packages et installez les dépendances nécessaires
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers de l'application dans le conteneur
COPY requirements.txt /app/
COPY App.py /app/
COPY templates /app/templates
COPY templates /app/templates
COPY FV.h5 /app/

# Installez les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Exposez le port sur lequel l'application Flask s'exécutera
EXPOSE 5000

# Commande par défaut pour exécuter l'application
CMD ["python", "App.py"]
