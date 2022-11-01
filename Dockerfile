FROM jellydn/alpine-nodejs:18 as builder
# Build the image
RUN mkdir /app
WORKDIR /app

RUN apk upgrade --no-cache -U && \
  apk add --no-cache git

COPY package.json yarn.lock tsconfig.json plugin.ts platformatic.db.json global.d.ts ./
COPY migrations migrations
COPY types types
COPY services services

RUN yarn install
ENV NODE_ENV=production

EXPOSE 8080
CMD ["yarn", "start"]
