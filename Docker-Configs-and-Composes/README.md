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

# Another tip:

If you are stuck behind a NAT router (like me), It would be pretty good to use a software called ngrok, which tunnels your network outwards. Because I like dockers, I just followed the guide by Hardware Haven and used his [docker image](https://hub.docker.com/r/hardwarehaven/ngrok2discord#!) to get a notification on discord (yay!). Also please get a ngrok account (free one would suffice) or else it won't work.

BUT before you do this, you need ngrok-systemd and used the web-addr flag in the configuration file instead of just using localhost (won't work without it)

# Notes
Shamelessly pulled off from https://github.com/JACOBSMILE/tmodloader1.4/blob/master/README.md and Hardware Haven's 3 videos
(just changed enough to get it working for Terraria):

Also, he used a different distro in the first video and Ubuntu server later on.
1. [Incredible budget home server!](https://youtu.be/72D3MvPk3Xs?si=ipsmi4XTT6g1b_x1)
2. [Building a minecraft server with 12 yr old pc](https://youtu.be/eIHiRW4QH6I?si=7t0eujgKF19Qx1zP)
3. [Host a game server when your isp doesnt want you to](https://youtu.be/SZmc5uoNCko?si=bxWIzCUZ4zhhWPnz)
