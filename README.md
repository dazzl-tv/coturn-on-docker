# Coturn on Docker
[![Docker Repository on Quay](https://quay.io/repository/dazzl/coturn/status "Docker Repository on Quay")](https://quay.io/repository/dazzl/coturn)
TURN server in a docker image, based on Coturn project

## Usual parameters

### Ports
* listening port : usually 3478, either in tcp and udp
* relay port : range of UDP relay endpoints, default is 49152-65535, see also *command* below

### Volumes
Global configuration file resides in `/etc/tunserver.conf` and may be overwritten using volumes parameter

### Command
Usual server arguments can be given through the `command` parameter, see turnserver man page for details :

* `--min-port`: Lower bound of the UDP port range for relay endpoints allocation. 
* `--max-port`: Upper bound of the UDP port range for relay endpoints allocation.
* `-l`, `--log-file`: Option to set the full path name of the log file. A usefull value is "-" for stdout.
* `-a`, `--lt-cred-mech`: Use long-term credentials mechanism (this one you need for WebRTC usage).
* `-f`, `--fingerprint`: Use fingerprints in the TURN messages. Usefull for WebRTC again.
* `-r`, `--realm`: Realm to be used for all users. Must be used with long-term credentials mechanism.
* `-u`, `--user`: Long-term security mechanism credentials user account, in the column-separated form username:key.
* `-X`, `--external-ip`: TURN  Server public/private address mapping, if the server is behind NAT. E.g. on an AWS instance.
