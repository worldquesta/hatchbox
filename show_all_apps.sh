#!/usr/bin/env bash

set -e

# Show All Apps (Run this script after "Disable Apps")
#====

site_available='/etc/nginx/sites-available/'
echo '
-----> Nginx configuration - all Apps:'
for line in $(ls $site_available); do
  echo $line
done