#!/bin/bash

USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15"

read -p "enter the url of what you want to download: " URL_TARGET
read -p "enter the referer: " URL_REFERER
read -p "enter the path for saving data: " PATH_SAVE


if [ -n "$URL_TARGET" ]; then
    cd "${PATH_SAVE}/"
    curl -A $USER_AGENT -e $URL_REFERER -O $URL_TARGET
else
    echo "No URL"
fi