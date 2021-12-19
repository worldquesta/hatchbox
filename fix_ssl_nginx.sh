#!/usr/bin/env bash

set -e

#Fix SSL redirection Nginx
#====

site_enabled='/etc/nginx/sites-enabled/'

for file in $(ls $site_enabled); do

  if ! grep -q 'X-Forwarded-Ssl on' $site_enabled$file; then
    echo '
-----> In Nginx configuration «'$file'» not enable forwarding SSL. Enable this option ...'
    
    # SET Nginx forwarding SSL Options     vvv
    options=$(printf '%s'                                     \
    "\n"                                                      \
    "    proxy_set_header X-Forwarded-Ssl on;\n"              \
    "    proxy_set_header X-Forwarded-Port \$server_port;\n"  \
    "    proxy_set_header X-Forwarded-Host \$host;"           \
    )
    # END SET Nginx forwarding SSL Options ^^^
    rm /tmp/$file
    sed "/proxy_redirect off;/a\\$options" "$site_enabled$file" >> /tmp/$file

    cp /tmp/$file $site_enabled$file

    systemctl reload nginx
  fi

done