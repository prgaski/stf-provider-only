FROM debian:bookworm AS node
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nodejs npm

FROM node AS deps
COPY --link ./package.json ./package-lock.json /app/
COPY --link ./vendor/npm/ /app/vendor/npm/
WORKDIR /app
RUN npm install

FROM node
COPY --link ./ /app/
COPY --link --from=deps /app/node_modules/ /app/node_modules/
ENTRYPOINT ["/app/bin/stf"]
CMD ["provider"]
