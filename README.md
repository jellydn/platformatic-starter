# Welcome to platformatic-starter 👋

![Version](https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)
[![Twitter: jellydn](https://img.shields.io/twitter/follow/jellydn.svg?style=social)](https://twitter.com/jellydn)

> platformatic quick start demo app

[![IT Man - Tech #28 - Platformatic DB - Automatic OpenAPI/GraphQL API generation  [Vietnamese]](https://i.ytimg.com/vi/GqTa8lgVyZI/hqdefault.jpg)](https://www.youtube.com/watch?v=GqTa8lgVyZI)

## ✨ [Demo](https://squalid-legit-wired-expansion.deploy.space/)

## Prerequisites

- Node.js >= v18.17.0 or >= v20.8.0

## Install

```sh
pnpm install
```

## Usage

```sh
pnpm run dev
```

### Microservices

[Platformatic Service](https://github.com/platformatic/platformatic/blob/main/docs/reference/service/introduction.md) in public beta.

```sh
pnpm run service
```

## Deployment

This template comes with two GitHub Actions that handle automatically deploying your app to production environment.

Prior to your first deployment, you'll need to do a few things:

- [Install Fly](https://fly.io/docs/getting-started/installing-flyctl/)

- Sign up and log in to Fly

  ```sh
  fly auth signup
  ```

- Create a new app on Fly:

  ```sh
  fly apps create platformatic-starter
  ```

- Create a new [GitHub Repository](https://repo.new)

- Add a `FLY_API_TOKEN` to your GitHub repo. To do this, go to your user settings on Fly and create a new [token](https://web.fly.io/user/personal_access_tokens/new), then add it to [your repo secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) with the name `FLY_API_TOKEN`.

- Create a persistent volume for the sqlite database for your app. Run the following:

  ```sh
  fly volumes create data --size 1 --app platformatic-starter
  ```

Now that every is set up you can commit and push your changes to your repo. Every commit to your `main` branch will trigger a deployment to your production environment.

## GitHub Actions

We use GitHub Actions for continuous integration and deployment. Anything that gets into the `main` branch will be deployed to production after running tests/build/etc.

## Useful references

- [Quick Start Guide](https://oss.platformatic.dev/docs/getting-started/quick-start-guide)
- [Movie Quotes App Tutorial](https://oss.platformatic.dev/docs/getting-started/movie-quotes-app-tutorial)
- [Add Custom Functionality](https://oss.platformatic.dev/docs/guides/add-custom-functionality/introduction)
- [Deploy to Fly.io](https://oss.platformatic.dev/docs/guides/deployment/deploy-to-fly-io-with-sqlite)
- [GraphQL subscriptions & microservice](https://blog.platformatic.dev/platformatic-v050-graphql-subscriptions-microservice-tool)
- [Platformatic v0.7.0 - New dashboard for Platformatic DB](https://blog.platformatic.dev/platformatic-v070-an-oldnew-dashboard-for-platformatic-db)

## Author

👤 **Dung Huynh**

- Website: https://productsway.com/
- Twitter: [@jellydn](https://twitter.com/jellydn)
- Github: [@jellydn](https://github.com/jellydn)

## Show your support

[![kofi](https://img.shields.io/badge/Ko--fi-F16061?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/dunghd)
[![paypal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/dunghd)
[![buymeacoffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dunghd)

Give a ⭐️ if this project helped you!

[![Stargazers repo roster for @jellydn/platformatic-starter](https://reporoster.com/stars/jellydn/platformatic-starter)](https://github.com/jellydn/platformatic-starter/stargazers)
