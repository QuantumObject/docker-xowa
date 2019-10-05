# docker-xowa
docker container for xowa (offline wikipedia)

"[XOWA][1] is the free, open-source application that lets you download Wikipedia to your computer. Access all of Wikipedia offline -- without an internet connection!"

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 18.04 use the commands:

    $ sudo apt-get update
    $ sudo wget -qO- https://get.docker.com/ | sh

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -v yours/storage:/opt/xowa/wiki -p 8080 quantumobject/docker-xowa
  
note: -v yours/storage:/opt/xowa/wiki   ==> to add,and/or to keep the differents wikipedia after upgrading , replacing your container.  
## Accessing the Xowa applications:

After that check with your browser at addresses plus the port assigned by docker:

  - **http://host_ip:port/**

If you didn't add any pre-existing copy of wikipedia(example simple.wikipedia.org) at -v yours/storage:/opt/xowa/wiki them this application will be show only the main page plus some others configuration plus help/doumentation without any wikipedia but in the middle of this main page you have a link _Set up Simple Wikipedia_ that will download and add the simple.wikipedia.org to it (this link will show a broken page or error page but it is downloading the wikipedia on the background) You can go back to main page and check documentation  the simple.wikipedia.org will take some time to download . When done downloading a link _simple.wikipedia.org will appear at the left side of your page under Wikis. You can used this link to check the wiki or used this web address :

  - **http://host_ip:port/simple.wikipedia.org**

In the same  Main Page ,at the end,  of this application you can find others wikipedia (827 of them) at _import Online_ link. Some of them are huge . 

rememver to used -v option to runs this container in that way you can keep a copy of the wikipedia you donwload and later you can move them to computers not connect (offline) or don't need to download the same wiki if need to resinstall the container . 

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash

note: deploy this container behind proxy with SSL for extra security:

https://github.com/jwilder/nginx-proxy

https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
    
## More Info

About Xowa [www.xowa.org][1]

To help improve this container [quantumobject/docker-xowa][5]

For additional info about us and our projects check our site [www.quantumobject.org][6]

[1]:http://www.xowa.org/
[2]:https://www.docker.com
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-xowa
[6]:https://www.quantumobject.org

