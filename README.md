# ensign

> [!NOTE]
> A proof of concept operating system userspace


## Build

### Development (Docker)

#### CLI

```
docker-compose build
```

```
docker-compose up
```



### Run

#### Using the Docker Image in UTM

To use this Docker image within UTM:

##### Create a Linux VM in UTM

- Install Debian Bullseye or another minimal Linux distribution
- Install Docker Inside the VM

```
sudo apt-get update
sudo apt-get install -y docker.io
```

##### Transfer the Docker Image to the VM

Use docker save and docker load to transfer the image.

# On your Mac

```
docker save ensign_os -o ensign_os.tar
scp ensign_os.tar user@vm_ip:/home/user/
```

# Inside the VM

```
docker load -i ensign_os.tar
```

Run the Docker Container in the VM:

```
docker run -p 5900:5900 ensign_os
```

Connect via VNC:
Use your VNC client to connect to the VM's IP address on port 5900.



## Misc

- [Mr. Doob - Clouds](https://mrdoob.com/lab/javascript/webgl/clouds/)
