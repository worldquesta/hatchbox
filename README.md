# Hatchbox deploy
## _Scripts for deploy on hatchbox.io_

## Features

- [fix_deploy_script.sh] - Fix deploy script for copy config template files for database and application. Insert this code after `-----> Detected Rails app.` string in created app menu: «Advanced -> Deploy Scripts -> Deploy Script»‎

- [fix_ssl_nginx.sh] - Fix show generated xxxx.hatchbox.com domains for test application if not added self domain.com. Insert this in main menu hatchbox «Scripts -> New Script» and name it as in body script REM for examle `Fix SSL redirection Nginx`‎

- [disable_apps.sh] - Disable Apps. Fix Nginx structure. Show welcome page if domain not exist without redirect to next domain. Detailed description in the file itself. Insert this in main menu hatchbox «Scripts -> New Script» and name it as in body script REM

- [show_enabled_apps.sh] - Same name. Run this script after "Disable Apps". Insert this in main menu hatchbox «Scripts -> New Script» and name it as in body script REM

- [show_all_apps.sh] - Same name. Run this script after "Disable Apps". Insert this in main menu hatchbox «Scripts -> New Script» and name it as in body script REM
