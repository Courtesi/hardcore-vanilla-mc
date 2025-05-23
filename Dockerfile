ARG BASE_IMAGE=eclipse-temurin:21-jre
FROM ${BASE_IMAGE}

# Install required tools: curl, jq, python3, bash (if missing)
RUN apt-get update && apt-get install -y curl python3 && rm -rf /var/lib/apt/lists/*

COPY /data/server.jar /data/server.jar
COPY /data/hardcore.py /data/hardcore.py

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

ENTRYPOINT ["python3", "/data/hardcore.py"]