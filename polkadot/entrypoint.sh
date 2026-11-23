#!/bin/bash

# /data is the polkadot-data volume. With --chain=polkadot (chain spec id
# "polkadot") the node keeps its libp2p node key in
# /data/chains/polkadot/network/secret_ed25519, which the manifest backs up.
# Create that folder before the node starts so a DAppNode backup restore can
# write the key back even if the node has not generated one yet.
setpriv --reuid=polkadot --regid=polkadot --init-groups mkdir -p /data/chains/polkadot/network

# The container starts as root. A Dappmanager backup restore copies the key in
# as root with mode 0600, which the node (polkadot, uid 1000) cannot read: it
# then refuses to start. Give such files back to polkadot.
find /data/chains/polkadot/network ! -user polkadot -exec chown polkadot:polkadot {} +

# --base-path is explicit because newer parity/polkadot images run as a user
# whose default base path is not /data
exec -c /usr/bin/setpriv --reuid=polkadot --regid=polkadot --init-groups /usr/bin/polkadot \
    --base-path=/data \
    --rpc-external \
    --rpc-port=9933 \
    --ws-external \
    --ws-port=9944 \
    --prometheus-external \
    --chain=polkadot \
    --rpc-cors=all
