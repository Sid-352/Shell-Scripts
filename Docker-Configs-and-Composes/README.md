## Basic guide 4 installation

Firstly, download Docker itself and test it using a basic docker like hello-world

```bash
sudo docker run hello-world
```
Also you need to add yourself in the docker group (search it and make one) to not use sudo again and again

Now here comes the actual thing:

```bash
# ":latest" will pull the most recent tModLoader version from https://github.com/tModLoader/tModLoader/releases/latest
docker pull jacobsmile/tmodloader1.4:latest
```

### Data Directory
Create a directory on HOST machine to house persistent files.

```bash
# Making the Data directory
mkdir /path/to/data/directory
```

```bash
# The below line is a mapped volume for the Docker container.
-v /path/to/data/directory:/data
```

Within this directory, you will find the following file structure:
```
/data/
├─ steamMods/
│  ├─ steamapps/
│  │  ├─ workshop/
│  │  │  ├─ content/
│  │  │  │  ├─ 1281930/
├─ tModLoader/
│  ├─ ModConfigs/
│  ├─ Mods/
│  │  ├─ enabled.json
│  ├─ Worlds/
```

Steam Workshop content is stored within `steamMods`.

The server's Mod Configurations, Mod directory and World directories are stored within `tModLoader`.

# Interacting with the Server

To send commands to the server once it has started, use the following command on your Host machine. The below example will send "Hello World" to the game chat.

```bash
docker exec tmodloader inject "say Hello World!"
```
You can alernatively use the UID of the container in place of `tmodloader` if you did not name your configuration.

# Notes
Shamelessly pulled off from https://github.com/JACOBSMILE/tmodloader1.4/blob/master/README.md
