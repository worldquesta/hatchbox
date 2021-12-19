  
  if ! test -f ../../shared/config/config.yml; then
    echo '
-----> Configuration app shared not found. Copy blank app config file to config/config.yml ...'
    cp config/config.yml.github-actions ../../shared/config/config.yml
  fi

  if ! test -f ../../shared/config/database.yml; then
    echo '
-----> Configuration database not found. Copy blank database config file to config/database.yml ...'
    cp config/database.example.yml ../../shared/config/database.yml
  fi

  if ! test -f config/config.yml; then
    echo '
-----> Configuration app localy not found. Link alias from shared app config file to config/config.yml ...'
    ln -s $(realpath ../../shared/config/config.yml) $(pwd)/config/config.yml
  fi

  if ! test -f config/database.yml; then
    echo '
-----> Configuration database localy not found. Link alias from shared database config file to config/database.yml ...'
    ln -s $(realpath ../../shared/config/database.yml) $(pwd)/config/database.yml
  fi