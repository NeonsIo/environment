#!/bin/bash

wget $(curl -s 'https://circleci.com/api/v1/project/NeonsIo/collector/latest/artifacts?circle-token=d7b98a6d9f1131fe24f2fa93b68d9bec39548386&branch=master&filter=successful' | jq -r '.[] | select(.url | contains("Collector-assembly")) | .url') -O /collector.jar