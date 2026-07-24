## Notes on AWS EC2 Instance and app deployment on server
<br />

<summary> Setup Server on AWS</summary>
<br />

Create an account on AWS.

On AWS servers (virtual machines) are called `EC2 Instance`.

Create your first EC2 Instance:
- Search EC2 in search bar > Select Instances and then click Launch Instances
- Write the EC2 instance Name.
- Choose image (Ubuntu 22.10 x64)
- Choose AMI (Select Free tier)
- Choose Instance Type (Select Free tier available to your region)
- Choose Key pair ( Click on 'Create new key pair' and then select key pair type and select private key file format) and give it a name, e.g. name of the local machine) and then click create key pair. Key pair will be downloaded.
- Under netwrok settings, create a firewall security group and then click on allow SSH traffic from anywhere according to your requirement.
- Click on 'Launch Instance'

SSH into the server:
- Copy the private downloaded key and copy in you local machine to /home/<user>/.ssh/ directory.
- copy the EC2 Instance IP address
- execute `ssh -i <path of downloaded keys> ubuntu@<EC2Instace-ip-address>`

Install Java:
- `apt update`
- `apt install openjdk-8-jre-headless`


*****

<summary> Deploy and run application artifact on EC2 Instance</summary>
<br />

Clone https://github.com/nanuchi/java-react-example.git

Build the application:
- `cd java-react-example`
- `gradle build`

Copy the application to the server:
- `scp -i <path of downloaded keys> build/libs/java-react-example.jar ubuntu@<EC2Instance-ip-address>:/home/ubuntu`

Start the application on the server:
- `ssh -i <path of downloaded keys> ubuntu@<EC2Instace-ip-address>`
- `java -jar java-react-example.jar`

The application starts and prints out: "Tomcat started on port(s): 7071 (http)". To open this port for browsers from any IP address, add another rule of type "Custom", TCP, port 7071, for any IP adresses to the EC2 Firewall security groups you created before.

Open the application in your browser calling `http://<EC2Instance-ip-address>:7071`

To run the application in the background, start it executing `java -jar java-react-example.jar &`.
Use `ps aux` and `netstat -tlnp` (install it first using `apt install net-tools`) to get the process PID and the port.


*****

<summary>Create and configure a Linux user on a cloud server</summary>
<br />

You should never work a server as root user. So create a new user on the AWS EC2 Instance.
- `adduser admin`

Now add that user to the sudo group. Members of the sudo group can call the sudo command and execute single commands as root user.
- `usermod -aG sudo admin`
    - -a Add the user to the supplementary group(s). Use only with the -G option.
    - -G A list of supplementary groups which the user is also a member of. Each group is separated from the next by a comma, with no intervening whitespace.

Now you can switch to the new user with `su - admin`.

To be able to login as `admin` via ssh, you have to copy your public key (from ~/.ssh) into a file `/home/admin/.ssh/authorized_keys`.
- execute `pbcopy < ~/.ssh/id_rsa.pub` on your local machine
- `ssh -i <path of downloaded keys> ubuntu@<EC2Instace-ip-address>`
- `su - admin`
- `mkdir .ssh`
- `sudo vim .ssh/authorized_keys`, paste the copied key into that file and save it
- `exit`
- `exit`

Now you can ssh into the EC2 Instance as user `admin`:
- `ssh -i <path of downloaded keys> ubuntu@<EC2Instace-ip-address>`


*****
