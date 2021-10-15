# stage
FROM ghost as ghost-storage-github
WORKDIR $GHOST_INSTALL
RUN yarn add "ghost-storage-github"

# build
FROM ghost
COPY --chown=node:node --from=ghost-storage-github $GHOST_INSTALL/node_modules $GHOST_INSTALL/current/node_modules
COPY --chown=node:node --from=ghost-storage-github $GHOST_INSTALL/node_modules/ghost-storage-github $GHOST_INSTALL/current/core/server/adapters/storage/ghost-storage-github
EXPOSE 2368
