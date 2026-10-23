# Usar la imagen oficial de Gitea
FROM gitea/gitea:latest

# Configurar la zona horaria local
ENV TZ="America/Bogota"

# Gitea expone por defecto los puertos 3000 (web) y 22 (SSH)
EXPOSE 3000 22