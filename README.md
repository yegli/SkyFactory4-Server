# **SkyFactory 4 Server - Dockerized**

This repository provides a Dockerized setup for hosting a **SkyFactory 4** Minecraft server. The server is configured to run on **Ubuntu Jammy** and uses **OpenJDK 8**. The server directory is made persistent to ensure that data such as world files and configuration is not lost between container runs.

---

## **Prerequisites**

- Docker installed on your system.
- Basic familiarity with Docker commands.

---

## **How to Use**

### **1. Clone the Repository**
Clone this repository to your local machine:
```bash
git clone <repository-url>
cd <repository-directory>
```

Get the .zip file for the Server from CurseForge (ensure you change the .zip file name used in the Dockerfile)

### **2. Build the Docker Image**
Build the Docker image using the included `Dockerfile`:
```bash
docker build -t skyfactory4-server .
```

### **3. Run the Server**
Run the container, mapping the persistent directory and server port:

#### **Using a Docker Volume (Recommended):**
```bash
docker run -d -p 25565:25565 \
  -v skyfactory4-data:/SkyFactory4Server \
  --name skyfactory4 \
  skyfactory4-server
```

#### **Using a Bind Mount:**
```bash
docker run -d -p 25565:25565 \
  -v /path/to/local/SkyFactoryServer:/SkyFactory4Server \
  --name skyfactory4 \
  skyfactory4-server
```

> Replace `/path/to/local/SkyFactoryServer` with the absolute path to a directory on your host machine for data persistence.

---

## **Server Configuration**

- **Server Port:** The default Minecraft server port `25565` is exposed. Adjust the `-p` flag during `docker run` if needed.
- **Persistent Data:** All server files (e.g., world saves, logs, configurations) are stored in `/SkyFactory4Server`. Ensure this directory is properly mapped to a volume or bind mount for persistence.

---

## **Managing the Server**

### **Start the Server**
If the container is stopped, restart it with:
```bash
docker start skyfactory4
```

### **Stop the Server**
Gracefully stop the server with:
```bash
docker stop skyfactory4
```

### **Access the Server Logs**
To view server logs in real-time:
```bash
docker logs -f skyfactory4
```

### **Access the Server Console**
To interact with the server console:
```bash
docker exec -it skyfactory4 bash
```
Then run:
```bash
./ServerStart.sh
```

### **Remove the Container**
If you want to remove the container (data remains intact if using a volume or bind mount):
```bash
docker rm -f skyfactory4
```

---

## **Troubleshooting**

- **Ports Not Working:** Ensure port `25565` is open on your host machine's firewall.
- **Insufficient Resources:** Ensure your host machine has sufficient CPU, RAM, and disk space to run the server.
- **Java Version Issues:** The server requires **OpenJDK 8**. Ensure no other versions of Java are being used.

---

## **Contributing**

Feel free to open issues or submit pull requests to improve this repository.

---

## **License**

This setup is provided as-is under the [MIT License](LICENSE). SkyFactory 4 and Minecraft are property of their respective owners.

---

## **Credits**

- [SkyFactory 4 Modpack](https://www.curseforge.com/minecraft/modpacks/skyfactory-4)
- [Minecraft](https://www.minecraft.net/)

--- 