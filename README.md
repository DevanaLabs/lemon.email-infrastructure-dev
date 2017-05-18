# lemon.email-infrastructure-dev
Lemon Email infrastructure that can be deployed on local machine used for testing and development.


## Prerequisites 

In order to run everything we will first need to install docker and docker-compose. 

1. Install docker: 

    https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

2. Install docker-compose: 
    
    https://docs.docker.com/compose/install/
    
3. Clone repo

    ```
    git clone git@github.com:DevanaLabs/lemon.email-infrastructure-dev.git
    ```

## Startup

1. Run docker-compose

    ```
    cd lemon.email-infrastructure-dev
    docker-compose up
    ```
    
    
## Configs

SMTP: 172.19.25.3:25

IMAP: 172.19.25.4:143

ACCOUNT: lemonuser@lemon.local 
PASSWORD: lemonuser

## Login

To use this you can connect from any email client, such as Thunderbird. 
Use information from "Configs" section.

Example:

![alt text](http://i.imgur.com/laAS6N7.png)

Note: External emails will be flagged as spam and they cannot be replied to.

