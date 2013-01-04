Description
-----------
Chef recipe to install and configure Sickbeard.

Recipes
=======
default
-------
This recipe installs and configures Sickbeard.

Attributes
======
* ```default['sickbeard']['location']   = "/opt/sickbeard"``` - The install location of Sickbeard
* ```default['sickbeard']['user']   = "sickbeard"``` - Sickbeard's user
* ```default['sickbeard']['group']   = "sickbeard"``` - Sickbeard's group
* ```default['sickbeard']['data_dir']   = "~/.sickbeard"``` - Sickbeard's data/config dir
* ```default['sickbeard']['nzb_method'] = "sabnzbd"``` - Download with which provider? (Currently only Sab)
* ```default['sickbeard']['sab_username'] = ""```
* ```default['sickbeard']['sab_password'] = ""```
* ```default['sickbeard']['sab_apikey'] = ""```
* ```default['sickbeard']['sab_category'] = "tv"```
* ```default['sickbeard']['sab_host'] = "http://localhost:8000/"```
* ```default['sickbeard']['provider_order'] = "nzbs_r_us nzbs_org womble_s_index tvtorrents ezrss btn sick_beard_index"``` - Order of search providers
* ```default['sickbeard']['newznab_data'] = "Sick Beard Index|http://lolo.sickbeard.com/||0!!!NZBs.org|http://beta.n zbs.org/||0"``` - Search provider settings


Requirements
------------

Dependencies:

* apt: https://github.com/opscode-cookbooks/apt

* git: https://github.com/opscode-cookbooks/git

Supports:

* Ubuntu 12.10
