FROM jellydn/alpine-nodejs:18 as builder
# Build the image
RUN mkdir /app
WORKDIR /app

RUN apk upgrade --no-cache -U && \
  apk add --no-cache git

COPY package.json yarn.lock tsconfig.json plugin.ts global.d.ts ./
COPY migrations migrations
COPY types types
COPY services services
COPY platformatic.prod.db.json platformatic.db.json 

RUN yarn install
ENV PORT=3042
ENV PLT_SERVER_HOSTNAME=127.0.0.1
ENV PLT_SERVER_LOGGER_LEVEL=debug
ENV DATABASE_URL=sqlite://.platformatic/data/movies.db
RUN yarn build

# Copy the build output
FROM jellydn/alpine-nodejs:18
WORKDIR /app
COPY --from=builder /app .

# Setup sqlite viewer
RUN apk add sqlite
ENV DSN "/app/.platformatic/data/movies.db"
COPY db-cli.sh /usr/local/bin/db-cli
RUN chmod +x /usr/local/bin/db-cli

EXPOSE 8080
CMD ["yarn", "start"]
