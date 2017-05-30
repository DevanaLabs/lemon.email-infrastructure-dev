# lemon.email-infrastructure-dev
Lemon Emails regular email containerized infrastructure that can be deployed on local machine used for testing and development.


## Prerequisites 

In order to run everything we will need to install docker and docker-compose. 

1. Install docker: 

    https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

2. Install docker-compose: 
    
    https://docs.docker.com/compose/install/
    
3. Clone repo

```
git clone git@github.com:DevanaLabs/lemon.email-infrastructure-dev.git
```

## Config

Run config.sh script and enter your domain name to be updated in dkim container

    ```
    ./config.sh 
    Enter your domain eg: example.com
    example.com
    ```

## Startup

Run docker-compose

    ```
    cd lemon.email-infrastructure-dev
    docker-compose up
    ```
    
    
## Settings

SMTP: 172.19.25.3:25

IMAP: 172.19.25.4:143

ACCOUNT: lemonuser@lemon.local

PASSWORD: lemonuser

## Login

To use this you can connect from any email client, such as Thunderbird. 
Use the information provided from the "Configs" section.

Example:

![alt text](http://i.imgur.com/laAS6N7.png)

Note: Emails sent to external emails will be marked as spam. You also cannot reply to those emails since they are sent from "localhost".

