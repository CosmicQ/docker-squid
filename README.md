docker-squid
============

A simple docker image for a no frills squid proxy.

The intention of this container is to provide a proxy server
for use on a bastion host so that servers on say a "build" network
would be able to access external repositories. This can also be used
on other simple setups like home networks.

The proxy is configured to listen on the default port of **3128**, 
but the beauty of Docker is that it is a simple command line option
to change the port on the host.

## Show me

To simply run this on the default port

    $ docker run -d -p 3128:3128 cosmicq/docker-squid 

But if you want to change the proxy to port 80, then simply run

    $ docker run -d -p 80:3128 cosmicq/docker-squid

The docker port will always be 3128, but the port listening on the host can be anything you want.

## Configure for your network

I have added a method to configure this squid proxy for your
network.  The default network is *192.168.0.0/16*.  This can be changed by 
two environment variables: **$NET** and **$CIDR**.  To change the network/netmask, simply
add these variables to the run command like this

    $ docker run -d -p 3128:3128 --env NET=10.0.1.0 --env CIDR=24 cosmicq/docker-squid

This will allow squid to proxy for the *10.0.1.0* network with a mask of *255.255.255.0*.

If you specify only the **NET** environment variable, it will be treated like an IP address.
This means, only the IP addresses specified will be allowed to proxy traffic.

    $ docker run -d -p 3128:3128 --env NET=192.168.1.42 cosmicq/docker-squid

This container will only allow the IP address 192.168.1.42 to proxy traffic through it.

## Other containers on the host

The proxy has been configured to allow any traffic from other docker containers.  From squid.conf

    acl DOCKER src 172.17.0.0/16

Docker defaults to *172.17.x.x* addresses.  If you have other containers running on this host, you 
can point them to this container for proxy access if needed.
