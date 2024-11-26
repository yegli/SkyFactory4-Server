FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-8-jdk-headless \
    unzip \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /SkyFactory4Server

# Copy the SkyFactory server zip into the container
COPY ./src/SkyFactory-4_Server_4_2_4.zip ./

# Unzip the server files
RUN unzip SkyFactory-4_Server_4_2_4.zip && rm SkyFactory-4_Server_4_2_4.zip

# Copy custom eula.txt to the container
COPY ./src/eula.txt ./eula.txt

# Expose Server Port
EXPOSE 25565

# Set file permissions and install the server
RUN chmod +x Install.sh && ./Install.sh \
    && chmod +x ServerStart.sh

# Run Minecraft server
CMD ["bash", "ServerStart.sh"]
