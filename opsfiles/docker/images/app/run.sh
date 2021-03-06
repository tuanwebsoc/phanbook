#!/bin/bash
echo ">>Install composer"

if [[ ! -d "vendor" ]]; then
    php composer.phar install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -d "vendor" && "$ENV" == "development" ]]; then
    php composer.phar install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -f "common/config/config.php" ]]; then
    cp common/config/config.example.php common/config/config.php
fi

chmod 777 -R apps/logs
chmod 777 -R apps/cache/volt
chmod 777 -R public/uploads

chown nginx:nginx -R .

