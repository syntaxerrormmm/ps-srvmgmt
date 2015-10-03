#!/bin/bash

# Creo directory dipendenti
install -d -o root -g users /var/lib/{{ ansible_local.domain.domainfull }}/config
chmod -R root:users /var/lib/{{ ansible_local.domain.domainfull }}

# Installo il cronjob per ansible-pull
wget -q http://{{ ansible_local.domain.serverfqdn }}/ks/ansible-pull/crontab -O /etc/cron.d/ansible-pull
chown root:root /etc/cron.d/ansible-pull
chmod 0644 /etc/cron.d/ansible-pull

# Installo il logrotate per ansible
wget -q http://{{ ansible_local.domain.serverfqdn }}/ks/ansible-pull/logrotate -O /etc/logrotate.d/ansible-pull
chown root:root /etc/logrotate.d/ansible-pull
chmod 0644 /etc/logrotate.d/ansible-pull
