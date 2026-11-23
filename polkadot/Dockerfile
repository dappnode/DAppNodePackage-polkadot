ARG UPSTREAM_VERSION

FROM parity/polkadot:${UPSTREAM_VERSION}  

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# entrypoint.sh starts as root to fix the ownership of restored backup files, then runs the node
# as the image's polkadot user
USER root

# A full DAppNode restore writes the node key into a container that was created but never started,
# so entrypoint.sh has not created the key's folder yet. Docker copies the image's /data into a new,
# empty volume when it creates the container, so the folder must already exist in the image.
RUN install -d -o polkadot -g polkadot /data/chains /data/chains/polkadot /data/chains/polkadot/network

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
