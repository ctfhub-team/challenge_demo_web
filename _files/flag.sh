#!/bin/bash

# eval "sed -i 's/CTFHUBFLAG/$FLAG/' /var/www/html/index.php"

mkdir -p /var/www/html/flag_is_here/

echo "<?php // $FLAG" > /var/www/html/flag_is_here/flag_$RANDOM$RANDOM$RANDOM.php

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh