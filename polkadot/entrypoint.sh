#!/bin/bash

exec -c /usr/bin/polkadot \
    --rpc-external \
    --rpc-port=9933 \
    --ws-external \
    --ws-port=9944 \
    --prometheus-external \
    --chain=polkadot \
    --rpc-cors=all
