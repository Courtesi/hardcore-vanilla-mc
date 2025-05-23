# Minecraft Hardcore Docker Container

The purpose of this repository is to automate hardcore world regeneration on player death in a Docker container.

## Installation

Install the open source container service provider [Docker](https://docs.docker.com/engine/install/).

### Example: Installing Docker Engine on Ubuntu example from the [docs](https://docs.docker.com/engine/install/ubuntu/):

First, remove any previous outdated installations of Docker.
```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

Second, set up Docker's ```apt``` repository.
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

Third, install Docker's latest packages.
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

And lastly, make sure Docker is working by running the ```hello-world``` image.
```bash
sudo docker run hello-world
```

You should get a message from the Docker container that your installation was completed successfully!

## Usage

### CLI
To run the latest version (1.21.5), run:
```bash
docker run -d -it -p 25565:25565 courtesi/hardcore_mc
```

### Docker Compose
1. Create a new directory.

2. Create a file called ```docker-compose.yml``` and put the contents below into it

3. Run ```docker compose up -d```

4. Don't forget to port forward 25565!

```bash
services:
  hardcore_mc:
    image: courtesi/hardcore_mc
    tty: true
    stdin_open: true
    ports:
      - "25565:25565"
    volumes:
      - ./data:/data
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Credit
Thanks to Bloodimooni on GitHub for providing the ```hardcore.py``` file.