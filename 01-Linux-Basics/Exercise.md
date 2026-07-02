## Exercises
<br />

<summary>Exercise 2: Bash Script - Install Java </summary>
<br />

Write a bash script using Vim editor that installs the latest java version and checks whether java was installed successfully by executing a `java -version` command.

After installation command, it checks 3 conditions:

  1. whether java is installed at all
  2. whether an older Java version is installed (java version lower than 11)
  3. whether a java version of 11 or higher was installed 

It prints relevant informative messages for all 3 conditions. Installation was successful if the 3rd condition is met and you have Java version 11 or higher available.

-----

******

<summary>Exercise 3: Bash Script - User Processes</summary>
 <br />

- 3. Write a bash script using Vim editor that checks all the processes running for the current user (USER env var) and prints out the processes in console.
Hint: use `ps aux` command and grep for the user.
- 4. Extend the previous script to ask for a user input for sorting the processes output either by memory or CPU consumption, and print the sorted list.
- 5. Extend the previous script to ask additionally for user input about how many processes to print. Hint: use `head` program to limit the number of outputs. 

-----

******

<summary>Exercise 4: Start NodeJs App</summary>
<br />

Write a bash script with following logic: 

- Install NodeJS and NPM and print out which versions were installed
- Download an artifact file from the URL: https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz. Hint: use `curl` or `wget`
- Unzip the downloaded file
- Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
- Change into the unzipped package directory
- Run the NodeJS application by executing the following commands:  npm install and node server.js 

Notes:

- Make sure to run the application in background so that it doesn't block the terminal session where you execute the shell script
- If any of the variables is not set, the node app will print error message that env vars is not set and exit
- It will give you a warning about LOG_DIR variable not set. You can ignore it for now.

-----

******

<summary>Exercise 5: Start NodeJs App with Service user & Log Directory</summary>
<br />

Extend the script to accept a parameter input log_directory: a directory where application will write logs.

The script will check whether the parameter value is a directory name that doesn't exist and will create the directory, if it does exist, it sets the env var LOG_DIR to the directory's absolute path before running the application, so the application can read the LOG_DIR environment variable and write its logs there.

Note:

- Check the app.log file in the provided LOG_DIR directory.
- This is what the output of running the application must look like:
```
app listening on port 3000!
-----------------------------
successfully set the following environment variables: 
APP_ENV - dev
DB_USER - myuser
DB_PWD - mysecret
-----------------------------
successfully set LOG_DIR environment variable. Writing logs into /home/fesi/Documents/nodejs/logs
-----------------------------
Logging into the app.log file
Application started successfully using all the provided environment variables
Node app will listen for any incoming connections
This is the end of log entries
-----------------------------
```

-----

******
