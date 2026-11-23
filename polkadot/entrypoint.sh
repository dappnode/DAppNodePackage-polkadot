#!/bin/bash

# /data is the polkadot-data volume. With --chain=polkadot (chain spec id
# "polkadot") the node keeps its libp2p node key in
# /data/chains/polkadot/network/secret_ed25519, which the manifest backs up.
# Create that folder before the node starts so a DAppNode backup restore can
# write the key back even if the node has not generated one yet.
mkdir -p /data/chains/polkadot/network

# --base-path is explicit because newer parity/polkadot images run as a user
# whose default base path is not /data
exec -c /usr/bin/polkadot \
    --base-path=/data \
    --rpc-external \
    --rpc-port=9933 \
    --ws-external \
    --ws-port=9944 \
    --prometheus-external \
    --chain=polkadot \
    --rpc-cors=all
