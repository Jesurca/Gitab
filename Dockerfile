# Usar la imagen oficial de Gitea
FROM gitea/gitea:latest

# Configurar la zona horaria local
ENV TZ="America/Bogota"

# Copiar los logos al contenedor
COPY logo.svg /tmp/logo.svg
COPY favicon.svg /tmp/favicon.svg

# Script para mover los logos a la carpeta pública al iniciar
RUN echo '#!/bin/sh' > /start.sh && \
    echo 'mkdir -p /data/gitea/public/assets/img' >> /start.sh && \
    echo 'cp /tmp/logo.svg /data/gitea/public/assets/img/logo.svg' >> /start.sh && \
    echo 'cp /tmp/favicon.svg /data/gitea/public/assets/img/favicon.svg' >> /start.sh && \
    echo 'chown -R git:git /data/gitea/public' >> /start.sh && \
    echo 'exec /usr/bin/s6-svscan /etc/s6' >> /start.sh && \
    chmod +x /start.sh

EXPOSE 3000 22

ENTRYPOINT ["/start.sh"]