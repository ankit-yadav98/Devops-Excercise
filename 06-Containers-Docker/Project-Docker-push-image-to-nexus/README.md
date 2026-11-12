## Demo Project - Containers with Docker

- Create Docker repository on Nexus and push to it

## Technologies used:

Docker, Nodejs, MongoDB, MongoExpress, Linux, Nexus

## Project Description:

- Create Docker hosted repository on Nexus
- Create Docker repository role on Nexus
- Configure Nexus, AWS EC2 instance and Docker to be able to push to Docker repository
- Build and Push Docker image to Docker repository on Nexus

## Steps followed as below:

Open the Nexus administration site (on AWS, already created EC2 instance where nexus is running), create a new repository of type 'docker (hosted)' and call it 'docker-hosted'.

In order to be able to execute `docker login` for this new repository, we need to create a new role (e.g. nx-docker') with the privilege 'nx-repository-view-docker-docker-hosted-*' (docker-hosted is the name of the repository) and assign it to a nexus user (e.g. the user 'ankit' created). This user now has the privilege to execute `docker login` for the new repository.

The `docker login` command needs an ip address and a port. Until now we just have the URL `http://<ec2-instance-ip>:8081/repository/docker-hosted`. To make this repository accessible just via ip address and port, we open the repo in the settings area, check the 'HTTP' checkbox and add the port number 8083.

On AWS EC2 instancen site we have to add this port 8083 to the firewall rules (Custom, TCP, 8083, AllIpv4) that are defined for the nexus droplet.

Back on the Nexus settings area, select Security > Realms and activate the 'Docker Bearer Token Realm'. (When `docker login` is executed for the first time against a specific Docker repository, we get an authentication token from that repository for our client. These tokens are stored in the file `~/.docker/config.json` and will then be used every time we interact with the related repository.)

By default Docker only allows requests from a client going to a secure (https) endpoint. Because our Nexus repository in this example use the http protocol, we have to configure Docker to allow the insecure registry. On Linux clients this is done in the file `etc/docker/daemon.json` by adding
```sh
{
    "insecure-registries": ["<ec2-instance-ip>:8083"]
}
```
On our laptop we open the Docker Desktop settings, go to 'Docker Engine' and add the line `"insecure-registries": ["<ec2-instance-ip>:8083"]` to it.

Now we can finally call `docker login <ec2-instance-ip>:8083` and enter username ('ankit') and password of the Nexus user with the required docker registry privileges. The token returned by Nexus will be stored in `~/.docker/config.json` so that subsequent logins won't ask for username and password anymore.

Now that we are logged in to the Nexus Docker repository, we can push images to it as we did in video 11 (tag the image with the repository id and push it):
- `docker tag user-profile:1.1.0 <ec2-instance-ip>:8083/user-profile:1.1.0`
- `docker push <ec2-instance-ip>:8083/user-profile:1.1.0`
