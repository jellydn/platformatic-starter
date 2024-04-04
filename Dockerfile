FROM node:20.12.1-alpine as builder
# Build the image
RUN mkdir /app
WORKDIR /app

RUN apk upgrade --no-cache -U && \
  apk add --no-cache git

COPY package.json pnpm-lock.yaml tsconfig.json plugin.ts global.d.ts ./
COPY migrations migrations
COPY types types
COPY services services
COPY plugins plugins
COPY platformatic.prod.db.json platformatic.db.json 

RUN npm install --global pnpm
RUN pnpm install
ENV PORT=3042
ENV PLT_SERVER_HOSTNAME=127.0.0.1
ENV PLT_SERVER_LOGGER_LEVEL=debug
ENV DATABASE_URL=sqlite://.platformatic/data/movies.sqlite
RUN pnpm run build

# Copy the build output
FROM node:20.12.1-alpine
WORKDIR /app
COPY --from=builder /app .

# Setup sqlite viewer
RUN apk add sqlite
ENV DSN "/app/.platformatic/data/movies.db"
COPY db-cli.sh /usr/local/bin/db-cli
RUN chmod +x /usr/local/bin/db-cli

EXPOSE 3042
CMD ["npm", "start"]
