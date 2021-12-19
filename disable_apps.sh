#!/usr/bin/env bash

set -e

#Disable Apps and fix Nginx structure 
#Show welcome page if domain not exist without redirect to next domain for example:
# - domain quest-stars2.ru NOT exist and domain quest-stars.ru exist 
# - and both domain contain equally type A at DNS server
# - then when open quest-stars2.ru, but first available domain is opened by existing type A DNS
#====

#------APPS FOR DISABLE vvv
sites_disabled=(fragrant-pond-2478  n400.hatchboxapp.com)
#------APPS FOR DISABLE ^^^

site_enabled_dir='/etc/nginx/sites-enabled/'
sites_available_dir='/etc/nginx/sites-available/'
site_backup_dir='/etc/nginx/sites-buckup/'

# Backup configuration for configs rewritable
if ! [ -d $site_backup_dir ]; then
echo '
-----> Nginx configuration - create backup folder...'
  mkdir $site_backup_dir
fi

# Get only files without symbol links
echo '
-----> Nginx configuration - fix Nginx structure...'
for site in $(find $site_enabled_dir -mindepth 1 ! -type l); do
  cp $site $site_backup_dir
  cp $site $sites_available_dir
done
rm -f $site_enabled_dir*

# Enable sites
echo '
-----> Nginx configuration - enable all sites except disabled list...'
# sites_disabled+=(default)
for site in $(ls $sites_available_dir); do
  if ! [[ " ${sites_disabled[*]} " =~ " ${site} " ]]; then
    ln -s $sites_available_dir$site $site_enabled_dir$site
  fi
done

systemctl reload nginx