# Usar la imagen oficial de Gitea
FROM gitea/gitea:latest

ENV TZ="America/Bogota"

# Copiamos los logos a la ruta nativa de Gitea con los permisos correctos
COPY --chown=git:git logo.svg /data/gitea/public/assets/img/logo.svg
COPY --chown=git:git favicon.svg /data/gitea/public/assets/img/favicon.svg

# Copiamos la plantilla de la página de inicio
COPY --chown=git:git templates/home.tmpl /data/gitea/templates/home.tmpl

EXPOSE 3000 22