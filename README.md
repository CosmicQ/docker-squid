docker-squid
============

A simple docker image for a no frills squid proxy.

The intention of this container is to provide a proxy server
for use on a bastion host so that servers on say a "build" network
would be able to access external repositories.

The squid proxy is configured to listen on the default port of 3128, 
but the beauty of Docker is that it is a simple command like option
to change the port on the host.

## Show me

To simple run this on the default port
  $ docker run -d -p 3128:3128 cosmicq/docker-squid 

But is you want to change the proxy to port 80, the simply run
  $ docker run -d -p 80:3128 cosmicq/docker-squid

## Configure for your network

I have added a method to auto-configure this squid proxy for your
network.  The default network is "192.168.0.0/16".  This is expressed
with two environment variables $NET and $CIDR.  To change the config, simply
add these variables to the run command like this

 $ docker run -d -p 3128:3128 --env NET=10.0.1.0 --env CIDR=24 cosmicq/docker-squid

This will allow squid to proxy for the 10.0.1.0 network with a mask of 255.255.255.0.

Enjoy!
