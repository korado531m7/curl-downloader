#!/bin/bash

if command -v curl >/dev/null 2>&1; then

    USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Safari/605.1.15"

    read -p "Download URL: " URL_TARGET
    read -p "Referer (Optional): " URL_REFERER
    read -p "Save Path: " PATH_SAVE

    if [ -z "$URL_REFERER" ]; then
        URL_REFERER=$URL_TARGET
        #echo "NOTICE: Referer has set to $URL_REFERER"
    fi

    if [ -n "$URL_TARGET" ]; then
        if [ -n "$PATH_SAVE" ]; then
            cd "${PATH_SAVE}/"
            curl -A "$USER_AGENT" -e "$URL_REFERER" -O $URL_TARGET
        else
            echo "ERROR: Save path is required"
        fi
    else
        echo "ERROR: Download URL is required"
    fi
    
else
    echo "ERROR: curl is not installed"
fi
