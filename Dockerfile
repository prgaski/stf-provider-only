FROM debian:bookworm AS base
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends nodejs npm

FROM base AS build
COPY --link ./ /app/
WORKDIR /app
RUN npm install

FROM base
COPY --link --from=build /app/ /app/
ENTRYPOINT ["/app/bin/stf"]
CMD ["provider"]
