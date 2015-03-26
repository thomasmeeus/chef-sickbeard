maintainer 'Thomas Meeus'
maintainer_email 'thomas@sector7g.be'
license 'MIT'
description 'Installs and configures Sickbeard'
name 'sickbeard'
version '1.1.0'

%w(debian ubuntu).each do |os|
  supports os
end

depends 'git'
depends 'apt'
depends 'ssh_known_hosts'
