#!/bin/bash

exec /usr/sbin/squid3 -N -d 0 -f /etc/squid/squid.conf
