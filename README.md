These are the scripts I use to setup and manage my Raspberry Pi home server. Nothing fancy, just a basic Raspbian setup with:

- SSH
- OpenVPN
- OwnCloud

plus some stuff for generating and managing keys. Intended usage is for the VPN to be accessible through the home router's firewall, with everything else accessible only to machines on the LAN or through the VPN.

It's also set up so that a second Pi on another LAN somewhere else can connect to the first, and they will maintain a site-to-site VPN with each other, so that clients on either LAN have full access to both networks. The intended usage for this is to have the second Pi at, say, a family-member's house, and to keep the two side's OwnCloud servers in sync for redundancy/backup (not quite up and running yet...).


To do:

- finish the OwnCloud backup thing
- install a media server
- convert the custom shell scripts to something standard, e.g. ansible and jinja2