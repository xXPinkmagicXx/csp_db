FROM postgres:17.4

# Installing dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sed \
    && rm -rf /var/lib/apt/lists/*

# Copy init scripts
COPY init/load_data.sh /docker-entrypoint-initdb.d/load_data.sh
RUN chmod +x /docker-entrypoint-initdb.d/*.sh