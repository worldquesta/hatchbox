#!/usr/bin/env bash

set -e

# Show Enabled Apps  (Run this script after "Disable Apps")
#====

site_enabled='/etc/nginx/sites-enabled/'
echo '
-----> Nginx configuration - enabled Apps:'
for line in $(ls $site_enabled); do
  echo $line
done