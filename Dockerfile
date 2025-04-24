FROM postgres:17.4

# Installing dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sed \
    && rm -rf /var/lib/apt/lists/*

# Copy init scripts
COPY init/ /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/*.sh