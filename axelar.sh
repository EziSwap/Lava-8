#!/bin/bash

RPC_URL="https://tm.axelar.lava.build/lava-referer-7c62b5fc-e25e-448a-862a-1a82dccd1a93/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

axelar_data=$(curl -A UA -x http://91.246.195.110:6879 --proxy-user tihhlvxl:qatvzutcsmo4 -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","id":"1","method":"status"}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi

    echo "$axelar_data" >> "$OUTPUT_DIR/axelar.txt"

    echo "Axelar data fetched and saved to $OUTPUT_DIR/axelar.txt."
else
    echo "Failed to fetch Axelar data."
fi
